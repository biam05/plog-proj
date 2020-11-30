:- use_module(library(random)).
:- use_module(library(lists)).

:- dynamic(color_fake/2).
:- dynamic(connected_fake/2).


/*
*   random_bot(+GameState, -RandomMove, -RandomColor)
*       - Generates a Random Move for the bot
*/
random_bot(GameState,RandomMove,RandomColor):-
    achata_lista(GameState, Flat),
    random_member(RandomMove, Flat),
    random_member(RandomColor, [1,2,3]).


/*
*   value(+GameState, +Player, -Value)
*       - evaluates the current GameState
*/
value(GameState, Player, Value):-
    won_color(1,GameState,Value1),
    won_color(2,GameState,Value2),
    won_color(3,GameState,Value3),

    calculate_color(Player,1,Value1,Score1),
    calculate_color(Player,2,Value2,Score2),
    calculate_color(Player,3,Value3,Score3),

    Value is Score1 + Score2 + Score3.

/*
*   calculate_color(+Player, +Color, +Aux, -Total)
*       - calculates estimated total points obtained by the Player
*/
calculate_color(Player,_Color,Player,50).
calculate_color(Player,Color,2,Total):-
    get_single_color(Player,Color,Color2),
    findall(_Cl,color(_Cl,Color),ColorList),
    findall(_Cl2,color(_Cl2,Color2),ColorList2),

    length(ColorList,Count),
    length(ColorList2,Count2),

    Total is Count + Count2.
calculate_color(_Player,_Color,_,0).


/*
*   greedy_bot(+GameState,+Player,-GreedyMove,-GreedyColor)
*       - generates a GreedyMove and a GreedyColor for the bot
*/
greedy_bot(GameState,Player,GreedyMove,GreedyColor):-
    findall(Value-Move-Color,(valid_move(GameState,Move),simulate_play(GameState,0,Move,Color,GameState3,Value)),List),
    sort(List,Sorted),
    reverse(Sorted,Reverse),
    nth0(0,Reverse,GreedyValue-GreedyMove-GreedyColor),
    write(GreedyValue),nl,
    write(GreedyMove),nl,
    write(GreedyColor),nl.

/*
*   simulate_play(+GameState,+Player,+Position,+Color,-GameState3,-Value)
*       - simulates the Value of the GameState after a certain play defined
*   by Position and Color
*/
simulate_play(GameState,Player,Position,Color,GameState3,Value):-
    random_member(Color, [1,2,3]),!,
    move_fake(GameState,Position,Color, GameState2),
    check_win(Player,GameState2,GameState3),
    value(GameState3, Player, Value),
    Cl = color(Position,Color),
    retractall(connected_fake(_,_)),
    retract(Cl).
    
% The following Predicates are similar to others existing in other .pl files.
% Though, they are specifically made to allow simulating a Move without changing the previous existing facts.
% Hence, all this predicates have the same name as other existing predicates, but with the _fake name extension.
% No further Documentation will be added because similar methods are already documentated.

move_fake(GameState,Move,Color,GameState2):-
    position_to_row_column(Move,Row,Column),
    move_fake(GameState,Row,Column,Color,GameState2).

move_fake(GameState,Row,Column,Color,GameState2):-
    set_value(GameState,GameState2,Row,Column,Color),
    get_position_string(Row,Column,Position),
    add_color_fake(Position,Color),
    add_connections_fake(Row,Column).


add_color_fake(Position,Color):-
    Clr = color(String,Color),
    assert(Clr).

add_connections_fake(Row,Column):-
    get_adjacent(Row,Column,Adjacent),
    get_position_string(Row,Column,String),
    check_existance_fake(Adjacent,String,[]).


check_existance_fake([],_,X).
check_existance_fake([H1-H2|T],Position,Current):-
    index_to_letter(H1,Letter),
    get_position_string(Letter,H2,String),
    valid_move(String),
    add_conection_fake(String,Position),
    check_existance_fake(T,Position,[String-Position|Current]).
check_existance_fake([_H1-_H2|T],Position,Current):-
    check_existance_fake(T,Position,Current).


add_conection_fake(A,B):-
    \+connected_fake(A,B),
    \+connected_fake(B,A),
    Conection = connected_fake(A,B),
    ConectionReverse = connected_fake(B,A),
    assert(Conection),
    assert(ConectionReverse).


check_win_cl_fake(_,_,0).
check_win_cl_fake(_,_,1).
check_win_cl_fake(Player,Color,_Value):-
    coords(Color,Coords),
    check_win_color_fake(Coords,Player,Color).


check_win_color_fake([],_,_).
check_win_color_fake([C1-C2|T],Player,Color):-
    \+resolva_profundidade_fake(C1,C2,_Solution,Color,Player),
    check_win_color_fake(T,Player,Color).


check_win_cl_block_fake(_,_,0).
check_win_cl_block_fake(_,_,1).
check_win_cl_block_fake(Player,Color,_Value):-
    coords_blocking(Color,Coords),
    get_single_color(Player,Color,ColorBlock),
    check_win_color_block_fake(Coords,Player,ColorBlock).


check_win_color_block_fake([],_Player,_Color).
check_win_color_block_fake([C1-C2|T],Player,Color):-
    \+resolva_profundidade_bloqueio_fake(C1,C2,_Solution,Color,Player),
    check_win_color_block_fake(T,Player,Color).

check_wins_color_fake(Player,Color,ValueColor,InitialGamestate,FinalGamestate):-
    check_win_cl_fake(Player,Color,ValueColor),
    check_win_cl_block_fake(Player,Color,ValueColor),!,
    FinalGamestate = InitialGamestate.

check_wins_color_fake(Player,Color,_ValueColor,InitialGamestate,FinalGamestate):-
    set_color_gamestate(Color,Player,InitialGamestate,FinalGamestate),!.
 

check_win_fake(Player,InitialGamestate,FinalGamestate):-
    won_color(1,InitialGamestate,ValuePurple),
    won_color(2,InitialGamestate,ValueGreen),
    won_color(3,InitialGamestate,ValueOrange),
    check_wins_color(Player,1,ValuePurple,InitialGamestate,FinalGamestate1),
    check_wins_color(Player,2,ValueGreen,FinalGamestate1,FinalGamestate2),
    check_wins_color(Player,3,ValueOrange,FinalGamestate2,FinalGamestate).


resolva_profundidade_fake(No_inicial,No_meta,Solucao,Color,Player) :-
    profundidade_fake([],No_inicial,No_meta,Sol_inv,Color,Player),
    reverse(Sol_inv,Solucao).


profundidade_fake(Caminho,No_meta,No_meta,[No_meta|Caminho],_Color,_Player).
profundidade_fake(Caminho,No,No_meta,Sol,Color,Player) :-
    verify_connection_fake(No,No1),
    check_color(No,Color,Player),
    check_color(No1,Color,Player),
    \+member(No1,Caminho),
    profundidade_fake([No|Caminho],No1,No_meta,Sol,Color,Player).


resolva_profundidade_bloqueio_fake(No_inicial,No_meta,Solucao,Color,Player) :-
    profundidade_bloqueio_fake([],No_inicial,No_meta,Sol_inv,Color,Player),
    reverse(Sol_inv,Solucao).


profundidade_bloqueio_fake(Caminho,No_meta,No_meta,[No_meta|Caminho],_Color,_Player).
profundidade_bloqueio_fake(Caminho,No,No_meta,Sol,Color,Player) :-
    verify_connection_fake(No,No1),
    verify_color_fake(No,Color),
    verify_color_fake(No1,Color),
    \+member(No1,Caminho),
    profundidade_bloqueio_fake([No|Caminho],No1,No_meta,Sol,Color,Player).

verify_connection_fake(No,No1):- connected(No,No1).
verify_connection_fake(No,No1):- connected_fake(No,No1).

verify_color_fake(Position,Color):- color(No,No1).
verify_color_fake(Position,Color):- color_fake(No,No1).

delete_list_connections([]).
delete_list_connections([H1-H2|T]):-
    Con = connected_fake(H1-H2),
    retract(Con),
    delete_list_connections(T).

