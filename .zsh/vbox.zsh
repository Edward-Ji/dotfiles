vboxstart() {
    VBoxManage startvm "$1" --type=headless
}

vboxterm() {
    VBoxManage controlvm "$1" poweroff --type headless
}

_vboxvms() {
    reply=($(VBoxManage list vms | grep -o "[[:alnum:]-]\+"))
}

_vboxrunningvms() {
    reply=($(VBoxManage list runningvms | grep -o "[[:alnum:]-]\+"))
}

compctl -K _vboxvms vboxstart
compctl -K _vboxrunningvms vboxterm
