function ls
	if type -q eza
		eza --icons --group-directories-first --color=always $argv
	else
		command ls $argv
	end
end
