if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path -g ~/go/bin
    alias internaldisplay="bash ~/dev/bash/internal_switch.sh"
    alias externaldisplay="bash ~/dev/bash/external_switch.sh"
end
