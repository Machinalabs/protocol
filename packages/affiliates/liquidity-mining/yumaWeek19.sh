#!/bin/bash

./env.sh

# Week 19 we received 81.62 -> 80% = 65.29
node ./CalculateUniswapLPRewards.js --fromBlock 12859856 --toBlock 12904604 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=65.29 --tokenName="yuma21" --week=19 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic