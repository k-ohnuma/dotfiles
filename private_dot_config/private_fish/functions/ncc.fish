function ncc
    if test (count $argv) -ne 1
        echo "usage: <contest-name>"
        return 1
    end

    set name $argv[1]
    mise run new $name && cd $name && vim .
end

