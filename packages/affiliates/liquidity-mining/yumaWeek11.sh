#!/bin/bash

./env.sh

# Week 11 we received 114.898 -> 80% = 91.91
node ./CalculateUniswapLPRewards.js --fromBlock 12499909 --toBlock 12544963 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=91.91 --tokenName="yuma21" --week=11 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic