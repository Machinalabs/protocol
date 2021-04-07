#!/bin/bash

./env.sh

# Week 3 we received 78.5 -> 90% = 70.65
node ./CalculateUniswapLPRewards.js --fromBlock 12136989 --toBlock 12182532 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=70.65 --tokenName="yuma21" --week=3 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic