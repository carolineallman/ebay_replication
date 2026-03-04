# eBay Paid Search — Difference-in-Differences Replication

A reproducible replication package estimating the causal effect of eBay's
paid search advertising on revenue, based on the natural experiment analyzed
by Blake et al. (2014) and presented in Chapter 5 of Taddy (2019).

## Research Question
What is the effect of paid search (SEM) advertising on eBay's revenue?

## Data
The dataset (input/PaidSearch.csv) contains daily revenue observations for
210 designated market areas (DMAs) from April to July 2012.

In 65 treatment DMAs, eBay stopped bidding on Google AdWords on May 22, 2012.
The remaining DMAs serve as the control group.

Source:
Blake, T., C. Nosko, and S. Tadelis (2014).
Consumer Heterogeneity and Paid Search Effectiveness:
A Large-Scale Field Experiment. Econometrica.

## Repository Structure

ebay_replication/
input/              Raw data
code/               Analysis scripts
  preprocess.py     Data wrangling and figures
  did_analysis.py   DID estimation and LaTeX table
output/
  figures/          Generated figures
  tables/           Generated LaTeX table
paper/              LaTeX paper and PDF
run_all.sh          Master reproduction script

## Prerequisites
Python 3 with:
- pandas
- numpy
- matplotlib

LaTeX with:
- graphicx
- booktabs
- amsmath

## How to Reproduce

Clone the repository and run:

bash run_all.sh

This will:
1. Generate figures
2. Estimate the DID model
3. Compile the research paper

The final output is located at:

paper/paper.pdf

## Results

The DID estimate suggests that turning off paid search reduced eBay revenue
by approximately 0.66% (gamma_hat = -0.0066 in log scale).

However, the 95% confidence interval [-0.0175, 0.0043] includes zero,
meaning the effect is not statistically significant at the 5% level.

This replicates the main finding of Blake et al. (2014).
