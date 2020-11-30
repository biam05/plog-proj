:- use_module(library(lists)).

/*
*   validMove(+GameState, +Row, +Column)
*       - checks if a position defined by Row and Column is valid in the actual
*   GameState
*/
validMove(GameState,Row,Column):-
    get_position_string(Row,Column,Position),
    validMove(GameState,Position).

/*
*   validMove(+GameState, +Position)
*       - checks if a Position is valid in the actual GameState
*/
validMove(GameState,Position):-
    name(Position,ListPosition),
    nth0(0,ListPosition,Row),
    RowNumber is Row - 96,
    nth0(RowNumber,GameState,Col),!,
    member(Position,Col).
/*
*   get_adjacent(+Position, -Adjacent)
*       - get Adjacents for Position
*/
get_adjacent(_Position,Adjacent):-
    get_adjacent(_Row,_Column,Adjacent).
/*
*   get_adjacent(+Row, +Column, -Adjacent)
*       - get Adjacents for a position defined by Row and Column
*   (Row is a letter)
*/
get_adjacent(Row,Column,Adjacent):-
    char_code(Row,Row2),
    RowIndex is Row2 - 96,
    adjacent(RowIndex,Column,Adj),
    filterAdjacent(Adj,[],Adjacent).
/*
*   adjacent(+Row, +Column, Adj)
*       - get Adjacents for a position defined by Row and Column
*   (Row is a number)
*/
adjacent(Row,Column,Adj):-
    BRow is Row -1,
    BBRow is Row -2,
    NRow is Row +1,
    NNRow is Row +2,
    BColumn is Column -1,
    NColumn is Column +1,
    Adj = [(BRow-BColumn),(BRow-NColumn),(NRow-BColumn),(NRow-NColumn),(BBRow-Column),(NNRow-Column)].

/*
*   checkBounds(+Row-Column)
*       - verifies if Row-Column belongs to the game board
*/
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
/*
*   filterAdjacent(+Adjacent, +Current, -Final)
*       - verifies if Adjacent belong to the game board, returning a list
*   with all the belonging adjacents
*/
filterAdjacent([],X,X).
filterAdjacent([H1-H2|T],Current,Final):-
    checkBounds(H1-H2),
    filterAdjacent(T,[H1-H2|Current],Final),!.
filterAdjacent([_H1-_H2|T],Current,Final):-
    filterAdjacent(T,Current,Final).

/*
*   get_coordinates(+Row, +Column, -RowIndex, -ColumnIndex)
*       - functions that gets the indexes correspondent to the Row
*   and the Column
*/
get_coordinates(Row,Column,RowIndex,ColumnIndex) :-
    initial(Initial),
    char_code(Row,Row2),
    RowIndex is Row2 - 96,
    nth0(RowIndex,Initial,Col),
    numberToAtom(Column,ColumnAtom),
    atom_concat(Row, ColumnAtom, X),
    nth0(ColumnIndex,Col,X).

/*
*   find_value(+GameState, +RowIndex, +ColumnIndex, -Value)
*       - gets the Value correspondent to the position defined by
*   RowIndex and ColumnIndex in the actual GameState
*/
find_value(GameState,RowIndex,ColumnIndex,Value) :-
    nth0(RowIndex,GameState,Col),
    nth0(ColumnIndex,Col,Value).

/*
*   get_value(+GameState, +Row, +Column, -Value)
*       - gets the Value correspondent to the position defined by
*   Row and Column in the actual GameState (needs the indexes to work)
*/
get_value(GameState,Row,Column,Value):-
    get_coordinates(Row,Column,RowIndex,ColumnIndex),
    value(Value, S),
    find_value(GameState,RowIndex,ColumnIndex,S).
    
/*
*   set_value(+Initial, -Final +Row, +Column, +Value)
*       - set the value of the position defined by Row and Column to Value
*   returning the new changes in Final
*/
set_value(Initial,Final,Row,Column,Value):-
    char_code(Row,Row2),
    RowNumber is Row2 - 96,
    nth0(RowNumber,Initial,Col),
    numberToAtom(Column,ColumnAtom),
    atom_concat(Row, ColumnAtom, X),
    select(X,Col,Value,Changed),
    select(Col,Initial,Changed,Final).

/*
*   valid_moves(+GameState, +Player, -ListOfMoves)
*       - returns a list with all the valid moves in ListOfMoves for
*   the player Player
*/
valid_moves(GameState,_Player,ListOfMoves):-
    achata_lista(GameState,Flat),
    remove_numbers(Flat,ListReady),
    findall(Move,member(Move,ListReady),ListOfMoves).

/*
*   valid_move(+Position)
*       - gets the initial gamestate to verify if a move is valid
*/
valid_move(Position):-
    initial(Initial),
    valid_move(Initial,Position).
/*
*   valid_move(+GameState, +Row, +Column)
*       - gets the position defined by Row and Column and verifies if the move is valid
*/
valid_move(GameState,Row,Column):-
    get_position_string(Row,Column,Position),
    valid_move(GameState,Position).

/*
*   valid_move(+GameState, +Position)
*       - verifies if the Position is member of a list of valid moved for the current GameState
*/
valid_move(GameState,Position):-
    valid_moves(GameState, _, ListOfMoves),!,
    member(Position, ListOfMoves).

/*
*   set_color_gamestate(+Color, +Player, +Initial, -Final)
*       - changes the colors won in the gamestate, keeping in mind the Player that won the color.
*   The result is returned in Final
*/    
set_color_gamestate(Color,Player,Initial,Final):-
    nth0(0,Initial,Col),        
    nth1(Color,Col,_,Changed),
    nth1(Color,ColFinal,Player,Changed),
    select(Col,Initial,ColFinal,Final).

/*
*   won_color(+Color, +Player, +Value)
*       - gets the value for the Color, verifying if it was already one
*/ 
won_color(Color,GameState,Value):-
    nth0(0, GameState, Colors),
    nth1(Color,Colors,Value).