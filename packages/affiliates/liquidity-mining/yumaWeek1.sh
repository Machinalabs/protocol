#!/bin/bash

./env.sh

# Week 1 we received 39 -> 80% = 31.2
node ./CalculateUniswapLPRewards.js --fromBlock 12048551 --toBlock 12091492 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=31 --tokenName="yuma21" --week=1 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic
