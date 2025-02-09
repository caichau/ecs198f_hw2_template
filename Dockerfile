FROM debian:bookworm 

# Build image:
    # docker buildx build --platform linux/x86_64 -t IMAGENAME .
    # Using FROM --platform=linux/x86_64 debian:bookworm produces FromPlatformFlagConstDisallowed error. 

# Set the working directory to root directory, so we can clone the repo there. 
WORKDIR /

RUN apt-get update          &&\ 
apt-get install -y wget     &&\ 
apt-get install -y git      &&\
mkdir -p ~/miniconda3       &&\
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh &&\
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 &&\
rm ~/miniconda3/miniconda.sh                         &&\
. ~/miniconda3/bin/activate                     &&\
git clone https://github.com/dbarnett/python-helloworld.git 

CMD ["tail", "-f", "/dev/null"]

# docker exec -it CONTAINERID bash
# exit