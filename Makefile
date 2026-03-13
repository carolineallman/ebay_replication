.PHONY: all clean

all: paper/paper.pdf

# Preprocessing: data wrangling and figures
output/figures/figure_5_2.png output/figures/figure_5_3.png: input/PaidSearch.csv code/preprocess.py
	python code/preprocess.py

# DID estimation
output/tables/did_table.tex: input/PaidSearch.csv code/did_analysis.py
	python code/did_analysis.py

# Paper compilation
paper/paper.pdf: paper/paper.tex output/figures/figure_5_2.png output/figures/figure_5_3.png output/tables/did_table.tex
	cd paper && pdflatex paper.tex && pdflatex paper.tex

clean:
	rm -f output/figures/*.png output/tables/*.tex paper/paper.pdf paper/paper.aux paper/paper.log
# Task 2 answers:
# 1. If code/preprocess.py is edited, Make rebuilds:
#    - output/figures/figure_5_2.png
#    - output/figures/figure_5_3.png
#    - paper/paper.pdf
#    It skips:
#    - output/tables/did_table.tex

# 2. If code/did_analysis.py is edited, Make rebuilds:
#    - output/tables/did_table.tex
#    - paper/paper.pdf
#    It skips:
#    - output/figures/figure_5_2.png
#    - output/figures/figure_5_3.png

# Reflection:
# The Makefile makes the dependency structure of the project explicit.
# Instead of running every step every time like run_all.sh, Make only
# rebuilds outputs when their inputs change. This makes the workflow
# faster and easier for collaborators to understand because the
# relationships between scripts, data, figures, and the paper are
# clearly documented.# 3. If paper/paper.tex is edited, Make rebuilds:
#    - paper/paper.pdf
#    It skips:
#    - output/figures/figure_5_2.png
#    - output/figures/figure_5_3.png
#    - output/tables/did_table.tex

# Reflection:
# The Makefile makes the dependency structure of the project explicit, while run_all.sh only listed commands in order.
# By reading the Makefile, a collaborator can immediately see which outputs depend on which scripts and inputs.
# It also makes clear which steps need to rerun when a file changes, instead of rerunning the entire pipeline every time.
# This makes the workflow more efficient and better documented.
