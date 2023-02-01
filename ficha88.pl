%LICENCIATURA EM ENGENHARIA INFORMATICA
%MESTRADO integrado EM ENGENHARIA INFORMATICA

%Inteligencia Artificial
%2022/23

%Draft Ficha 8


%biblioteca(id, nome, localidade)

biblioteca(1, uminhogeral, braga).
biblioteca(2, luciocracveiro, braga).
biblioteca(3, municipal, porto).
biblioteca(4, publica, viana).
biblioteca(5, ajuda, lisboa).
biblioteca(6, cidade, coimbra).


%livros( id, nome, biblioteca)

livros(1, gameofthrones, 1). 
livros(2, codigodavinci, 2).
livros(3, setimoselo, 1).
livros(4, fireblood, 4).
livros(5, harrypotter, 6).
livros(6, senhoradosneis, 7).
livros(7, oalgoritmomestre, 9).

%leitores(id, nome, genero)

leitores(1, pedro, ma).
leitores(2, joao, ma).
leitores(3, lucia, f).
leitores(4, sofia, f).
leitores(5, patricia, f).
leitores(6, diana, f).

%requisicoes(id_requisicao,id_leitor, id_livro, data(A,M,D)

requisicoes(1,2,3,data(2022,5,17)).
requisicoes(2,1,2,data(2022,7,10)).
requisicoes(3,1,3,data(2021,11,2)).
requisicoes(4,1,4,data(2022,2,1)).
requisicoes(5,5,3,data(2022,4,23)).
requisicoes(6,4,2,data(2021,3,9)).
requisicoes(7,4,1,data(2022,5,5)).
requisicoes(8,2,6,data(2021,7,18)).
requisicoes(9,5,7,data(2022,4,12)).


%devolucoes(id_requisicao, data(A,M, D))


devolucoes(2, data(2022, 7,26)).
devolucoes(4, data(2022,2,4)).
devolucoes(5, data(2022, 6, 13)).
devolucoes(1, data(2022, 5, 23)).
devolucoes(6, data(2022, 4, 9)).


%%--EX1--%%

machas(R) :-  findall(N, leitores(_,N,f),L), length(L,R).

nomesMachas(R) :- findall(N,leitores(_,N,f),L), machas(Num), R = (L,Num).

%%--EX2--%%

magicos(R) :- findall(N, (requisicoes(_,_,ID,_), livros(ID,N,Bib), not(biblioteca(Bib,_,_))), R).

magicosID(N,R) :- livros(ID,N,_), R = (N,ID).

magicosEXTRA(R) :- magicos(M), maplist(magicosID, M, R). 

%%--EX3--%%

bracarenses(R) :- findall((NomeLiv,Nome), 
                  (requisicoes(_,IDLeit, IDLiv, _), livros(IDLiv, NomeLiv, Bib),
                  biblioteca(Bib,_,braga), leitores(IDLeit, Nome, _)),R).

%%--EX4--%%

abandonados(R) :- findall(N, (livros(ID,N,_), not(requisicoes(_,_,ID,_))), Req), magicos(M), append(Req,M,R).

%%--EX5--%%

recentezin(R) :- findall((Nome, (2022,M,D)), (livros(ID, Nome, _), requisicoes(_,_,ID,data(2022,M,D))), R).

%%--EX6--%%

veranos(R) :- findall(Nome, (leitores(ID, Nome, _), requisicoes(_,ID,_,data(_,M,_)), M>6, M<10),R).

%%--EX7--%%

xpto([X],X).
xpto([_|T],X) :- xpto(T,X).