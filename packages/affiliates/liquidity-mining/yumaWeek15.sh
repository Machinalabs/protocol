#!/bin/bash

./env.sh

# Week 15 we received 84.44 -> 80% = 67.52
node ./CalculateUniswapLPRewards.js --fromBlock 12680435 --toBlock 12725377 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=67.52 --tokenName="yuma21" --week=15 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic