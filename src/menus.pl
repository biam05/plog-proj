/*
*   starting_menu
*       - prints the starting menu and handles the user's inputs
*/
starting_menu :- 
    printStartingMenu,
    readGameModeOption.

/*
*   readGameModeOption
*       - handles the user's input for the game mode option and runs it
*/
readGameModeOption :-
    repeat,
        write('Select the game mode:\n'),
        once(read(Option)),
        checkGameModeOption(Option),
    runGameModeOption(Option).

/*
*   runGameModeOption(Option)
*       - runs the option given by the user for the game mode
*/
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

/*
*   runPVBOption(Option)
*       - runs the option given by the user for the Player vs. Bot difficulty
*/
runPVBOption(0) :- write('Goodbye!\n').
runPVBOption(1) :-
    printBotPlayerMenu,
    repeat,
        write('Select which player the Bot should be:\n'),
        once(read(Option)),
        checkPlayerOption(Option),
    runEasyPlayerOption(Option).

runPVBOption(2) :-
    printBotPlayerMenu,
    repeat,
        write('Select which player the Bot should be:\n'),
        once(read(Option)),
        checkPlayerOption(Option),
    runHardPlayerOption(Option).

/*
*   runEasyPlayerOption(Option)
*       - runs the option given by the user for the Bot player number (easy difficulty)
*/
runEasyPlayerOption(1) :-
    initial(Initial),
    play_bot_player(Initial, 0, 1).
runEasyPlayerOption(2) :-
    initial(Initial),
    play_player_bot(Initial, 0, 1).

/*
*   runHardPlayerOption(Option)
*       - runs the option given by the user for the Bot player number (hard difficulty)
*/
runHardPlayerOption(1) :-
    initial(Initial),
    play_bot_player(Initial, 0, 2).
runHardPlayerOption(2) :-
    initial(Initial),
    play_player_bot(Initial, 0, 2).

/*
*   runBVBOption(Option)
*       - runs the option given by the user for the Bot vs. Bot game
*/
runBVBOption(0) :- write('Goodbye!\n').
runBVBOption(1) :- 
    initial(Initial),
    play_bot_bot(Initial, 0, 1).
runBVBOption(2) :- 
    initial(Initial),
    play_bot_bot(Initial, 0, 2).
