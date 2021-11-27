#!/bin/bash

scad="openscad"
in="./my-keys.scad"
args="-D stype=\"cherry\" -D sslop=0.30 -D cradius=2.5 -D thickness=1.5"
run="$scad $in $args"

for r in 0 1 2 3 4 5 ; do
  echo $run -D "rows_from=$r" -D "rows_to=$r" -o key-row${r}-mesh.stl
  $run -D "rows_from=$r" -D "rows_to=$r" -o key-row${r}-mesh.stl
done
