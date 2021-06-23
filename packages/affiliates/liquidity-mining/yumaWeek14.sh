#!/bin/bash

./env.sh

# Week 14 we received 108.64 -> 80% = 86.91
node ./CalculateUniswapLPRewards.js --fromBlock 12635424 --toBlock 12680434 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=86.91 --tokenName="yuma21" --week=14 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic