This Java enterprise project is designed to operate within a highly available and scalable AWS infrastructure. At its core, the project leverages Bash scripting as a crucial tool for seamlessly incorporating private IP addresses into our Ansible inventory file. This dynamic process ensures the automatic inclusion of newly provisioned instances from our Auto Scaling Group.

Aligned with contemporary DevOps best practices, the project places a strong emphasis on automation, scalability, high availability, and resilience. It facilitates collaborative management, allowing both developers and operators to streamline and enhance the entire lifecycle of the Java application. From the initial development phase to deployment, the project harnesses the robust capabilities of AWS infrastructure.

The architectural diagram below provides a detailed breakdown of the project's structure, highlighting its intricate components and how they interact within the AWS environment.
![Untitled (3)](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/1e60e1c3-7e7e-479d-9c14-fd338ceca41e)
In this project, a Jenkinsfile has been utilized to precisely articulate each stage of our continuous integration/continuous delivery (CI/CD) pipeline. This Jenkinsfile serves as a comprehensive blueprint, explicitly delineating the various phases and steps involved in the automated workflow.

Below are the steps taking in deploying this project 

Step 1: we cd into our vault initialize and then we apply 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/2089123b-5ba8-4150-b754-7d67a339e4b4)
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/53a21f69-491f-4216-a0ef-e957fc19c4a5)
step 2 : ssh into your ubuntu server using your ip address that has been outputed 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/062b5cb9-1065-4b19-89e9-3b8ca2da49a5)
step 3:initalize your vault server 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/12638f5a-79d5-43eb-98cf-394235afcc9b)
step 4: copy the new token generated and edit it on your root provider.tf 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/6615d8fc-d3f8-4290-a09d-02a2acb69f59)
step 5: log into your vault server using the token generated
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/61337616-2b6e-4710-98c2-e60e86e0cce3)
step 6: enables the Key-Value (kv) secrets engine at the specified path (secret). 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/b98edf39-c9d2-47bd-98d2-b4459dacfaa6)
step 7:sets the values for the keys username and password in the secret/database path in Vault
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/af302a83-a84b-4407-916f-4916ed0f8cc7)
step 8: open a new terminal and initalize and apply your modules 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/e8f7fe64-56bd-4df5-b8cb-72bafef04b54)
you will have all your outputs displayed in this format 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/fa6325af-7f89-4eb1-a66f-3562becc6c2c)
step 9 :next you need to open a new terminal where you ssh into your bastion host to be able to access your jenkins because it has a private address 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/603b99d9-f81d-4b0a-9d1f-0da71d70cc41)
step 10: now you can ssh into your jenkins 
![image](https://github.com/Sophia-Ikwuneme/Ansible-autodiscovery-project/assets/146546195/5de242d8-7067-45a7-9738-1b9e46b8f5f0)
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





