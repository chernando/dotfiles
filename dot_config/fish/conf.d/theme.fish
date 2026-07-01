# Keep CLI tools in sync with the OS light/dark appearance (Solarized).
#
# Appearance detection is macOS-only (`defaults read -g AppleInterfaceStyle`).
# On Linux there's no universal dark-mode signal, so we guard the call and fall
# back to light — overridable by exporting THEME_APPEARANCE=Dark in a local conf.
#
# Most tools already track the terminal on their own and need nothing here:
#   • glow  — default style is "auto" (detects the terminal background)
#   • fzf   — inherits the terminal's ANSI palette
#   • eza   — inherits ANSI colors / LS_COLORS
#
# bat, delta and difftastic are the exceptions and are steered explicitly:
#   • bat   — via BAT_THEME (replaces the macOS-only --theme=auto:system)
#   • delta — via git's env-based config injection (GIT_CONFIG_*), so we never
#             hard-code light/dark in ~/.gitconfig
#   • difft — via DFT_BACKGROUND
# Detected once per interactive shell.
if status is-interactive
    # macOS reports the system appearance; `defaults` is absent on Linux.
    set -l _appearance $THEME_APPEARANCE
    if test -z "$_appearance"; and type -q defaults
        set _appearance (defaults read -g AppleInterfaceStyle 2>/dev/null)
    end

    set -l _light true
    set -l _theme "Solarized (light)"
    set -l _bg light
    if test "$_appearance" = Dark
        set _light false
        set _theme "Solarized (dark)"
        set _bg dark
    end

    # bat
    set -gx BAT_THEME $_theme

    # delta — inject delta.light / delta.syntax-theme via git's env-based config.
    # Claim a base index after any pre-existing GIT_CONFIG_* entries (don't clobber
    # other tools), and remember it in an exported sentinel so nested shells reuse
    # the same slots instead of growing GIT_CONFIG_COUNT on every shell.
    if not set -q __theme_git_config_base
        set -l n 0
        if set -q GIT_CONFIG_COUNT; and string match -qr '^[0-9]+$' -- $GIT_CONFIG_COUNT
            set n $GIT_CONFIG_COUNT
        end
        set -gx __theme_git_config_base $n
        set -gx GIT_CONFIG_COUNT (math $n + 2)
    end
    set -l _b $__theme_git_config_base
    set -gx GIT_CONFIG_KEY_$_b delta.light
    set -gx GIT_CONFIG_VALUE_$_b $_light
    set -gx GIT_CONFIG_KEY_(math $_b + 1) delta.syntax-theme
    set -gx GIT_CONFIG_VALUE_(math $_b + 1) $_theme

    # difftastic (git dft / git dshow). `--color` defaults to auto, which disables
    # all color whenever difft's stdout isn't a real tty (e.g. gh-dash execs the
    # custom diff keybinding with output captured/piped) — DFT_BACKGROUND alone
    # only picks which palette to use, it doesn't force color on. Force it, same
    # as delta.true-color is forced `always` in ~/.gitconfig rather than left auto.
    set -gx DFT_BACKGROUND $_bg
    set -gx DFT_COLOR always
end
