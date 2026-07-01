function update --description 'Update everything: dotfiles (chezmoi), OS packages (brew/pacman+paru), mise tools'
    function _update_step
        set_color --bold cyan
        echo "▶ $argv"
        set_color normal
    end

    # 1. Dotfiles: pull the chezmoi source and apply (also re-runs the package
    #    install script if the package list changed).
    if type -q chezmoi
        _update_step "chezmoi (dotfiles)"
        chezmoi update
    end

    # 2. OS packages — native package manager per platform.
    switch (uname)
        case Darwin
            if type -q brew
                _update_step "Homebrew"
                brew update; and brew upgrade; and brew cleanup
            end
        case Linux
            if type -q paru
                _update_step "paru (pacman + AUR)"
                paru -Syu
            else if type -q pacman
                _update_step "pacman"
                sudo pacman -Syu
            end
    end

    # 3. mise-managed runtimes + CLI tools (mise itself is upgraded above via the
    #    OS package manager, so only the tools are bumped here).
    if type -q mise
        _update_step "mise tools"
        mise upgrade
    end

    # 3b. uv-managed Python CLIs (e.g. pdm) — kept current independently of the
    #     mise python pin.
    if type -q uv
        _update_step "uv tools"
        uv tool upgrade --all
    end

    # 4. Light extras (no-ops if absent).
    if type -q gh
        _update_step "gh extensions"
        gh extension upgrade --all
    end
    if type -q tldr
        _update_step "tldr cache"
        tldr --update
    end

    set_color --bold green
    echo "✓ update complete"
    set_color normal
end
