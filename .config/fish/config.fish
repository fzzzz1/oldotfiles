if status is-interactive
    # Commands to run in interactive sessions can go here
    # ~/.config/fish/config.fish

  starship init fish | source

  fish_vi_key_bindings

  function fish_greeting
    echo Don\'t do evil!
    # echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
  end

  function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
  end
  abbr --add dotdot --regex '^\.\.+$' --function multicd
  
  abbr --add sc sudo systemctl
  abbr --add pc sudo pacman
  abbr --add pr paru
  abbr --add lv lvim
  abbr --add v nvim
  abbr --add l lsd -l
  abbr --add ll lsd -la

  function buds 
    bluetoothctl power on && bluetoothctl connect 40:5E:F6:0D:C3:E2
  end
  abbr --add buds --function buds

  function bose 
    bluetoothctl power on && bluetoothctl connect 2C:41:A1:AE:50:E1
  end
  abbr --add bose --function bose

  function bt-disconnect 
    bluetoothctl disconnect && bluetoothctl power off
  end
  abbr --add bt-disconnect --function bt-disconnect

  abbr --add c clear

end
