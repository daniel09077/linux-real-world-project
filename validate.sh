#!/bin/bash
#--- Check path is created successfully or not
base_path="~/linux-sim2-env/company"
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
for user in ${user_groups[@]}
do 
    if id -nG "$user" | grep -qw "$secgroup"; then
        echo "[PASS] $user is a member of $secgroup group."
    else
        echo "[FAIL] $user is not a member of $secgroup group."
    fi
done

declare -A department_files 
department_files["engineering"]="backend.py frontend.js README.md"
department_files["finance"]="salary.xlsx budget.xlsx tax.pdf announcement.txt company_calender.pdf"
department_files["hr"]="employees.csv leave_policy.pdf"    
department_files["management"]="strategy.pdf meeting_notes.txt"
department_files["shared"]="shared_doc.txt annoucement.txt company_calender.pdf"


for d in "${!department_files[@]}"
do 
   for file in ${department_files[$d]}
   do
    if [ -f "$base_path/$d/$file" ]; then 
        echo "[PASS] $file is created successfully in $d."
    else
        echo "[FAIL] $file is not created in $d."
    fi
done
done

