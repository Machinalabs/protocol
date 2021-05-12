#!/bin/bash

./env.sh

# Week 8 we received 232.814 -> 90% = 209.53
node ./CalculateUniswapLPRewards.js --fromBlock 12364084 --toBlock 12409495 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=209.53 --tokenName="yuma21" --week=8 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic