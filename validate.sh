#!/bin/bash
#--- Check path is created successfully or not
base_path="linux-sim2-env/company"
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
done
#----

#---- check users and groups created or not
echo "Creating groups for the organization"
declare -A user_groups
user_groups["developers"]="alice john mike"
user_groups["finance"]="sarah david"
user_groups["hr"]="grace linda"  
user_groups["management"]="ceo manager"
secgroup="shared"
for users in "${!user_groups[@]}"
do 
    if id -nG "$users" | grep -qw "$secgroup"; then
        echo "[PASS] $user is a member of $secgroup group."
    else
        echo "[FAIL] $user is not a member of $secgroup group."
    fi
done
