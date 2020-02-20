#!/bin/bash -x

echo "*************************Flip Coin*************************"

# CONSTANT
ISHEAD=1
SINGLET=1
DOUBLET=2
TRIPLET=3

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
echo ${coinFlip[@]}
echo ${!coinFlip[@]}
}

# FUNCTION FOR PERCENTAGE
function getPercentage(){
for index in ${!coinFlip[@]}
do
	coinFlip[$index]=`echo "scale=2 ; ${coinFlip[$index]}*100/$flipcoin" | bc`
done
}

# SWITCH CASES FOR CHOICES
echo "Enter 1 for Singlet "
echo "Enter 2 for Doublet "
echo "Enter 3 for Triplet "
read -p "Enter your choice: " choice
case $choice in
	$SINGLET)
	isflip $SINGLET
	getPercentage $SINGLET
	;;
	$DOUBLET)
	isflip $DOUBLET
	getPercentage $DOUBLET
	;;
	$TRIPLET)
	isflip $TRIPLET
	getPercentage $TRIPLET
	;;
	*)
esac

# FOR WINNING COMBINATION
for k in ${!coinFlip[@]}
do
	echo $k ' Winning Combination ' ${coinFlip[$k]}
done | sort -rn -k3 | head -1
