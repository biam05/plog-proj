%:-use_module(library(lists)).

:-dynamic(connected/2).
:-dynamic(color/2).

connected(h1,i2).
connected(i2,h3).
connected(h3,i4).
connected(i4,h5).
connected(h5,i6).
connected(i6,h7).
connected(h7,i8).
connected(i8,h9).
connected(h9,i10).
connected(i10,h11).
connected(h11,i12).
connected(i12,h13).

color(h1,1).
color(h3,1).
color(h5,1).
color(h7,1).
color(h9,1).
color(h11,1).
color(h13,1).
color(i2,1).
color(i4,1).
color(i6,1).
color(i8,1).
color(i10,1).
color(i12,1).


% check_color -> (Position,Color,Player)

%Player: 0 Color: Purple
check_color(Position,1,0):-
    color(Position,1).

check_color(Position,1,0):-
    color(Position,3).

%Player: 1 Color: Purple
check_color(Position,1,1):-
    color(Position,1).

check_color(Position,1,1):-
    color(Position,2).


%Player: 0 Color: Green
check_color(Position,2,0):-
    color(Position,2).

check_color(Position,2,0):-
    color(Position,1).

%Player: 1 Color: Green
check_color(Position,2,1):-
    color(Position,2).

check_color(Position,2,1):-
    color(Position,3).

%Player: 0 Color: Orange
check_color(Position,3,0):-
    color(Position,3).

check_color(Position,3,0):-
    color(Position,2).

%Player: 1 Color: Orange
check_color(Position,3,1):-
    color(Position,3).

check_color(Position,3,1):-
    color(Position,1).


%
check_win_purple(Player):-
    \+resolva_profundidade(h1,h13,Solution,1,Player),
    \+resolva_profundidade(h1,j13,Solution,1,Player),
    \+resolva_profundidade(h1,l13,Solution,1,Player),
    \+resolva_profundidade(h1,n13,Solution,1,Player),
    \+resolva_profundidade(h1,p13,Solution,1,Player),

    \+resolva_profundidade(j1,h13,Solution,1,Player),
    \+resolva_profundidade(j1,j13,Solution,1,Player),
    \+resolva_profundidade(j1,l13,Solution,1,Player),
    \+resolva_profundidade(j1,n13,Solution,1,Player),
    \+resolva_profundidade(j1,p13,Solution,1,Player),

    \+resolva_profundidade(l1,h13,Solution,1,Player),
    \+resolva_profundidade(l1,j13,Solution,1,Player),
    \+resolva_profundidade(l1,l13,Solution,1,Player),
    \+resolva_profundidade(l1,n13,Solution,1,Player),
    \+resolva_profundidade(l1,p13,Solution,1,Player),

    \+resolva_profundidade(n1,h13,Solution,1,Player),
    \+resolva_profundidade(n1,j13,Solution,1,Player),
    \+resolva_profundidade(n1,l13,Solution,1,Player),
    \+resolva_profundidade(n1,n13,Solution,1,Player),
    \+resolva_profundidade(n1,p13,Solution,1,Player),

    \+resolva_profundidade(p1,h13,Solution,1,Player),
    \+resolva_profundidade(p1,j13,Solution,1,Player),
    \+resolva_profundidade(p1,l13,Solution,1,Player),
    \+resolva_profundidade(p1,n13,Solution,1,Player),
    \+resolva_profundidade(p1,p13,Solution,1,Player).

check_win_green(Player) :-
    \+resolva_profundidade(a6,w8,Solution,2,Player),
    \+resolva_profundidade(a6,v9,Solution,2,Player),
    \+resolva_profundidade(a6,u10,Solution,2,Player),
    \+resolva_profundidade(a6,t11,Solution,2,Player),
    \+resolva_profundidade(a6,s12,Solution,2,Player),

    \+resolva_profundidade(b5,w8,Solution,2,Player),
    \+resolva_profundidade(b5,v9,Solution,2,Player),
    \+resolva_profundidade(b5,u10,Solution,2,Player),
    \+resolva_profundidade(b5,t11,Solution,2,Player),
    \+resolva_profundidade(b5,s12,Solution,2,Player),

    \+resolva_profundidade(c4,w8,Solution,2,Player),
    \+resolva_profundidade(c4,v9,Solution,2,Player),
    \+resolva_profundidade(c4,u10,Solution,2,Player),
    \+resolva_profundidade(c4,t11,Solution,2,Player),
    \+resolva_profundidade(c4,s12,Solution,2,Player),

    \+resolva_profundidade(d3,w8,Solution,2,Player),
    \+resolva_profundidade(d3,v9,Solution,2,Player),
    \+resolva_profundidade(d3,u10,Solution,2,Player),
    \+resolva_profundidade(d3,t11,Solution,2,Player),
    \+resolva_profundidade(d3,s12,Solution,2,Player),

    \+resolva_profundidade(e2,w8,Solution,2,Player),
    \+resolva_profundidade(e2,v9,Solution,2,Player),
    \+resolva_profundidade(e2,u10,Solution,2,Player),
    \+resolva_profundidade(e2,t11,Solution,2,Player),
    \+resolva_profundidade(e2,s12,Solution,2,Player).

check_win_orange(Player) :-
    \+resolva_profundidade(a8,w6,Solution, 3,Player),
    \+resolva_profundidade(a8,v5,Solution, 3,Player),
    \+resolva_profundidade(a8,u4,Solution, 3,Player),
    \+resolva_profundidade(a8,t3,Solution, 3,Player),
    \+resolva_profundidade(a8,s2,Solution, 3,Player),

    \+resolva_profundidade(b5,w6,Solution, 3,Player),
    \+resolva_profundidade(b5,v5,Solution, 3,Player),
    \+resolva_profundidade(b5,u4,Solution, 3,Player),
    \+resolva_profundidade(b5,t3,Solution, 3,Player),
    \+resolva_profundidade(b5,s2,Solution, 3,Player),

    \+resolva_profundidade(c4,w6,Solution, 3,Player),
    \+resolva_profundidade(c4,v5,Solution, 3,Player),
    \+resolva_profundidade(c4,u4,Solution, 3,Player),
    \+resolva_profundidade(c4,t3,Solution, 3,Player),
    \+resolva_profundidade(c4,s2,Solution, 3,Player),

    \+resolva_profundidade(d3,w6,Solution, 3,Player),
    \+resolva_profundidade(d3,v5,Solution, 3,Player),
    \+resolva_profundidade(d3,u4,Solution, 3,Player),
    \+resolva_profundidade(d3,t3,Solution, 3,Player),
    \+resolva_profundidade(d3,s2,Solution, 3,Player),

    \+resolva_profundidade(e2,w6,Solution, 3,Player),
    \+resolva_profundidade(e2,v5,Solution, 3,Player),
    \+resolva_profundidade(e2,u4,Solution, 3,Player),
    \+resolva_profundidade(e2,t3,Solution, 3,Player),
    \+resolva_profundidade(e2,s2,Solution, 3,Player).

check_win_orange(Player):-
    format('Player ~w won Orange Color!!',[Player]),
    Confirmation = 0.

check_win_green(Player):-
    format('Player ~w won Green Color!!',[Player]),
    Confirmation = 0.

check_win_purple(Player):-
    format('Player ~w won Purple Color!!',[Player]),
    Confirmation = 0.



    
check_win(Player,Confirmation):-
    Confirmation = 0,
    write('entered check win'),nl,
    check_win_green(Player,Confirmation),
    write('checked green'),nl,
    check_win_purple(Player,Confirmation),
    write('checked purple'),nl,
    check_win_orange(Player,Confirmation),
    write('checked orange'),nl.
    

resolva_profundidade(No_inicial,No_meta,Solucao,Color,Player) :-
    profundidade([],No_inicial,No_meta,Sol_inv,Color,Player),
    reverse(Sol_inv,Solucao).

profundidade(Caminho,No_meta,No_meta,[No_meta|Caminho],Color,Player).

profundidade(Caminho,No,No_meta,Sol,Color,Player) :-
    connected(No,No1),
    write(Caminho),nl,
    write(No),
    write(No1),nl,  
    check_color(No,Color,Player),
    write('color1 checked'),nl,
    check_color(No1,Color,Player),
    write('color2 checked'),nl,
    \+member(No1,Caminho),
    profundidade([No|Caminho],No1,No_meta,Sol,Color,Player).


add_color(Row,Column,Color):-
    get_position_string(Row,Column,String),
    Clr = color(String,Color),
    assert(Clr).

p:-
    addConection(a,b),
    connected(a,b).



addConection(A,B):-
    Conection = connected(A,B),
    ConectionReverse = connected(B,A),
    assert(Conection),
    assert(ConectionReverse).

add_connections(Gamestate,Row,Column):-
    get_adjacent(Row,Column,Adjacent),
    write(Adjacent),nl,
    get_position_string(Row,Column,String),
    check_existance(Adjacent,Gamestate,String).

check_existance([],_,_,_).
check_existance([H1-H2|T],Gamestate,Position):-
    write('reaches'),nl.
    index_to_letter(H1,Letter),
    get_value(Gamestate,Letter,H2,Value),
    get_position_string(Letter,H2,String),

    write(Value),nl,
    write(Letter),nl,
    write(H2),nl,nl,
    Value \= String,!,
    write(passed),nl,
    addConection(String,Position),
    check_existance(T,Gamestate,Position).

check_existance([H1-H2|T],Gamestate,Position):-
    check_existance(T,Gamestate,Position).


f:-
    initial(Initial),
    add_connections(Initial,e,4),
    write(added),nl.












    



