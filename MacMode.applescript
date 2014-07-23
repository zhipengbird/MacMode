on run {input, parameters}

	-- Display dialog box to choose mode
	display dialog "Hello Darling! Which Mac mode you want?" buttons {"Travel", "Desktop"}
	set vButton to button returned of result as string

	-- First button reply (Travel) and then action
	if vButton is "Travel" then
		tell application "DavMail"
			quit
		end tell
		tell application "Dropbox"
			quit
		end tell
		tell application "OneDrive"
			quit
		end tell
		-- Turn off wifi
		do shell script "/usr/sbin/networksetup -setairportpower en0 off"
		-- Turn off bluetooth (package BLUEUTIL)
		do shell script "/usr/local/bin/blueutil off"
	else
		--Second button reply (Desktop) and then action
		if vButton is "desktop" then
			tell application "DavMail"
				activate
			end tell
			tell application "Dropbox"
				activate
			end tell
			tell application "OneDrive"
				activate
			end tell
			-- Turn on wifi
			do shell script "/usr/sbin/networksetup -setairportpower en0 on"
			-- Turn on bluetooth (package BLUEUTIL)
			do shell script "/usr/local/bin/blueutil on"
		end if
	end if

	-- End
	set variableWithSoundName to "Hero"
	display notification vButton & " mode activated" with title "Mac mode" sound name variableWithSoundName

end run
