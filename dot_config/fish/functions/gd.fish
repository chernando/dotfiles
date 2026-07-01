function gd --description 'gh dash with Solarized auto light/dark (follows OS appearance)'
    # Pick palette from current OS appearance. `defaults` is macOS-only; on Linux
    # we fall back to light (or honor THEME_APPEARANCE if the user exports it).
    # The key is ABSENT in light mode, so capture into a quoted var — an inline
    # (cmd substitution) would drop the empty arg and make `test` error.
    set -l appearance $THEME_APPEARANCE
    if test -z "$appearance"; and type -q defaults
        set appearance (defaults read -g AppleInterfaceStyle 2>/dev/null)
    end
    set -l mode light
    test "$appearance" = Dark; and set mode dark

    # Name the terminal tab for the app, not the two-letter alias. gh-dash is a
    # full-screen TUI that sets no title of its own, so the tab would otherwise
    # read "gd ~"; OSC 2 makes it "gh-dash". fish's fish_title resets it on the
    # next prompt, so no teardown is needed.
    isatty stdout; and printf '\e]2;gh-dash\e\\'

    # Merge the base config (sections/defaults) with the mode's colors into a
    # private temp config (mktemp: unpredictable name, no clobber / symlink risk).
    # yq (mikefarah v4) loads both docs and sets .theme.colors from the colors
    # file — single Go binary, no language runtime.
    set -l out (mktemp)
    yq eval-all 'select(fileIndex==0) as $base | select(fileIndex==1) as $colors | $base.theme.colors = $colors.colors | $base' \
        $HOME/.config/gh-dash/config.yml $HOME/.config/gh-dash/colors-$mode.yml >$out 2>/dev/null
    or begin
        # Merge failed (e.g. yq absent) — fall back to the static config
        # (light default) rather than break.
        rm -f $out
        gh dash $argv
        return
    end
    gh dash --config $out $argv
    rm -f $out
end
