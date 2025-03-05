#!/bin/bash


planet_name=$1

case $planet_name in
    "Mercury")
        echo "0"
        ;;
    "Venus")
        echo "0"
        ;;
    "Earth")
        echo "1"
        ;;
    "Mars")
        echo "2"
        ;;
    "Jupiter")
        echo "92"
        ;;
    "Saturn")
        echo "145"
        ;;
    "Uranus")
        echo "27"
        ;;
    "Neptune")
        echo "14"
        ;;
    *)
        echo "Unknown planet"
        exit 1
        ;;
esac
