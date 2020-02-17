#!/bin/bash -x

echo "*************************Flip Coin*************************"

# GET RANDOM VALUES
randomFlipCoin=$((RANDOM%2))

# CHECK WEHTER HEADS OR TAIL
if [ $randomFlipCoin -eq 1 ]
then
	echo "Head"
else
	echo "Tail"
fi
