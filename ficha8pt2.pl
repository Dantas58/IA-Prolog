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



%%-----------EX1----------%%
machas(R) :- findall(N, leitores(_,N,f), R).



%%-----------EX2----------%%
roubados(R) :- findall(N, (livros(_,N,B), not(biblioteca(B,_,_))), R).




%%-----------EX3----------%%
livros_livrados(R) :- findall((X,Y), (requisicoes(_,IdLeit,IdLiv,_),leitores(IdLeit,Y,_),(livros(IdLiv, X,1);livros(IdLiv,X,2))), R).



%%-----------EX4----------%%
abandonados(R) :- findall(X, (livros(Y,X,_), not(requisicoes(_,_,Y,_))), R).

abandonadosFalsos(R) :- abandonados(L), roubados(L2), append(L,L2,R).


%%----------------------------------------------SAYER-------------------------------------------------------%%
semRequisicoes(SemRequisicoes) :-
    findall(Livro, requisicoes(_,_,Livro,_), Requisitados),
    findall(Livro,(livros(Livro,_,_), not(member(Livro,Requisitados))), NaoRequisitados),
    findall(Biblioteca, biblioteca(Biblioteca,_,_), Bibliotecas),
    findall(Livro, (livros(Livro,_,Biblioteca), not(member(Biblioteca, Bibliotecas))), LivrosSemBiblioteca),
    append(NaoRequisitados, LivrosSemBiblioteca, SemRequisicoes).
%%----------------------------------------------------------------------------------------------------------%%


%%-----------EX5----------%%
livros2022(R) :- findall((Nome, data(2022,M,D)), (livros(IdLiv, Nome, _), requisicoes(_,_,IdLiv,data(2022,M,D))), R).



%%-----------EX6----------%%
nerdsDeVerao(R) :- findall(Nome, (leitores(Id, Nome, _), requisicoes(_,Id,_,data(_,M,_)), M>6, M<10), R).



%%-----------EX7----------%%



