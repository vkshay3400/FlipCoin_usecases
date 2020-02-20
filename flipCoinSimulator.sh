#!/bin/bash -x

echo "*************************Flip Coin*************************"

# CONSTANT
ISHEAD=1
SINGLET=1

# DICTIONARY
declare -A coinFlip

# INPUT FROM USER
read -p "Enter a number to multi-time flip a coin: " flipcoin

# GET RANDOM VALUES
function isflip(){
local NumberCoin=$1
for (( flip=0; flip<$flipcoin; flip++ ))
do
	for (( coin=0; coin<$NumberCoin; coin++ ))
	do
		randomFlipCoin=$((RANDOM%2))

		# CHECK WEHTER HEADS OR TAIL
		if [ $randomFlipCoin -eq $ISHEAD ]
		then
			coinSide+=H
		else
			coinSide+=T
		fi
	done

	# STORING IN DICTIONARY
	((coinFlip[$coinSide]++))
	coinSide=""
done
echo "FlipCoin value :" ${coinFlip[@]}
echo "FlipCoin key : "${!coinFlip[@]}
}

# FUNCTION FOR PERCENTAGE
function getPercentage(){
for index in ${!coinFlip[@]}
do
	coinFlip[$index]=`echo "scale=2 ; ${coinFlip[$index]}*100/$flipcoin" | bc`%
done
	echo "FlipCoin in percentage: "${coinFlip[@]}
}

# PRINT PERCENTAGE
isflip $SINGLET
getPercentage $SINGLET

