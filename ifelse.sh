#! /bin/bash

echo "Enter a number:"
read n
if [ $n -gt 10 ]
then
    echo "Greater than 10"
else
    echo "Lesser than or equal to 10"
fi
