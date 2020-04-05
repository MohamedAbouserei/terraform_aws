# Pull base image.
FROM jenkins/jenkins:lts
USER root

RUN \
# Update
apt-get update -y && \
# Install Unzip
apt-get install unzip -y && \
# need wget
apt-get install wget -y && \
# vim
apt-get install vim -y

################################
# Install Terraform
################################

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip

# Unzip
RUN unzip terraform_0.11.11_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version 

################################
# Install python
################################

RUN apt-get install -y python3-pip
#RUN ln -s /usr/bin/python3 python
RUN pip3 install --upgrade pip
RUN python3 -V
RUN pip --version

################################
# Install AWS CLI
################################
RUN pip install awscli --upgrade --user

# add aws cli location to path
ENV PATH=~/.local/bin:$PATH

RUN mkdir -p ~/.aws && touch ~/.aws/credentials 
#run jenkins port
EXPOSE 8080

#copy terrafrom file
COPY configuration.tf /home/configuration.tf
COPY ssh.tf /home/ssh.tf
COPY ec2.tf /home/ec2.tf
COPY rtables.tf /home/rtables.tf
COPY vpc.tf /home/vpc.tf
COPY credentials /home/credentials
