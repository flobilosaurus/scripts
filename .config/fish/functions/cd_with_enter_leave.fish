function cd_with_enter_leave
    set args (test "$argv" = ""; and echo "."; or echo $argv)

    # run leave script
    if test -e ./.leave.sh
        echo "leave script found"
        chmod +x ./.leave.sh
        ./.leave.sh
    end
    
    # leave
    builtin cd $args

    # check for error
    if test $status != 0
        exit $status
    end

    # run enter script
    if test -e ./.enter.sh
        echo "enter script found"
        chmod +x ./.enter.sh
        ./.enter.sh
    end
end
