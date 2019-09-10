#!/bin/sh
cat registered_nodes.txt | sort | grep _technic_cnc_cylinder_horizontal | sed "s/_technic_cnc_cylinder_horizontal//"

