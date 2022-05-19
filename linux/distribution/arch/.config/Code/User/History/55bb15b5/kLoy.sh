#!/bin/bash
function date_check() {
    echo " $(date +"%F %R:%S")"
}

function acpi_check() {
    acpi_info=$(acpi -b | awk '{ print $3, $4 }')
    [[ -z "${acpi_info}" ]] && {
        echo " Full"
    } || {
        case "${acpi_info}" in
        *)
            echo "default (none of above)"
            ;;
        esac
    }
}

function vol_check() {
    vol_info=$(pamixer --get-volume 2>>/dev/null)
    [[ -z "${vol_info}" ]] && {
        echo " 100"
    } || {
        if [ "$vol" -gt "70" ]; then
            echo " $vol"
        elif [ "$vol" -lt "30" ]; then
            echo " $vol"
        else
            echo " $vol"
        fi
    }
}

function mem_check() {
    echo $(free --mebi | sed -n '2{p;q}' | awk '{printf (" %2.2fGiB/%2.2fGiB\n", ( $3 / 1024), ($2 / 1024))}')
}

function cpu_check() {
    echo ""
}

function nettf_check() {
    # update() {
    #     sum=0
    #     for arg; do
    #         read -r i <"$arg"
    #         sum=$((sum + i))
    #     done
    #     cache=${XDG_CACHE_HOME:-$HOME/.cache}/${1##*/}
    #     [ -f "$cache" ] && read -r old <"$cache" || old=0
    #     printf %d\\n "$sum" >"$cache"
    #     printf %d\\n $((sum - old))
    # }

    # rx=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
    # tx=$(update /sys/class/net/[ew]*/statistics/tx_bytes)

    # # echo " $rx  $tx"
    echo ""
}

# item_array=("nettf_check" "cpu_check" "mem_check" "vol_check" "acpi_check" "date_check")
item_array=("mem_check" "vol_check" "date_check")

# echo "${status_str}"

while true; do
    status_str=""
    for ((i = 0; i < ${#item_array[*]}; i++)); do
        out="$(${item_array[i]})"
        [[ -n "${out}" ]] && {
            status_str="${status_str}${out}"
        }
        echo $(${#item_array[*]} - 1)
        ((${i} != ${#item_array[*]})) && {
            status_str="${status_str} | "
        }
    done
    xsetroot -name "${status_str}"
    echo "${status_str}"
    sleep 1s
done
