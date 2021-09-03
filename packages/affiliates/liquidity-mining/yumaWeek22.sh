#!/bin/bash

./env.sh

# Week 22 we received 97.95 -> 90% = 88.15
node ./CalculateUniswapSushiLPRewards.js --fromBlock 12993808 --toBlock 13039098 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --sushiPoolAddress="0x632a03ad1b9575f0fab3d7612a54f43199a5ebb0" --umaPerWeek=88.15 --tokenName="yuma21" --week=22 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic