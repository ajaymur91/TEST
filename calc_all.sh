#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate CLIPS
for i in `seq 1 10`
do
	bash calc_FE.sh $1 $2 $i
	cp FE.pdf FE_$i.pdf
done

convert -alpha deactivate -verbose -delay 50 -loop 1 -density 300 FE_{1..10}.pdf FE.gif
rm -rf FE_*.pdf \#*

