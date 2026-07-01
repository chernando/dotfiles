function gprune --description 'Delete local branches whose upstream is gone (squash-merge cleanup)'
    git fetch --prune
    set -l current (git rev-parse --abbrev-ref HEAD)
    # `[gone]` upstream = the remote branch was deleted (merged via squash). Those
    # local commits never landed on main verbatim, so `git branch -d` refuses them;
    # -D is required, hence the explicit confirmation below.
    set -l gone
    for line in (git for-each-ref --format='%(refname:short)|%(upstream:track)' refs/heads)
        set -l parts (string split '|' -- $line)
        if test "$parts[2]" = '[gone]'; and test "$parts[1]" != "$current"
            set -a gone $parts[1]
        end
    end
    if test (count $gone) -eq 0
        echo "gprune: no branches with a gone upstream."
        return 0
    end
    printf '  %s\n' $gone
    read -l -P "Delete these "(count $gone)" branch(es)? [y/N] " ans
    if test "$ans" = y -o "$ans" = Y
        git branch -D $gone
    else
        echo "gprune: aborted."
    end
end
