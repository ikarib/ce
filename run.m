% This program finds efficient/inefficient correlated equilibria that
% maximize/minimize weighted sum of the payoffs in a two player normal form game
%     max/min  w*U1(P)+(1-w)*U2(P)
%    s.t. P is correlated equilibrium
% where U1 and U2 are given n-by-m matrices of payoffs of two players.
%
% Algorithm builds the linear inequalities that represent the rationality
% constraints for two players. The constraint matrix A is constructed so that
% if P is the probability distribution over joint actions, and if X=P(:),
% the correlated equilibrium constraints are A * X <= 0.
%
% The program also plots the convex hull of found correlated equilibria
% together with the convex hull of given Nash equilibria which can be
% solved for by Gambit. http://gambit.sourceforge.net
%
% Author:
% Iskander Karibzhanov
% PhD student, Department of Economics
% University of Minnesota

% Example 1: Prisoner's dilemma
u1=[6 1
    5 0]; % payoff of player 1
u2=[0 1
    5 6]; % payoff of player 2
ne=[1 0 0 1]; % Nash equilibria
plotce(u1,u2,ne,'PRISONER''S DILEMMA')

% Example 2: Battle of sexes
u1=[3 0
    0 1]; % payoff of player 1
u2=[1 0
    0 3]; % payoff of player 2
ne=[[3 1 1 3]/4
     0 1 0 1
     1 0 1 0]; % Nash equilibria
plotce(u1,u2,ne,'GAME OF BATTLE OF SEXES')

% Example 3: Game of chicken (Aumann, 1974)
u1=[5 0
    4 1]; % payoff of player 1
u2=[1 0
    4 5]; % payoff of player 2
ne=[[1 1 1 1]/2
     0 1 0 1
     1 0 1 0]; % Nash equilibria
plotce(u1,u2,ne,'GAME OF CHICKEN (AUMANN, 1974)')