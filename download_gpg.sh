if [ $(gpg --list-keys | grep D39DC0E3 | wc -l) > 0 ] && [ $(gpg --list-keys | grep 39499BDB | wc -l) > 0 ]
then
      exit 0
else
      gpg_ip=`ping -c 1 -w 1 pool.sks-keyservers.net | grep "bytes from" | sed 's/^.*(\(.*\)).*$/\1/'`
      gpg --keyserver hkp://${gpg_ip} --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
fi
