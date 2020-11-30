:- use_module(library(lists)).

/*
    * Function that transfroms a Number into an Atom of that same number ex: 8 -> '8'
    *   Number  - number to be transformed
    *   Atom    - final atom
*/
numberToAtom(Number,Atom):-
    number_chars(Number, CharList),
    nAtoms(CharList,Atom).

/*
    * Function that concatenates 2 List items into an Element
    *   [H, H2] -
    *   Atom    -
*/
nAtoms([H],H).
nAtoms([H,H2],Atom):-
    atom_concat(H,H2,Atom).

/*
    * Function that turns a letter into a number representing the Column index position in the Gamestate List
    *   Letter  - letter to be transformed
    *   Index   - letter's index
*/
letter_to_index(Letter,Index):-
    char_code(Letter,Number),
    Index is Number - 96.

/*
    * Function that turns an index representing the list Column in the Gamestate into a number 
    *   Index   - Index to be transformed
    *   Letter  - letter in the index given
*/
index_to_letter(Index,Letter):-
    Code is Index + 96,
    char_code(Letter,Code).

/*
    * Function that concatenates a String Given a Row and Column, returning a position as an atom
    *   Row         - row to be concatenated
    *   Column      - column to be concatenated
    *   Position    - concatenation of row and column  
*/
get_position_string(Row,Column,Position):-
    numberToAtom(Column,ColumnAtom),
    atom_concat(Row, ColumnAtom, Position).

/*
    * Function that 
    *   Position    - 
    *   Row         - 
    *   Column      - 
*/
position_to_row_column(Position,Row,Column):-
    name(Position, CodeList),
    convert(CodeList,Row,Column).

/*
    * Function that 
    *   [H|T]   - 
    *   Row     - 
    *   Column  - 
*/
convert([H|T],Row,Column):-
    char_code(Row,H),
    convertColumn(T,Column).

/*
    * Function that 
    *   [H1, H2]    - 
    *   Column      -
*/
convertColumn([H1],Column):-
    number_codes(Column,[H1]).

convertColumn([H1,H2],Column):-
    number_codes(Column,[H1,H2]).

/*
    * Function that flattens a given list, returning the final result in the last argument
*/
achata_lista([],[]).
achata_lista(X,[X]):- atomic(X).
achata_lista([Cab|Rest],L):-
    achata_lista(Cab,L1),
    achata_lista(Rest,L2),
    append(L1,L2,L). 

/*
    * Function that gets the First Element of a given list, returning the final result in the last argument
*/
get_list_head([H|_],H).

count([],_X,0).
count([X|T],X,Y):- count(T,X,Z), Y is 1+Z.
count([X1|T],X,Z):- X1\=X,count(T,X,Z).



keep_number_lists_of_lists([H|T],FinalList):-
    keep_number_lists_of_lists([H|T],[],FinalList).

keep_number_lists_of_lists([],X,X).
keep_number_lists_of_lists([H|T],Current,FinalList):-
    keep_numbers(H,ListReady),
    append(Current,[ListReady],NewList),
    keep_number_lists_of_lists(T,NewList,FinalList).



keep_numbers(Flat,ListReady):-
    keep_numbers(Flat,[],ListReady).

keep_numbers([],X,X).
keep_numbers([H|T],Current,Final):-
    number(H),!,
    append(Current,[H],NList),
    keep_numbers(T,NList,Final).

keep_numbers([_H|T],Current,Final):-
    append(Current,[' '],NewList),
    keep_numbers(T,NewList,Final).


/*
*   remove_numbers(+Flat, -ListReady)
*       - removes numbers from a list
*/
remove_numbers(Flat,ListReady):-
    remove_numbers(Flat,[],ListReady).
remove_numbers([],X,X).
remove_numbers([H|T],Current,Final):-
    \+number(H),!,
    append(Current,[H],NList),
    remove_numbers(T,NList,Final).
remove_numbers([_H|T],Current,Final):-remove_numbers(T,Current,Final).
  
/*
*   permutation_(+NodeBaseList,+NodeEndList,-PermutationList)
*       - makes permutations between 2 lists
*/ 
permutation_(NodeBaseList,NodeEndList,PermutationList):-
    findall(A-B,(member(A,NodeBaseList),member(B,NodeEndList)),PermutationList).

