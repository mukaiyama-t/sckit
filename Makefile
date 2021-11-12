.PHONY: empty
empty:

.PHONY:
run:
	-docker netowrk create sckit-network
	docker-compose up

.PHONY: build
build:
	docker-compose build --no-cache

.PHONY: install
install:
	docker-compose exec sol npm install

.PHONY: bash
bash:
	docker-compose exec sol bash

.PHONY: prepare
prepare:
	docker-compose exec sol ts-node --project sckit-tsconfig.json ./libs/createEthAccount.ts
	docker-compose exec sol ts-node --project sckit-tsconfig.json ./libs/listEthAccount.ts
	docker-compose exec sol ts-node --project sckit-tsconfig.json ./libs/chargeEthBalance.ts 100

.PHONY: myEth
myEth:
	docker-compose exec sol ts-node --project sckit-tsconfig.json ./libs/getMyEthBalance.ts

.PHONY: myAccount
myAccount:
	docker-compose exec sol ts-node --project sckit-tsconfig.json ./libs/getMyEthAccount.ts