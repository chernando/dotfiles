if status is-interactive
	starship init fish | source

	if type -q zoxide
		zoxide init fish | source
	end

	if type -q bat
		abbr -a --position anywhere -- --help '--help 2>&1 | bat -plhelp'
		abbr -a --position anywhere -- -h     '-h 2>&1 | bat -plhelp'
	end
end

if type -q mise
	mise activate fish | source
end
