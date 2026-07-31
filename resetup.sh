#!/bin/bash
cd ..
echo "Setting up work environment...."
sleep 0.5
#sets the path to parent organization structure
base_path="linux-sim2-env/company"
echo "BASE PATH = $base_path"

#-----
#-----CREATE DEPARTMENT BLOCK
#Array to declare the deaprtments in the organization

departments=("engineering" "finance" "hr" "management" "shared")
#Function to create the department individually
createdeparment(){
    echo "Creating: ${base_path}/$1"
    sudo mkdir -p "${base_path}/$1"

}
#For loop to call the create department function
for depart in "${departments[@]}" 
do 
    createdeparment "${depart}"
done

#-----
#-----CREATE DEPARTMENT DONE
sleep 0.5
#-----
#-----CREATE GROUP BLOCK
echo "Creating groups for the organization"
declare -A user_groups
user_groups["developers"]="alice john mike"
user_groups["finance"]="sarah david"
user_groups["hr"]="grace linda"  
user_groups["management"]="ceo manager"

createuser(){
    sudo useradd -m -g "${1}" -s /bin/bash "${2}"
}
creategroup(){
    sudo groupadd "${1}"
}
for usergroup in "${!user_groups[@]}"
    do 
        creategroup "${usergroup}"
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
#-----
#-----CREATE USERS DONE
sleep 0.5
#-----
#-----SET PERMISSIONS BLOCK
echo "Setting permissions for directories"
createperm(){
    sudo chown -R :"${1}" "${2}/${3}" && sudo chmod -R 2770 "${2}/${3}"
}

for index in "${!groups[@]}"
do 
    createperm "${groups[${index}]}" "${base_path}" "${departments[${index}]}"
done
#-----
#-----CREATE DIRECTORIES AND SET PERMISSION DONE
sleep 0.5
#-----
#-----CREATE FILES BLOCK
echo "Creating files in respective directories"
declare -A department_files 
department_files["engineering"]="backend.py frontend.js README.md"
department_files["finance"]="salary.xlsx budget.xlsx tax.pdf announcement.txt company_calender.pdf"
department_files["hr"]="employees.csv leave_policy.pdf"    
department_files["management"]="strategy.pdf meeting_notes.txt"
department_files["shared"]="shared_doc.txt annoucement.txt company_calender.pdf"

createfiles(){
    sudo touch "${base_path}/${1}/${2}"
}

for d in "${!department_files[@]}"
do 
    for file in ${department_files[$d]}
    do  
        createfiles "${d}" "${file}"
    done
done
