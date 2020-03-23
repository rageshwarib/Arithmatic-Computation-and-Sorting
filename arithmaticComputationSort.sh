#!/bin/bash -x
#Program to computes different arithmatic expressions and sort the result

#Take input from user
read -p "Enter first number: " Number1
read -p "Enter second number: " Number2
read -p "Enter third number: " Number3

#Computations
result1=`echo "scale=2 ; $Number1+$Number2*$Number3" | bc -l`
