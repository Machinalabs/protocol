#!/bin/bash

./env.sh

# Week 10 we received 227.73 -> 90% = 204.95
node ./CalculateUniswapLPRewards.js --fromBlock 12454757 --toBlock 12499908 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=204 --tokenName="yuma21" --week=10 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic