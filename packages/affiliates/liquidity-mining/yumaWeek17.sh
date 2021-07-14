#!/bin/bash

./env.sh

# Week 17 we received 70 -> 80% = 56
node ./CalculateUniswapLPRewards.js --fromBlock 12770312 --toBlock 12815267 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=56 --tokenName="yuma21" --week=17 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic