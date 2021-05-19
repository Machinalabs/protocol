#!/bin/bash

./env.sh

# Week 9 we received 229.81 -> 90% = 206.82
node ./CalculateUniswapLPRewards.js --fromBlock 12409496 --toBlock 12454756 --poolAddress="0x184225f78cff8266dea2ec9d0968ab4f475878a5" --umaPerWeek=206.82 --tokenName="yuma21" --week=9 --empAddress="0xdb2e7f6655de37822c3020a8988351cc76cadad5" --network mainnet_mnemonic