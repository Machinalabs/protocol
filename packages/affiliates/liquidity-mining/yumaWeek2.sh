#!/bin/bash

./env.sh

# Week 2 we received 60 -> 80% = 48
node ./CalculateUniswapLPRewards.js --fromBlock 12091493 --toBlock 12136988 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=48 --tokenName="yuma21" --week=2 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic