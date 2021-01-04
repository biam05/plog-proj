% ------------------------------------------------------------------------------------
% ----------------------------------- BIBLIOTECAS ------------------------------------
% ------------------------------------------------------------------------------------

% Permite utilizar funções de manipulação de listas
:- use_module(library(lists)).
% Permite utilizar funções para gerar valores aleatórios
:- use_module(library(random)).
% Permite utilizar o módulo de restrições
:- use_module(library(clpfd)). 

% ------------------------------------------------------------------------------------
% ----------------------------------- FICHEIROS  -------------------------------------
% ------------------------------------------------------------------------------------

:- ensure_loaded(display).
:- ensure_loaded(problem).
:- ensure_loaded(inputs).

% ------------------------------------------------------------------------------------
% ------------------------------- INÍCIO DO PROGRAMA  --------------------------------
% ------------------------------------------------------------------------------------

% main.
% predicado que se deve correr para iniciar o pgroama, apresenta o menu de opções
% e recebe o input da opção escolhida pelo utilizador
main:-
    menuDisplay,
    readOption.