This project utilizes NGINX, Docker, Jenkins, Terraform, and Ansible.
Docker image containing NGINX, a self-signed SSL certificate, and a static site was built locally and pushed to Docker Hub repository.
The Docker image was deployed on an EC2 instance using Jenkins Pipeline.
Jenkins Pipeline was configured to pull from this repository, run Terraform, and then run Ansible.
Terraform provisions an EC2 instance and Ansible installs docker, pulls Docker image from a private Docker Hub repository, and then deploys the Docker image on the EC2 instance provisioned by Terraform.
