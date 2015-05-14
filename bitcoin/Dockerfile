FROM ubuntu:precise

RUN apt-get -y update
RUN apt-get install -y python-software-properties 

RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y bitcoind

RUN mkdir ~/.bitcoin
RUN echo "rpcuser=test\nrpcpassword=test\n" > ~/.bitcoin/bitcoin.conf

# Easy aliases for presentation
RUN echo "alias rt='bitcoin-cli -regtest'" >> ~/.bashrc
RUN echo "alias startup='bitcoind -regtest -daemon -printtoconsole'" >> ~/.bashrc
RUN echo "alias getinfo='rt getinfo'" >> ~/.bashrc
RUN echo "alias getpeerinfo='rt getpeerinfo'" >> ~/.bashrc
RUN echo "alias tryconnect='rt addnode $(/sbin/ip route|awk '/default/ { print $3 }') onetry'" >> ~/.bashrc
RUN echo "alias mine='rt setgenerate true'" >> ~/.bashrc
RUN echo "alias getbalance='rt getbalance'" >> ~/.bashrc
RUN echo "alias getnewaddress='rt getnewaddress'" >> ~/.bashrc
RUN echo "alias sendtoaddress='rt sendtoaddress'" >> ~/.bashrc



CMD ["/usr/bin/bitcoind", "-regtest", "--printtoconsole", "-rpcallowip=*"]
