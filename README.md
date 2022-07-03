# Challenge1

Challenge #1
 
A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these resources. Please remember we will not be judged on the outcome but more focusing on the approach, style and reproducibility.

_____________________________________________________________________________________________________________________________________

3-TIER ENVIRONMENT: 

-->A common kind of client-server system used in applications is a three-tier architecture. The data layer, application layer, and presentation layer are the three tiers that is used to split the architecture. In between the client and the database, there is a "middle tier” The application layer, which is the intermediate layer, it also processes the major operations and business logic of the system. 

____________________________________________________________________________________________________________________________________
Prerequisites to deploy the infrastructure - 

•	AZURE CLI should be installed
•	Terraform should be installed

AZURE CLI: A collection of commands known as the Azure command-line interface (Azure CLI) is used to create and manage Azure resources. With an emphasis on automation, the Azure CLI is accessible across all Azure services

TERRAFORM: HashiCorp's Terraform is an open-source infrastructure as code software solution. Users use JSON, or alternatively the declarative configuration language known as HashiCorp Configuration Language, to define and provision data centre infrastructure.

____________________________________________________________________________________________________________________________________

RE-USABILITY:
These codes can be reused every time whenever a 3-tier architecture needs to be built, just by updating the variables.

____________________________________________________________________________________________________________________________________

SOLUTION:

Following is the structure of the Terraform resources.

main.tf	            : The main entry point for Terraform resources.
vars.tf 		        : This file contains declarations for variables. 
output.tf 	        : There are declarations for outputs in this file
terraform.tfvars  	: The file to pass the terraform variables values

Resources directory contains the module files.
Module: A module is a storage unit for numerous resources utilised in conjunction. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture

For the solution, five modules have been created and used:

resourcegroup - creating resourcegroup
networking - creating azure virtual network and required subnets
securitygroup - creating network security group, setting desired security rules and associating them to subnets
compute - creating availability sets, network interfaces and virtual machines
database - creating database server and database

All of the stacks are arranged in the resources folder, while the variables are stored under terraform.tfvars
To run the code you need to append the variables in the terraform.tfvars

____________________________________________________________________________________________________________________________________

Deployment Steps

Run Powershell as Administrator and execute the below commands:

1. terraform init : used to initialize a working directory containing Terraform configuration files

2. terraform plan : used to create an execution plan

3. terraform validate : validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc

4. terraform apply : used to apply the changes required to reach the desired state of the configuration


______________________________________________________________________________________________________

Using the mentioned solution,  built a 3-Tier environment on Microsoft Azure in the location: Central India which can be customized using variable.

This solution deploys:

Resource Group : 3-tier-architecture
Virtual Network : vnet01
Virtual machines : app-vm and  web-vm
SQL server : sql-primary-db-shiv, 
SQL database: db (sql-primary-db-shiv/db), 
Network Interface : app-network, web-network which are linked respectively with app-vm and  web-vm, 
Network security group for each subnet:  app-nsg, db-nsg and web-nsg, 
Disk : app-disk, web-disk which are added to app-vm and  web-vm respectively and 
Availability set : app_availabilty_set, web_availabilty_set for respective VMs.

______________________________________________________________________________________________________

BUILT TOPOLOGY 

![image](https://user-images.githubusercontent.com/108597286/177026868-beab3d21-4ac2-4acc-8999-93b30064805c.png)


LIST OF RESOURCES

![image](https://user-images.githubusercontent.com/108597286/177026894-fd931e91-c88e-45e0-9208-da3085731c73.png)

![image](https://user-images.githubusercontent.com/108597286/177026898-1566f2d2-98b8-40e6-9ae5-3e4b29b9ecad.png)
















