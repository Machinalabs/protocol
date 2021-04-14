#!/bin/bash

./env.sh

# Week 4 we received 89 -> 90% = 80.1
node ./CalculateUniswapLPRewards.js --fromBlock 12182533 --toBlock 12228111 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=80.1 --tokenName="yuma21" --week=4 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic