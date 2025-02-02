FROM debian:bookworm

# Set the working directory to root directory, so we can clone the repo there. 
WORKDIR /

RUN apt-get update          &&\ 
apt-get install -y wget     &&\ 
apt-get install -y git      &&\
mkdir -p ~/miniconda3       &&\
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O ~/miniconda3/miniconda.sh &&\
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3    &&\
rm ~/miniconda3/miniconda.sh                            &&\
. ~/miniconda3/bin/activate                             &&\
git clone https://github.com/dbarnett/python-helloworld.git 

CMD ["tail", "-f", "/dev/null"]


# Just checking to see if it's there. 
#CMD ["ls"]
#CMD ["ls", "/root/miniconda3/bin"] 
#CMD ["/root/miniconda3/bin/conda", "-V"]