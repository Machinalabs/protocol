#!/bin/bash

./env.sh

# Week 12 we received 130.189 -> 80% = 104.15
node ./CalculateUniswapLPRewards.js --fromBlock 12544964 --toBlock 12590259 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=104.15 --tokenName="yuma21" --week=12 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic