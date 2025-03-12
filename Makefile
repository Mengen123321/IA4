# author: Jordan Bourak & Tiffany Timbers
# date: 2021-11-22

# "make all" will make everything
all: docs/horse_pop_plot_largest_sd.png \
	docs/horse_pops_plot.png \
	docs/horses_spread.csv \
	docs/qmd_example.html \
	docs/qmd_example.pdf

# generate figures and objects for report
docs/horse_pop_plot_largest_sd.png docs/horse_pops_plot.png docs/horses_spread.csv: source/generate_figures.py
	mkdir -p docs
	python source/generate_figures.py --input_dir="data/00030067-eng.csv" \
		--out_dir="docs"

# render quarto report in HTML and PDF
docs/qmd_example.html: docs docs/qmd_example.qmd
	quarto render reports/qmd_example.qmd --to html --output-dir docs

docs/qmd_example.pdf: docs docs/qmd_example.qmd
	quarto render reports/qmd_example.qmd --to pdf --output-dir docs

# Ensure docs directory exists
docs:
	mkdir -p docs

# clean
clean:
	rm -rf docs

