.PHONY: result

results: results/isles.dat results/figures/isles.dat

results/isles.dat : scripts/wordcount.py data/isles.txt
	python scripts/wordcount.py \
		--input_file=data/isles.txt \
		--output_file=results/isles.dat
results/figures/isles.png : scripts/plotcount.py results/isles.dat
	python scripts/plotcount.py \
		--input_file=results/isles.dat \
		--output_file=results/figure/isles.png
clean:
	rm -f results/figure/isles.png results/isles.dat
