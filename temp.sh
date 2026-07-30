#!/bin/bash

declare -A user_groups
user_groups["developers"]="alice john mike"
user_groups["finance"]="sarah david"
user_groups["hr"]="grace linda"  
user_groups["management"]="ceo manager"

createuser(){
    sudo useradd -m -g "${1}" -s /bin/bash "${2}"
}
for usergroup in "${!user_groups[@]}"
    do 
        for user in "${user_groups[$usergroup]}"
        do
            createuser "${usergroup}" "${user}"
        done
    done

shared_users=("alice" "john" "mike" "sarah" "david" "grace" "linda" "ceo" "manager")  
for s in "${shared_users[@]}"
do
    sudo usermod -aG shared "$s" 
done