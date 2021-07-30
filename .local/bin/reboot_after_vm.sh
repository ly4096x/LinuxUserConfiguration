for vm in $(virsh list |grep running |awk '{print $2}'); do
    echo $vm
    virsh shutdown $vm
done

COUNTER=$((10*60))

while virsh list |grep running ; do
    if ! sleep 1; then
        break
    fi

    COUNTER=$((COUNTER-1))
    if ((COUNTER == 0)); then
        break
    fi
done

reboot
