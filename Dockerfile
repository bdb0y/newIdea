ADD file:bc844c4763367b5f0ac7b9aebf7d43900d98f2aca101b886f185347b24973dbe in / 

 CMD ["bash"]
 
 COPY file:27396786e98813df28ecb61c3e62d14a73504b5f333cdd620abc6b7734509e27 in /usr/local/bin 
 
 /bin/sh -c mkdir /data
 
 /bin/sh -c set -eux ; 	apt-get update ; 	apt-get install -y --no-install-recommends curl ca-certificates ; 	rm -rf /var/lib/apt/lists/* ;
 
 COPY dir:1f529c737fa6ef8906ece0ea6b0604395ae3893dff3ec93fad87152bab953363 in /etc/telegram 
 
 COPY file:20c4924ed6f715313284c8aeaaaa10894896b071fffd1ed9e43c25483d343c17 in /run.sh 
 
  CMD ["/bin/sh" "-c" "/bin/bash /run.sh"]
