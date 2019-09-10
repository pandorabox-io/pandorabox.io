#!/bin/sh
cat registered_nodes.txt | sort | grep _three_sides_u | sed "s/_three_sides_u//" | sed "s/slab_//"
