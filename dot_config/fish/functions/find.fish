function find
	if type -q fd
		fd $argv
	else
		command find $argv
	end
end
