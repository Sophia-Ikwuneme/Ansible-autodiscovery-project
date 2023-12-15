Anisble-Auto-Discovery

The Java enterprise project described herein is meticulously crafted to operate seamlessly within an AWS infrastructure designed for high availability and scalability. The project strategically employs Bash scripting as an integral tool, facilitating the smooth integration of private IP addresses into the Ansible inventory file. This dynamic process ensures the automatic inclusion of newly provisioned instances originating from our Auto Scaling Group.

Aligned with contemporary DevOps best practices, the project places a significant emphasis on key pillars such as automation, scalability, high availability, and resilience. This comprehensive approach enables collaborative management, empowering both developers and operators to streamline and enhance the entire lifecycle of the Java application, from its developmental phase to deployment. The project harnesses the robust capabilities of AWS infrastructure to achieve optimal results.

Architectural Diagram

The architectural diagram provides a detailed breakdown of the project's structure, elucidating its intricate components and their interactions within the AWS environment

![Untitled (3)](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/1e60e1c3-7e7e-479d-9c14-fd338ceca41e)

Jenkinsfile

The Jenkinsfile serves as a comprehensive blueprint, precisely defining each stage of the continuous integration/continuous delivery (CI/CD) pipeline. This file outlines the various phases and steps involved in the automated workflow, providing clarity and transparency.

Deployment Steps

Step 1: Vault Initialization and Application
Navigate to the vault initialization directory and apply the necessary configurations.


bash
cd vault
terraform init
terraform apply


Step 2: SSH into Ubuntu Server
SSH into the Ubuntu server using the provided IP address.

bash
ssh ubuntu@<your-ip-address>


Step 3: Initialize Vault Server
Initialize the Vault server.

bash
vault operator init

Step 4: Copy New Token
Copy the newly generated token and edit the root provider.tf file.

Step 5: Log into Vault Server
Log into the Vault server using the generated token.

bash
Copy code
vault login <your-generated-token>

Step 6: Enable Key-Value (KV) Secrets Engine
Enable the KV secrets engine at the specified path (secret).

bash
Copy code
vault secrets enable -path=secret kv

Step 7: Set Values in Vault
Set values for the keys 'username' and 'password' in the 'secret/database' path in Vault.

bash
Copy code
vault kv put secret/database username=admin password=admin123

Step 8: Initialize and Apply Modules
Open a new terminal and initialize and apply the Terraform modules.

bash
terraform init
terraform apply

Step 9: SSH into Bastion Host
SSH into the Bastion host to access Jenkins.

bash
ssh ec2-user@<bastion-ip>

Step 10: SSH into Jenkins

bash 
ssh ec2-user@<jenkins-ip>
next we need to cat the part giving on out jenkins to be able to get our password 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/b739661e-2ff4-4734-9474-de07ee2c75aa)
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/151ee478-9cdd-41e6-94c7-844427af7585)
when we input our password next we go for the option of installing suggested pluggins
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/cba4b58f-1396-4d64-8937-a241efe17d14)
fill up the following and hit save and continue 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/4b135210-b43e-4143-b8d0-08eff11a99d9)
step 11: we need to set up a new terminal go into our nexus repo and cat the part provided to us to get the password 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/fc8c325c-5f89-4983-9172-2ff31660ac15)
step 12:install pluggings which will include ssh-agent,maven and sonarqube 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/5e046ae6-4e42-4dce-8260-5a6b2fab63c1)
make sure all are installed sucessfully 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/e6e7437c-a0a4-409f-9b68-ae25cbc86d3a)
step 13: set up your tools starting with JDK installation we can find our version to be used running mvn--version on our jenkins 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/4c0bcd70-f417-44e7-bc2a-89212e4ebf45)
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/d14ca2a4-3737-4f58-919c-5c8ab3d09f44)
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/117811ea-84b6-4e27-b478-f59aec99f7f2)
Apply and save information 
step 14:add all credentials needed
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/1d45cfd3-d909-4d30-9e56-5a9a05d6c689)
step 15: on sonarqube create your webhook that will be used to connect to jenkins and also your token 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/40062952-8326-485f-bc0c-8b862e765213)
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/ff5360bd-81ff-4b17-86d4-1f9e77141d80)
step 16: on nexus create your docker-repo where your docker image will be saved and also add your bearer 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/5c005c2b-9fa7-41b5-b152-2e31c1d4d559)
step 17: add your system set up for sonarqube and attach your credentails 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/786d13e9-f177-48fd-8e6c-8323a1c3e8a8)
step 18:generate your api token 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/8491a5e9-3648-40a7-8878-4455410cb266)
Then attach that to your developers repo by creating a webhook on the developers repo 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/03108ace-9217-4854-8efd-dac58f97cce6)
step 19: we can start building our pipeline 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/b6bd94dd-c2eb-44ec-b705-05954c6863f6)
attach your deveolopers repo where you want jenkins to go and fetch your source code and attach your github credentials then apply save all information 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/e348861a-97db-4a37-949b-dca659ea268e)
step 20: make sure your ansible ip is updated on your jenkinsfile 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/b662108e-296f-4473-9f77-406af0e5112f)
and then you can click on build now and your pipline should start a build
step 21: while the build is going on and the staging environment is completed you will be promted to approve to go to the production environment 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/f8d94a5b-f259-452a-b2fb-87767d15196e)
when your pipline is completed you should have the above 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/7c7218d9-619a-4c55-b08e-ac13daa00af1)
you have successfully deployed the application using jenkins pipeline!
an example of our application running on the staging lb 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/205cc6a0-ada6-47e3-b4c0-d786d45f602c)
an example of our application running on the production lb 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/c942dd7f-c1d9-4545-90bc-0d3d1d993232)
And here is our vault server running on our domain name 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/8ff7abe3-60ad-4e69-9137-e8e3ead8bc81)





