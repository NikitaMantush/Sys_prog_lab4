#!/bin/bash

vect=("x" "y" "z")

echo "Значения элементов массива vect: ${vect[0]}, ${vect[1]}, ${vect[2]}"

unset vect

echo "Значения элементов массива vect после удаления: ${vect[0]}, ${vect[1]}, ${vect[2]}"

