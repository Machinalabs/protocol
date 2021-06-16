#!/bin/bash

./env.sh

# Week 13 we received 125.66 -> 80% = 100.5
node ./CalculateUniswapLPRewards.js --fromBlock 12590260 --toBlock 12635423 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=100.5 --tokenName="yuma21" --week=13 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic