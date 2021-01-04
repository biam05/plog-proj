:- ensure_loaded(display).
:- ensure_loaded(main).
:- ensure_loaded(inputs).

main:-
    menuDisplay,
    readOption.
    %runner(4).