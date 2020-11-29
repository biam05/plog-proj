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
runPVBOption(1) :-
    printBotPlayerMenu,
    repeat,
        write('Select which player the Bot should be:\n'),
        once(read(Option)),
        checkPlayerOption(Option),
    runPlayerOption(Option).

checkPlayerOption(Option) :- Option >= 0, Option =< 2.
checkPlayerOption(_) :- write('Invalid Option. Try Again\n'), fail.

runPlayerOption(1) :-
    initial(Initial),
    play_bot_player(Initial, 0).
    

runPlayerOption(2) :-
    initial(Initial),
    play_player_bot(Initial, 0).

runBVBOption(0) :- write('Goodbye!\n').
runBVBOption(1) :- 
    initial(Initial),
    play_bot_bot(Initial, 0).
