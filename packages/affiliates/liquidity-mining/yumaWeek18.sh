#!/bin/bash

./env.sh

# Week 18 we received 81 -> 80% = 64.8
node ./CalculateUniswapLPRewards.js --fromBlock 12815268 --toBlock 12859855 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=64.8 --tokenName="yuma21" --week=18 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic