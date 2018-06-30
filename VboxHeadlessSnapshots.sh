#!/bin/bash
VBOXUSR="vbox"

# ADD List of VM Names here for Daily Snapshots
declare -a arr=(
        "a2ae119a-ba26-4ff7-bfb7-c0857e2bc9e0"
        "8028742e-4e03-486e-b4cd-3c861b33a213"
        "540bdd79-fb5d-4f78-b367-34332edc177e"
        "98fc0d5f-c39f-483c-9570-a7009afcde57"
        "ccf063e2-11a4-46ef-8e85-af63f39a4b6c"
        "c79d7cec-7a27-4a73-ba71-6b591d5f0678"
        "fede01e4-d30d-4f1f-b85c-95a135178d99"
        "5ac765dd-551e-48bb-b685-06dcad677c15"
        "dbac0da2-0206-4390-9244-d410c2ff53ac"
        "4b1100da-26c0-498c-a29d-67d2d5835e4a"
        "e77d7fe0-d589-4620-b075-52b15329a712"
        "17c58403-cde0-459b-91a9-f414bfbdc678"
        )

# END VM UUID LIST

for VM in "${arr[@]}"
do
        NOW=`date +"%m-%d-%Y%T"`
        sudo -H -u $VBOXUSR bash -c "VBoxManage snapshot $VM take "$NOW" --description 'Machine UUID: $VM'"
        echo " "
done
