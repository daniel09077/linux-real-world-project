#!/bin/bash
#--- Check path is created successfully or not
base_path="/linux-sim2-env/company"
echo "Checking base path created successfully or not"
if [ -d "$base_path" ]; then
    echo "[PASS] Base path created successfully."
else
    echo "[FAIL]Failed to create base path."
fi
#----

#---- check department created or not
departments=("engineering" "finance" "hr" "management" "shared")
for depart in "${departments[@]}"
do 
    if [ -d "$base_path/$depart" ]; then
    echo "[PASS] ${depart} created successfully."
else
    echo "[FAIL]Failed to create ${depart}."
fi
#----

#---- check users and groups created or not
echo "Creating groups for the organization"
declare -A user_groups
user_groups["developers"]="alice john mike"
user_groups["finance"]="sarah david"
user_groups["hr"]="grace linda"  
user_groups["management"]="ceo manager"


for usergroup in "${!user_groups[@]}"
    do 
        for user in "${user_groups[$usergroup]}"
            do
                if id "$user" &>/dev/null; then
                    echo "[PASS] $user exists"
                else
                    echo "[FAIL] $user does not exist"
                fi
        done
done

shared_users=("alice" "john" "mike" "sarah" "david" "grace" "linda" "ceo" "manager")  
for s in "${shared_users[@]}"
do
    if groups "$s" | grep -q "\bshared\b"; then
        echo "[PASS] $s is a member of the shared group"
    else
        echo "[FAIL] $s is not a member of the shared group"
    fi
done