vboxstart() {
    VBoxManage startvm "$1" --type=headless
}

vboxterm() {
    VBoxManage controlvm "$1" poweroff --type headless
}

_vboxpoweredoffvms() {
    all=("${(@f)$(VBoxManage list vms | grep -Eo '".+"' | tr -d '"')}")
    run=("${(@f)$(VBoxManage list runningvms | grep -Eo '".+"' | tr -d '"')}")
    reply=("${(@)all:|run}")
}

_vboxrunningvms() {
    reply=("${(@f)$(VBoxManage list runningvms | grep -Eo '".+"' | tr -d '"')}")
}

compctl -K _vboxpoweredoffvms vboxstart
compctl -K _vboxrunningvms vboxterm
