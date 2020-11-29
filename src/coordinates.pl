:- use_module(library(lists)).

% Checks if the given move is valid according to the current GameState coordinates (receives Row and Column as arguments instead of position)
validMove(GameState,Row,Column):-
    get_position_string(Row,Column,Position),
    validMove(GameState,Position).

% Checks if the given move is valid according to the initial coordinates
validMove(Position):-
    initial(Initial),
    validMove(GameState,Position).

% Checks if the given move is valid according to the current GameState coordinates
validMove(GameState,Position):-
    name(Position,ListPosition),
    nth0(0,ListPosition,Row),
    RowNumber is Row - 96,
    nth0(RowNumber,GameState,Col),!,
    member(Position,Col).


get_adjacent(Position,Adjacent):-
    get_adjacent(Row,Column,Adjacent).
get_adjacent(Row,Column,Adjacent):-
    char_code(Row,Row2),
    RowIndex is Row2 - 96,
    adjacent(RowIndex,Column,Adj),
    filterAdjacent(Adj,[],Adjacent).

adjacent(Row,Column,Adj):-
    BRow is Row -1,
    BBRow is Row -2,
    NRow is Row +1,
    NNRow is Row +2,
    BColumn is Column -1,
    NColumn is Column +1,
    Adj = [(BRow-BColumn),(BRow-NColumn),(NRow-BColumn),(NRow-NColumn),(BBRow-Column),(NNRow-Column)].


checkBounds(Row-Column):-
    Row =\= 0,
    Row =\= -1,
    initial(Initial),
    RowCode is Row + 96,
    char_code(Letter,RowCode),
    numberToAtom(Column,ColumnAtom),
    atom_concat(Letter, ColumnAtom, Position),
    nth0(Row,Initial,Col),
    member(Position,Col).

% Filters a List of coordinates into 
filterAdjacent([],X,X).
filterAdjacent([H1-H2|T],Current,Final):-
    checkBounds(H1-H2),
    filterAdjacent(T,[H1-H2|Current],Final),!.

filterAdjacent([H1-H2|T],Current,Final):-
    filterAdjacent(T,Current,Final).


/*
    *   Function used to get the coordinates that correspond to the user's input
    *       Row         - row    ('1' to '13')
    *       Column      - column ('a' to 'w')
    *       RowIndex    - 
*/
get_coordinates(Row,Column,RowIndex,ColumnIndex) :-
    initial(Initial),
    char_code(Row,Row2),
    RowIndex is Row2 - 96,
    nth0(RowIndex,Initial,Col),
    numberToAtom(Column,ColumnAtom),
    atom_concat(Row, ColumnAtom, X),
    nth0(ColumnIndex,Col,X).

find_value(GameState,RowIndex,ColumnIndex,Value) :-
    nth0(RowIndex,GameState,Col),
    nth0(ColumnIndex,Col,Value).

get_value(GameState,Row,Column,Value):-
    get_coordinates(Row,Column,RowIndex,ColumnIndex),
    value(Value, S),
    find_value(GameState,RowIndex,ColumnIndex,S).
    

set_value(Initial,Final,Row,Column,Value):-
    char_code(Row,Row2),
    RowNumber is Row2 - 96,
    nth0(RowNumber,Initial,Col),
    numberToAtom(Column,ColumnAtom),
    atom_concat(Row, ColumnAtom, X),
    select(X,Col,Value,Changed),
    select(Col,Initial,Changed,Final).

set_value(Initial,Final,Row,Column,Value) :-
    write('Error reading coordinates.\n'),
    write('Trying again\n'),
    fail.

% valid_moves(+GameState, +Player, -ListOfMoves)


remove_numbers(Flat,ListReady):-
    remove_numbers(Flat,[],ListReady).

remove_numbers([],X,X).
remove_numbers([H|T],Current,Final):-
    \+number(H),!,
    append(Current,[H],NList),
    remove_numbers(T,NList,Final).

remove_numbers([H|T],Current,Final):-remove_numbers(T,Current,Final).

ll(X):-
    initial(Initial),
    valid_moves(Initial,Player,X).

valid_moves(GameState,Player,ListOfMoves):-
    achata_lista(GameState,Flat),
    remove_numbers(Flat,ListReady),
    findall(Move,member(Move,ListReady),ListOfMoves).



valid_move(GameState,Row,Column):-
    get_position_string(Row,Column,Position),
    valid_move(GameState,Position).

valid_move(GameState,Position):-
    achata_lista(GameState,Flat),
    remove_numbers(Flat,ListReady),
    member(Move,ListReady).

    % P, G, O
    
set_color_gamestate(Color,Player,Initial,Final):-

    nth0(0,Initial,Col),        
    nth1(Color,Col,_,Changed),
    nth1(Color,ColFinal,Player,Changed),
    write(ColFinal),
    select(Col,Initial,ColFinal,Final).


won_color(Color,GameState,Value):-
    nth0(0, GameState, Colors),
    nth1(Color,Colors,Value).
    
    
trying:-
    Lis = [0,0,0],
    nth1(2,Lis,_,Changed),
    nth1(2,ColFinal,1,Changed),
    write(ColFinal).

at:-
    initial(Initial),
    set_color_gamestate(2,1,Initial,Final),
    write(Final),
    won_color(2,Final),
    won_color(1,Final).
