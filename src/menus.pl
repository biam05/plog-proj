starting_menu :- 
    printStartingMenu,
    readGameModeOption.

readGameModeOption :-
    repeat,
        write('Select the game mode:\n'),
        once(read(Option)),
        checkGameModeOption(Option),
    runGameModeOption(Option).

checkGameModeOption(Option) :- Option >= 0, Option =< 3.
checkGameModeOption(_) :- write('Invalid Option. Try Again\n'), fail.

runGameModeOption(0) :- write('Goodbye!\n').

runGameModeOption(1) :- 
    initial(GameState),
    play_game(GameState,0).

runGameModeOption(2) :- 
    printDifficultyMenu,
    repeat,
        write('Select the difficulty:\n'),
        once(read(Option)),
        checkDifficultyOption(Option),
    runPVBOption(Option).

runGameModeOption(3) :- 
    printDifficultyMenu,
    repeat,
        write('Select the difficulty:\n'),
        once(read(Option)),
        checkDifficultyOption(Option),
    runBVBOption(Option).

checkDifficultyOption(Option) :- Option >= 0, Option =< 1.
checkDifficultyOption(_) :- write('Invalid Option. Try Again\n'), fail.

runPVBOption(0) :- write('Goodbye!\n').
runPVBOption(1) :- write('Not yet implemented\n').

runBVBOption(0) :- write('Goodbye!\n').
runBVBOption(1) :- write('Not yet implemented\n').
