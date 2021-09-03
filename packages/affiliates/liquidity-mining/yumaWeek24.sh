#!/bin/bash

./env.sh

# Week 24 we received 110.56 -> 90% = 99.5
node ./CalculateUniswapSushiLPRewards.js --fromBlock 13084415 --toBlock 13129728 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --sushiPoolAddress="0x632a03ad1b9575f0fab3d7612a54f43199a5ebb0" --umaPerWeek=99.5 --tokenName="yuma21" --week=24 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic