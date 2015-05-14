DOCKER_RUN=docker run -t
DOCKER_ALICE=$(DOCKER_RUN) -p 18444:18444 -p 18332:18332 --name=alice --hostname=alice
DOCKER_BOB=$(DOCKER_RUN) -p 19444:18444 -p 19332:18332 --name=bob --hostname=bob
DOCKER_MINER=$(DOCKER_RUN) -p 20444:18444 -p 20332:18332 --name=miner --hostname=miner


IMG=james/bitcoin-regtest

RUN_DAEMON=bitcoind -regtest -rpcallowip=* -printtoconsole
RUN_SHELL=bash

build:
	docker build -t $(IMG) .

alice_rm:
	-docker rm -f alice

bob_rm:
	-docker rm -f bob

miner_rm:
	-docker rm -f miner

alice_daemon: build alice_rm
	$(DOCKER_ALICE) -d=true $(IMG) $(RUN_DAEMON)

alice_shell: build alice_rm
	$(DOCKER_ALICE) -i $(IMG) $(RUN_SHELL)

bob_daemon: build bob_rm
	$(DOCKER_BOB) -d=true $(IMG) $(RUN_DAEMON)

bob_shell: build bob_rm
	$(DOCKER_BOB) -i $(IMG) $(RUN_SHELL)

miner: build miner_rm
	$(DOCKER_MINER) -d=true $(IMG)

clean: build alice_rm bob_rm miner_rm
