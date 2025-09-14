function chezmoi
	if test "$argv[1]" = "cd"
		cd (command chezmoi source-path)
	else
		command chezmoi $argv
	end
end