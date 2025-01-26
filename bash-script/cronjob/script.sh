#!/bin/bash

# Loop from 1 to 59
for i in {1..59}; do 
    # Generate a random number between 1 and 6 and append it to random-num.txt
    echo $((1 + $RANDOM % 6)) >> random-num.txt
    
    # Sleep for 1 second before continuing to the next iteration
    sleep 1
done
