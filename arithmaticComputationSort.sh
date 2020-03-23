#!/bin/bash -x
#Program to computes different arithmatic expressions and sort the result

#Vaiables
temp=0
declare -A arithmaticDictionary
declare -a arithmaticArray

#Take input from user
read -p "Enter first number: " Number1
read -p "Enter second number: " Number2
read -p "Enter third number: " Number3

#Computations
result1=`echo "scale=2 ; $Number1+$Number2*$Number3" | bc -l`
result2=`echo "scale=2 ; $Number1*$Number2+$Number3" | bc -l` 
result3=`echo "scale=2 ; $Number3+$Number1/$Number2" | bc -l`
result4=`echo "scale=2 ; $Number1%$Number2+$Number3" | bc -l`

#To store the results in a dictionary for every computations
arithmaticDictionary[1]=$result1
arithmaticDictionary[2]=$result2
arithmaticDictionary[3]=$result3
arithmaticDictionary[4]=$result4

#To store the elements of dictionary in Array
for value in ${!arithmaticDictionary[@]}
do
	arithmaticArray[$value]="${arithmaticDictionary[$value]}"
done
echo "Array:: ${arithmaticArray[@]}"

# Sort the elements of an Array in Descending order
for first in ${!arithmaticArray[@]}
do
	for second in ${!arithmaticArray[@]}
	do
		if ((`echo "${arithmaticArray[$first]}>${arithmaticArray[$second]}" | bc -q`==1))
		then
			temp="${arithmaticArray[$first]}"
			arithmaticArray[$first]="${arithmaticArray[$second]}"
			arithmaticArray[$second]=$temp
		fi
	done
done
echo "Sorted array in Descending order ::" ${arithmaticArray[@]}

# Sort the elements in array in Ascending order
for first in ${!arithmaticArray[@]}
do
	for second in ${!arithmaticArray[@]}
	do
		if ((`echo "${arithmaticArray[$first]}<${arithmaticArray[$second]}" | bc -q`==1))
		then
			temp="${arithmaticArray[$first]}"
			arithmaticArray[$first]="${arithmaticArray[$second]}"
			arithmaticArray[$second]=$temp
		fi
	done
done
echo "Sorted array in Ascending order ::" ${arithmaticArray[@]}
