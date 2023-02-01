somai(X,Y,Z,G) :- G is (X+Y+Z).

somaii([],0).
somaii([H|T],L) :- somaii(T,R), L is (R+H).

maior(X,Y,X) :- X>Y.
maior(X,Y,Y) :- Y>=X.

maior2(X,Y,R) :- X>Y -> R is X; R is Y.

maioriv([L],L).
maioriv([H|T],L) :- maioriv(T,R), (R>H -> L is R; L is H).


tamanho([],0).
tamanho([H|T],L) :- tamanho(T,R), L is (R+1).

media([],0).
media(Lista,L) :- somaii(Lista,R), tamanho(Lista,T), L is R/T.


ordenal([],[]).
ordenal([H|T],L) :- ordenal(T,P), insere1(P,H,L).

insere1([],E,[E]).
insere1([H|T],E,P) :- E<H -> P = [E|[H|T]]; (insere1(T,E,L), P = [H|L]).


listapares([],[]).
% listapares([H],R) :- H mod 2 =:= 0 -> R = H; R = [].
listapares([H|T],R) :- listapares(T,R1), (H mod 2 =:= 0 -> R = [H|R1]; R = R1). 
% listapares([H|T],R) :- listapares(T,R1), (0 is H mod 2 -> R = [H|R1]; R = R1). 

% is é para números 
% '=' é para listas e variáveis

pares(H) :- H mod 2 =:= 0.

pertence(E,[],'false').
pertence(E,[H|T],R) :- E == H -> R = 'true'; pertence(E,T,R).

comprimento([],0).
comprimento([H|T],R) :- comprimento(T,R1), R is R1+1.


diferentesl([],[]).
diferentesl([H|T],L) :- diferentesl(T,L1), (pertence(H,L1,'false') -> L = [H|L1]; L = L1).

diferentes([],0).
diferentes(L,R) :- diferentesl(L,R1), tamanho(R1,R).

apaga1(E,[],[]).
apaga1(E,[H|T],R) :- (E==H -> R=T; apaga1(E,T,R1),R=[H|R1]).

apagaT(E,[],[]).
apagaT(E,[H|T],R) :- (E==H -> apagaT(E,T,R1), R=R1; apagaT(E,T,R2),R=[H|R2]).

adicionar(E,[],[E]).
adicionar(E,[H|T],R) :- pertence(E,[H|T],'false') -> R=[E|[H|T]]; R=[H|T].

concatenar([],[],[]).
concatenar([],L,L).
concatenar(L,[],L).
concatenar([H|T],L,R) :- concatenar(T,L,R1), R=[H|R1].

inverter([],[]).
inverter([H|T],R) :- inverter(T,R1), concatenar(R1,[H],R).

sublista([],[],'true').
sublista([],L,'true').
sublista(L,[],'false').
sublista([H|T],[A|B],R) :- (H==A -> sublista(T,B,R), R='true'; sublista([H|T],B,R)).


