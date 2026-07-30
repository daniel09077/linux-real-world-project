#!/bin/bash
echo "Setting up work environment...."
sleep 5
#sets the path to parent organization structure
base_path="/linux-sim2-env/company"
#-----
#-----CREATE DEPARTMENT BLOCK
#Array to declare the deaprtments in the organization
departments=("engineering" "finance" "hr" "management" "shared")
#Function to create the department individually
createdeparment(){
    sudo mkdir -p "${base_path}/$1"
}
#For loop to call the create department function
for depart in "${departments[@]}" 
do 
    createdeparment "${depart}"
done

#-----
#-----CREATE DEPARTMENT DONE
sleep 5
#-----
#-----CREATE GROUP BLOCK
echo "Creating groups for the organization"
groups=("developers" "finance" "hr" "management" "shared")
creategroup(){
    sudo groupadd "$1"
}
for group in "${groups[@]}"
do 
    creategroup "${group}"
done
#-----
#-----CREATE GROUP DONE
sleep 5
#-----
#-----CREATE USERS BLOCK
echo "Creating users for the organization"
users=("alice" "john" "mike" "sarah" "david" "grace" "linda" "ceo" "manager")
createuser(){
    sudo useradd -m -g "$1" -s /bin/bash "$2"
}
for user in "${users[@]}"
do 
    createuser "${group}" "$user"
done
#-----
#-----CREATE USERS DONE
sleep 5
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
sleep 5
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
    for file in "${department_files[$d]}"
    do  
        createfiles "${d}" "${file}"
    done
done
