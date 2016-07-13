%script
%
% Load data
%
% This script load pre-computed data into workspace
%

% Gene Ontology
load ../data/GO.mat

% annotation structures
load ../data/annotation/sp1001_exp.mat
load ../data/annotation/sp1101_exp.mat
load ../data/annotation/sp1201_exp.mat
load ../data/annotation/sp1301_exp.mat
load ../data/annotation/sp1401_exp.mat

% target lists
load ../data/targets/tarlist_all.mat
load ../data/targets/tarlist_ia.mat

% predictors
load ../data/predictor/gotcha.mat
load ../data/predictor/blast.mat
load ../data/predictor/com.mat

% curves
load ../result/curves/gotcha_curves.mat
load ../result/curves/blast_curves.mat
load ../result/curves/com_curves.mat
