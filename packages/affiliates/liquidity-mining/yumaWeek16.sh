#!/bin/bash

./env.sh

# Week 16 we received 97.37 -> 80% = 77.89
node ./CalculateUniswapLPRewards.js --fromBlock 12725378 --toBlock 12770311 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=77.89 --tokenName="yuma21" --week=16 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic