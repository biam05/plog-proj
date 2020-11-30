:- use_module(library(lists)).

/*
*   numberToAtom(+Number, -Atom)
*       - transfroms a Number into an Atom of that same number ex: 8 -> '8'
*/
numberToAtom(Number,Atom):-
    number_chars(Number, CharList),
    nAtoms(CharList,Atom).

/*
*   nAtoms(+Items, -Atom)
*       - concatenates 2 List items into an Element
*/
nAtoms([H],H).
nAtoms([H,H2],Atom):-
    atom_concat(H,H2,Atom).

/*
*   letter_to_index(+Letter, -Index)
*       - turns a letter into a number representing the Column index position in the Gamestate List
*/
letter_to_index(Letter,Index):-
    char_code(Letter,Number),
    Index is Number - 96.

/*
*   index_to_letter(+Index, -Letter)
*       - turns an index representing the list Column in the Gamestate into a number 
*/
index_to_letter(Index,Letter):-
    Code is Index + 96,
    char_code(Letter,Code).

/*
*   get_position_string(+Row,+Column,-Position)
*       - concatenates a String Given a Row and Column, returning a position as an atom
*/
get_position_string(Row,Column,Position):-
    numberToAtom(Column,ColumnAtom),
    atom_concat(Row, ColumnAtom, Position).

/*
*   position_to_row_column(+Position, -Row, -Column)
*       - turns a Position into Row and Column
*/
position_to_row_column(Position,Row,Column):-
    name(Position, CodeList),
    convert(CodeList,Row,Column).

/*
*   convert(+Element,-Row,-Column)
*       - converts the Element to Row and Column
*/
convert([H|T],Row,Column):-
    char_code(Row,H),
    convertColumn(T,Column).

/*
*   convertColumn(+Element,-Column)
*       - converts the Element to a Column
*/
convertColumn([H1],Column):-
    number_codes(Column,[H1]).
convertColumn([H1,H2],Column):-
    number_codes(Column,[H1,H2]).

/*
*   achata_lista(+L,-Final)
*       - flattens L, turning it into Final
*/
achata_lista([],[]).
achata_lista(X,[X]):- atomic(X).
achata_lista([Cab|Rest],L):-
    achata_lista(Cab,L1),
    achata_lista(Rest,L2),
    append(L1,L2,L). 

/*
*   get_list_head(+L, -H)
*       - gets the list L head, returning it in H
*/
get_list_head([H|_],H).

/*
*   count(+L, +X, -N)
*       - counts the number os elements X in the list L, returning it in N
*/
count([],_X,0).
count([X|T],X,Y):- count(T,X,Z), Y is 1+Z.
count([X1|T],X,Z):- X1\=X,count(T,X,Z).

/*
*   keep_number_lists_of_lists(+L,-Current,-FinalList)
*       - removes all the elements that aren't numbers from a list of lists, returning
*   it in FinalList
*/
keep_number_lists_of_lists([H|T],FinalList):-
    keep_number_lists_of_lists([H|T],[],FinalList).
keep_number_lists_of_lists([],X,X).
keep_number_lists_of_lists([H|T],Current,FinalList):-
    keep_numbers(H,ListReady),
    append(Current,[ListReady],NewList),
    keep_number_lists_of_lists(T,NewList,FinalList).

/*
*   keep_numbers(+L,-ListReady)
*       - removes all the elements that aren't numbers from a list, returning
*   it in ListReady
*/
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

