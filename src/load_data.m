%script
%LOAD_DATA Load data
%
% [] = LOAD_DATA;
%
%   Loads pre-computed data into workspace
%
% Note
% ----
% To set data directory as 'data_dir'

% setting up {{{
clear all
data_dir   = '../data';
result_dir = '../result';
% }}}

% Gene Ontology {{{
fprintf('loading ontology ... ');
load(fullfile(data_dir, 'GO.mat'));
fprintf('done.\n');
% }}}

% annotation structures {{{
fprintf('loading annotation structures ... ');
load(fullfile(data_dir, 'annotation/sp1001_exp.mat'));
load(fullfile(data_dir, 'annotation/sp1101_exp.mat'));
load(fullfile(data_dir, 'annotation/sp1201_exp.mat'));
load(fullfile(data_dir, 'annotation/sp1301_exp.mat'));
load(fullfile(data_dir, 'annotation/sp1401_exp.mat'));
fprintf('done.\n');
% }}}

% target lists {{{
fprintf('loading target lists ... ');
load(fullfile(data_dir, 'targets/tarlist_all.mat'));
load(fullfile(data_dir, 'targets/tarlist_ia.mat'));
fprintf('done.\n');
% }}}

% predictions {{{
fprintf('loading predictions ... ');
load(fullfile(data_dir, 'predictor/gotcha.mat'));
load(fullfile(data_dir, 'predictor/blast.mat'));
load(fullfile(data_dir, 'predictor/com.mat'));
fprintf('done.\n');
% }}}

% curves {{{
fprintf('loading curves ... ');
load(fullfile(result_dir, 'curves/gotcha_curves.mat'));
load(fullfile(result_dir, 'curves/blast_curves.mat'));
load(fullfile(result_dir, 'curves/com_curves.mat'));
fprintf('done.\n');
% }}}

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Thu 14 Jul 2016 04:11:29 PM E
