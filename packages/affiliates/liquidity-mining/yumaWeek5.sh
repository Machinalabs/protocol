#!/bin/bash

./env.sh

# Week 5 we received 160 -> 90% = 144
node ./CalculateUniswapLPRewards.js --fromBlock 12228112 --toBlock 12273337 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=144 --tokenName="yuma21" --week=5 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic