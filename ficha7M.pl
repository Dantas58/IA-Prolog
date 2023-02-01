
somaGordos(A,B,C,R) :- R is (A+B+C).

somaMaisGordos([], 0).
somaMaisGordos([H|T], R) :- somaMaisGordos(T,R1), R is R1+H.

maisGordo(X,Y,R) :- (X>Y) -> R is X; R is Y.

%maisGordos([R],R).
%maisGordos([H|E|T],R) :- maisGordo(H,E,R1), maisGordos([R1|T],L), R is L.

maisGordos([R],R).
maisGordos([H|T],R) :- maisGordos(T,R1), (R1>H) -> R is R1; R is H.

mediaT(L, R) :- sumlist(L,XD), length(L,XDD), R is XD/XDD.


insere(X,[],[X]).
insere(X, [H,T], R) :- X>H -> (insere(X, T, M), R = [H|M]); R = [X|[H|T]]. 


insere1([],E,[E]).
insere1([H|T],E,P) :- E<H -> P = [E|[H|T]]; (insere1(T,E,L), P = [H|L]).

pares([], []).
pares([H|T], R) :- H mod 2 =:= 0 -> pares(T, R1), R = [H|R1]; pares(T,R).

membros(X, [], R) :- R = 'false'.
membros(X, [H|T], R) :- X == H -> R = 'true'; membros(X,T,R).

comp([],0).
comp([H|T], R) :- comp(T,R1), R is R1 + 1.

diferentes([], 0).
diferentes([H|T],R) :- not(member(H,T)) -> diferentes(T,R1), R is R1+1; diferentes(T,R).

cortaMocas(X,[], R).
cortaMocas(X,[H|T],R) :- X=:=H -> R = T; cortaMocas(X, T, R1), R = [H|R1].

cortaMaisMocas(X, [], []). 
cortaMaisMocas(X, [H|T], R) :- (X==H -> cortaMaisMocas(X, T, R2), R = R2; cortaMaisMocas(X, T, R1), R = [H|R1]).

apagaT(E,[],[]).
apagaT(E,[H|T],R) :- (E==H -> apagaT(E,T,R1), R=R1; apagaT(E,T,R2),R=[H|R2]).

add(X,L,R) :- not(member(X,L)) -> append([X],L,R); R = L.


concateto([],[],[]).
concateto(L,[],L).
concateto([], L, L).
concateto(L, [H|T], R) :- concateto(L,T,R1), R = [H|R1].

inverteee([], R).
inverteee([H|T], R) :- inverteee(T,R1), append(R1,[H],R).

escravo(L, [], 'false').
escravo([], L, 'true'). 
escravo([H|T], [H2|T2],R) :- H==H2 -> escravo(T,T2,R); escravo([H|T], T2, R). 






















