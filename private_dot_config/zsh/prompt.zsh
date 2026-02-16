# プロンプト内で $(...) を動かせるようにする
setopt prompt_subst

autoload -Uz colors
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

colors

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a)'

typeset -g __prompt_last_status=0
typeset -g -a __prompt_last_pipestatus=()

__prompt_capture_status() {
  __prompt_last_status=$?
  __prompt_last_pipestatus=("${pipestatus[@]}")

  (( ${#__prompt_last_pipestatus[@]} == 0 )) && __prompt_last_pipestatus=($__prompt_last_status)
}

__prompt_update_vcs() { vcs_info }

add-zsh-hook precmd __prompt_capture_status
add-zsh-hook precmd __prompt_update_vcs

__prompt_pipestatus() {
  local -a ps
  ps=("${__prompt_last_pipestatus[@]}")

  local i has_nonzero=0
  for i in "${ps[@]}"; do
    (( i != 0 )) && { has_nonzero=1; break }
  done
  (( has_nonzero == 0 )) && return 0

  local joined="${(j:|:)ps}"
  print -n -- " %B%F{red}[${joined}]%f%b"
}

# rootだったら #, それ以外だったら >
__prompt_suffix() {
  (( EUID == 0 )) && print -n -- "#" || print -n -- ">"
}

__prompt_cwd_color_on() {
  (( EUID == 0 )) && print -n -- "%F{red}" || print -n -- "%F{green}"
}

__prompt_pwd() {
  local dirlen
  dirlen=${fish_prompt_pwd_dir_length:-1}

  local path="$PWD"

  if [[ -n "$HOME" && "$path" == "$HOME" ]]; then
    path="~"
  elif [[ -n "$HOME" && "$path" == "$HOME/"* ]]; then
    path="~/${path#$HOME/}"
  fi

  if [[ "$dirlen" == 0 ]]; then
    print -n -- "$path"
    return 0
  fi

  if [[ "$path" == "~" ]]; then
    print -n -- "~"
    return 0
  fi


  local -a parts out
  parts=("${(s:/:)path}")

  local last="${parts[-1]}"

  local is_abs=0
  [[ "$path" == /* ]] && is_abs=1

  if (( is_abs )) && (( ${#parts[@]} <= 2 )) && [[ -z "${parts[2]-}" ]]; then
    print -n -- "/"
    return 0
  fi

  local i p
  for i in {1..$(( ${#parts[@]} - 1 ))}; do
    p="${parts[i]}"

    if (( is_abs )) && (( i == 1 )) && [[ -z "$p" ]]; then
      continue
    fi

    if [[ "$p" == "~" || "$p" == "~"* ]]; then
      out+=("$p")
      continue
    fi

    if [[ "$p" == "." || "$p" == ".." ]]; then
      out+=("$p")
      continue
    fi

    if [[ "$p" == .* && "$p" != ..* ]]; then
      out+=("${p[1,2]}")
      continue
    fi

    out+=("${p[1,$dirlen]}")
  done

  out+=("$last")

  if (( is_abs )); then
    print -n -- "/${(j:/:)out}"
  else
    print -n -- "${(j:/:)out}"
  fi
}

__prompt_vi_mode() {
  [[ -z "${ZVM_MODE-}" ]] && return 0

  local tag color
  case "$ZVM_MODE" in
    "$ZVM_MODE_INSERT")
      tag="I"
      color="green"
      ;;
    "$ZVM_MODE_NORMAL")
      tag="N"
      color="red"
      ;;
    "$ZVM_MODE_VISUAL")
      tag="V"
      color="magenta"   # 紫
      ;;
    "$ZVM_MODE_VISUAL_LINE")
      tag="VL"
      color="magenta"
      ;;
    "$ZVM_MODE_REPLACE")
      tag="R"
      color="yellow"
      ;;
    *)
      tag="?"
      color="white"
      ;;
  esac

  # %B = 太字開始, %b = 太字終了
  print -n -- "%B%F{$color}[${tag}]%f%b "
}

if typeset -p zvm_after_select_vi_mode_commands >/dev/null 2>&1; then
  __zvm_prompt_redraw() { zle reset-prompt }
  zvm_after_select_vi_mode_commands+=(__zvm_prompt_redraw)
fi



PROMPT='$(__prompt_vi_mode)%{$(__prompt_cwd_color_on)%}%n%f@%m %{$(__prompt_cwd_color_on)%}$(__prompt_pwd)%f${vcs_info_msg_0_}$(__prompt_pipestatus)$(__prompt_suffix) '

