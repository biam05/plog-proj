% ------------------------------------------------------------------------------------
% ----------------------------------- BIBLIOTECAS ------------------------------------
% ------------------------------------------------------------------------------------

:- use_module(library(lists)).
:- use_module(library(random)). % POde ser necessário retirar no fim se não se usar
:- use_module(library(clpfd)). % Permite utilizar o módulo de restrições

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