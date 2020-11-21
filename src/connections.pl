%:-use_module(library(lists)).

:-dynamic(connected/2).

/*
ligado(a,b). 
ligado(a,c). 
ligado(b,d). 
ligado(b,e). 
ligado(b,f). 
ligado(c,g). 
ligado(d,h). 
ligado(d,i). 
ligado(f,i).
ligado(f,j).
ligado(f,k).
ligado(g,l).
ligado(g,m).
ligado(k,n).
ligado(l,o).
ligado(i,f).

    

resolva_profundidade(No_inicial,No_meta,Solucao) :-
    profundidade([],No_inicial,No_meta,Sol_inv),
    reverse(Sol_inv,Solucao).

profundidade(Caminho,No_meta,No_meta,[No_meta|Caminho]).

profundidade(Caminho,No,No_meta,Sol) :-
    ligado(No,No1),
    \+member(No1,Caminho),
    profundidade([No|Caminho],No1,No_meta,Sol).

*/
p:-
    addConection(a,b),
    connected(a,b).

hello:-
    write('Term').

addConection(A,B):-
    Conection = connected(A,B),
    ConectionReverse = connected(B,A),
    assert(Conection),
    assert(ConectionReverse).







    



