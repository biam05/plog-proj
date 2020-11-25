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
    get_list_head(ListPosition,Row),
    RowNumber is Row - 97,
    nth0(RowNumber,GameState,Col),!,
    member(Position,Col).


get_adjacent(Position,Adjacent):-
    get_adjacent(Row,Column,Adjacent).
get_adjacent(Row,Column,Adjacent):-
    char_code(Row,Row2),nl,
    RowIndex is Row2 - 97,
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
    initial(Initial),
    RowCode is Row + 97,
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
    char_code(Row,Row2),nl,
    RowIndex is Row2 - 97,
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
    RowNumber is Row2 - 97,
    nth0(RowNumber,Initial,Col),
    numberToAtom(Column,ColumnAtom),
    atom_concat(Row, ColumnAtom, X),
    select(X,Col,Value,Changed),
    select(Col,Initial,Changed,Final).

set_value(Initial,Final,Row,Column,Value) :-
    write('Error reading coordinates.\n'),
    write('Trying again\n'),
    fail.
