#!/bin/bash

./env.sh

# Week 6 we received 235.236 -> 90% = 211.7124
node ./CalculateUniswapLPRewards.js --fromBlock 12318815 --toBlock 12364083 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=211.7124 --tokenName="yuma21" --week=7 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic