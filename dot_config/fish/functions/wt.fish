function wt --description 'git worktree helper — create/list/remove sibling worktrees'
    # Resolve the *canonical* repo (the main worktree) no matter which worktree
    # we're standing in, so sibling paths are always <repo>-<suffix>, never
    # <current-worktree>-<suffix>.
    set -l common (git rev-parse --path-format=absolute --git-common-dir 2>/dev/null)
    if test -z "$common"
        echo "wt: not inside a git repository" >&2
        return 1
    end
    set -l main (path dirname $common)
    set -l repo (path basename $main)
    set -l parent (path dirname $main)

    switch "$argv[1]"
        case -h --help help
            echo "wt                       list worktrees"
            echo "wt <suffix> [<branch>]   create ../$repo-<suffix> (branch defaults to <suffix>) and cd in"
            echo "wt rm [<suffix>|<path>]  remove a worktree (defaults to the current one)"
            return 0
        case '' ls list
            git worktree list
        case rm remove
            set -l target $argv[2]
            if test -z "$target"
                set target (git rev-parse --show-toplevel)
                cd $main # step out before removing the worktree we're in
            else if not string match -q '/*' -- $target
                set target $parent/$repo-$target
            end
            git worktree remove $target
        case '*'
            set -l suffix $argv[1]
            set -l branch $argv[2]
            test -n "$branch"; or set branch $suffix
            set -l dest $parent/$repo-$suffix
            if git show-ref --verify --quiet refs/heads/$branch
                git worktree add $dest $branch # attach existing local branch
            else if git show-ref --verify --quiet refs/remotes/origin/$branch
                git worktree add --track -b $branch $dest origin/$branch # track remote
            else
                git worktree add -b $branch $dest # new branch off HEAD
            end
            and cd $dest
    end
end
