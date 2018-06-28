#!/bin/sh

rm -rf minetest postgres
cp ../minetest . -R
cp minetest.conf ./minetest

#TODO: dirty....
cp ../postgres . -R


