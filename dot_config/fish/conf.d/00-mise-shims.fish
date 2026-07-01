# Prepend mise's shim dir to PATH as early as possible. This conf.d snippet
# sorts before every other one (00-) and runs before config.fish, so
# mise-managed binaries resolve in conf.d probes, non-interactive shells,
# shebang scripts, and GUI-launched terminals — before any `type -q` runs.
#
# config.fish later runs `mise activate`, which strips this shim dir and
# substitutes the real tool paths; mise documents combining the two as safe.
#
# Guarded with `test -d` (not `type -q mise`) so it's a silent no-op on a
# machine where mise isn't installed yet — never errors a fresh shell.
if test -d $HOME/.local/share/mise/shims
    fish_add_path --global --prepend $HOME/.local/share/mise/shims
end

# `uv tool` / pipx install CLIs (e.g. pdm) here. Put it on PATH the same way and
# this early, so those tools resolve everywhere too. fish_add_path skips it if
# the dir doesn't exist yet, so this is safe on a fresh machine.
fish_add_path --global --append $HOME/.local/bin
