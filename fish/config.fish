if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path -g ~/go/bin
    fish_add_path -g ~/.cargo/bin
    alias internaldisplay="bash ~/dev/bash/internal_switch.sh"
    alias externaldisplay="bash ~/dev/bash/external_switch.sh"
    alias gods="~/Games/gods-unchained/drive_c/users/mario/Desktop/Gods Unchained.lnk"
end

function gnvim
    ~/scripts/gnvim.sh $argv
end
