#!/bin/bash

./env.sh

# Week 6 we received 229 -> 90% = 206.1
node ./CalculateUniswapLPRewards.js --fromBlock 12273338 --toBlock 12318814 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=206.1 --tokenName="yuma21" --week=6 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic