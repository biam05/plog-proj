:- use_module(library(random)).
:- use_module(library(lists)).

:- dynamic(color_fake/2).
:- dynamic(connected_fake/2).



% Generates a Random Move for the bot
random_bot(GameState,RandomMove,RandomColor):-
    achata_lista(GameState, Flat),
    random_member(RandomMove, Flat),
    random_member(RandomColor, [1,2,3]).


% value(+GameState, +Player, -Value)
value(GameState, Player, Value):-
    won_color(1,GameState,Value1),
    won_color(2,GameState,Value2),
    won_color(3,GameState,Value3),

    calculate_color(Player,1,Value1,Score1),
    calculate_color(Player,2,Value2,Score2),
    calculate_color(Player,3,Value3,Score3),

    Value is Score1 + Score2 + Score3.


calculate_color(Player,_Color,Player,50).
calculate_color(Player,Color,2,Total):-
    get_single_color(Player,Color,Color2),
    findall(_Cl,color(_Cl,Color),ColorList),
    findall(_Cl2,color(_Cl2,Color2),ColorList2),

    length(ColorList,Count),
    length(ColorList2,Count2),

    Total is Count + Count2.
calculate_color(_Player,_Color,_,0).



testing:-
    intermediate(GameState),
    value(GameState, 0, Value0),
    value(GameState, 1, Value1),
    nl,
    write(Value0),nl,
    write(Value1).


medium_bot(GameState,Move,Color):-
    valid_move(Position),
    findall(Move,valid_move(GameState,Move),List).

l:-
    %fake_color(a6,2),
    P1 = fake_color(i10,2),
    assert(P1),
    fake_color(a6,2),
    write(1),
    retract(P1),
    fake_color(a6,2),
    write(2).

simulate_play(GameState,Player,Position,Color,GameState3,Value):-
    %valid_move(Position),
    random_member(Color, [1,2,3]),!,
    move_fake(GameState,Position,Color, GameState2),
    check_win(Player,GameState2,GameState3),
    value(GameState3, Player, Value),
    %rt2,
    Cl = color(Position,Color),
    retractall(connected_fake(_,_)),
    retract(Cl).
    %retractall(connected(_,_)),
    %retractall(color(_,_)).
    %remove_conection
    %write(Position),nl,
    %write(Color),nl,
    %write(Value),nl.
rt2:-
    retractall(connected(_,_)),
    retractall(color(_,_)).

rt:-

    initial(Initial),
    simulate_play(Initial,0,i12,Color,GameState3,Value),
    write(value).

attempt:-
    initial(GameState),
    findall(Value-Move-Color,(valid_move(GameState,Move),simulate_play(GameState,0,Move,Color,GameState3,Value)),List),
    %write(List),
    sort(List,Sorted),
    reverse(Sorted,Reverse),
    nth0(0,Reverse,V-M-C),

    %write(Reverse),nl,
    write(V),nl,
    write(M),nl,
    write(C),nl,

    %listing(connected_fake),
    %retractall(connected_fake(_,_)),
    retractall(color_fake(_,_)).




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

