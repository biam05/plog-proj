/*
*   checkGameModeOption(+Option)
*       - verifies if the user's input is valid, failing if it's not
*/
checkGameModeOption(Option) :- Option >= 0, Option =< 3.
checkGameModeOption(_) :- write('Invalid Option. Try Again\n'), fail.

/*
*   checkDifficultyOption(+Option)
*       - verifies if the user's input is valid, failing if it's not
*/
checkDifficultyOption(Option) :- Option >= 0, Option =< 2.
checkDifficultyOption(_) :- write('Invalid Option. Try Again\n'), fail.

/*
*   checkPlayerOption(+Option)
*       - verifies if the user's input is valid, failing if it's not
*/
checkPlayerOption(Option) :- Option >= 0, Option =< 2.
checkPlayerOption(_) :- write('Invalid Option. Try Again\n'), fail.

/*
*   getUserInput(-Column, -Row, -Color)
*        - gets the Column, Row and Color necessary to make a move
*/
getUserInput(Column, Row, Color) :-
    repeat,
        write('Please Enter Valid Coordinates'),nl,
        getUserColumn(Column),
        getUserRow(Row),
        getUserColor(Color).

/*
*   getUserColumn(-Column)
*        - gets the Column value
*/
getUserColumn(Column) :-
    repeat,
        write('Enter the column letter:\n'),
        once(read(Column)),
        checkReadColumn(Column),!.
/*
*   getUserRow(-Row)
*        - gets the Row value
*/
getUserRow(Row) :-
    repeat,
        write('Enter the row number:\n'),
        once(read(Row)),
        checkReadRow(Row),!.
/*
*   getUserColor(-Color)
*        - gets the Color value
*/
getUserColor(Color) :-
    repeat,
        write('Enter the color number (purple - 1; green - 2; orange - 3):\n'),
        once(read(Color)),
        checkReadColor(Color),!.  

/*
*   checkReadColumn(+Column)
*       - verifies if the user's input is valid, failing if it's not
*/
checkReadColumn(Column) :- atom(Column), char_code(Column,Number), Number >= 97, Number =< 119.
checkReadColumn(_) :- write('Invalid Column. Has to be between \'a\' and \'w\'. Try Again\n'), fail.

/*
*   checkReadRow(+Row)
*       - verifies if the user's input is valid, failing if it's not
*/
checkReadRow(Row) :- integer(Row), Row >= 1, Row =< 13.
checkReadRow(_) :- write('Invalid Row. Has to be between \'1\' and \'13\'. Try Again\n'), fail.

/*
*   checkReadColor(+Color)
*       - verifies if the user's input is valid, failing if it's not
*/
checkReadColor(Color) :- integer(Color), Color >= 1, Color =< 3.
checkReadColor(_) :- write('Invalid Color. Try Again\n'), fail.