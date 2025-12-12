.PHONY : all report clean

all: results/isles.dat \
		results/abyss.dat \
		results/last.dat \
		results/sierra.dat \
		results/figure/isles.png \
		results/figure/abyss.png \
		results/figure/last.png \
		results/figure/sierra.png \
		report

results/isles.dat : scripts/wordcount.py data/isles.txt
	python scripts/wordcount.py \
		--input_file=data/isles.txt \
		--output_file=results/isles.dat

results/abyss.dat : scripts/wordcount.py data/abyss.txt
	python scripts/wordcount.py \
		--input_file=data/abyss.txt \
		--output_file=results/abyss.dat

results/last.dat : scripts/wordcount.py data/last.txt
	python scripts/wordcount.py \
		--input_file=data/last.txt \
		--output_file=results/last.dat

results/sierra.dat : scripts/wordcount.py data/sierra.txt
	python scripts/wordcount.py \
		--input_file=data/sierra.txt \
		--output_file=results/sierra.dat

results/figure/isles.png : scripts/plotcount.py results/isles.dat
	python scripts/plotcount.py \
		--input_file=results/isles.dat \
		--output_file=results/figure/isles.png

results/figure/abyss.png : scripts/plotcount.py results/abyss.dat
	python scripts/plotcount.py \
		--input_file=results/abyss.dat \
		--output_file=results/figure/abyss.png

results/figure/last.png : scripts/plotcount.py results/last.dat
	python scripts/plotcount.py \
		--input_file=results/last.dat \
		--output_file=results/figure/last.png

results/figure/sierra.png : scripts/plotcount.py results/sierra.dat
	python scripts/plotcount.py \
		--input_file=results/sierra.dat \
		--output_file=results/figure/sierra.png

report :
	quarto render report/count_report.qmd

clean:
	rm -f results/figure/isles.png \
			results/isles.dat\
			results/figure/abyss.png \
			results/abyss.dat \
			results/figure/last.png \
			results/last.dat \
			results/figure/sierra.png \
			results/sierra.dat
