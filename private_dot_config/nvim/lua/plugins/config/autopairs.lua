local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
  check_ts = true,
})

npairs.add_rules({
  Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(function(opts)
    return opts.char == ">"
  end),
})
