#!/bin/bash
echo "Setting up a simple work environment with required groups and users"
sudo mkdir -p linux-sim-env/company{engineering,finance,hr,shared,management}
sudo groupadd developers
sudo groupadd finance 
sudo groupadd hr 
sudo groupadd management
sudo groupadd shared 
echo "Work environment setup alongside required groups"
echo "Creating developer users and assigning them to group 'developers'"
sudo useradd -m -aG developers -s /bin/bash alice
sudo useradd -m -aG developers -s /bin/bash john
sudo useradd -m -aG developers -s /bin/bash mike
echo "Developers users created and assigned to group 'developers'" 
sudo useradd -m -aG finance -s /bin/bash sarah
sudo useradd -m -aG finance -s /bin/bash david
echo "Finance users created and assigned to group 'finance'"
sudo useradd -m -aG hr -s /bin/bash grace
sudo useradd -m -aG hr -s /bin/bash linda
echo "HR users created and assigned to group 'hr'"
sudo useradd -m -aG management -s /bin/bash ceo
sudo useradd -m -aG management -s /bin/bash manager
echo "Management users created and assigned to group 'management'"

echo "Setting permissions for directories"
sudo chown -R :developers /linux-sim-env/company/engineering
sudo chmod -R 2770 /linux-sim-env/company/engineering
sudo chown -R :finance /linux-sim-env/company/finance
sudo chmod -R 2770 /linux-sim-env/company/finance
sudo chown -R :hr /linux-sim-env/company/hr
sudo chmod -R 2770 /linux-sim-env/company/hr
sudo chown -R :management /linux-sim-env/company/management
sudo chmod -R 2770 /linux-sim-env/company/management
sudo chown -R :shared /linux-sim-env/company/shared
sudo chmod -R 2770 /linux-sim-env/company/shared
echo "Permissions set for directories"




