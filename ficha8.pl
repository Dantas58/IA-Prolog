
aluno(1,joao,ma).
aluno(2,antonio,ma).
aluno(3,carlos,ma).
aluno(4,luisa,f).
aluno(5,maria,f).
aluno(6,isabel,f).

curso(1,lei).
curso(2,miei).
curso(3,lcc).

%disciplina(cod,sigla,ano,curso)
disciplina(1,ed,2,1).
disciplina(2,ia,3,1).
disciplina(3,fp,1,2).

%inscrito(aluno,disciplina)
inscrito(1,1).
inscrito(1,2).
inscrito(5,3).
inscrito(5,5).
inscrito(2,5).

%nota(aluno,disciplina,nota)
nota(1,1,15).
nota(1,2,16).
nota(1,5,20).
nota(2,5,10).
nota(3,5,8).

%copia
copia(1,2).
copia(2,3).
copia(3,4).

alunoVadio(N) :- aluno(Id, N, _), not(inscrito(Id, _)).    
listaAlunosVadios(R) :- findall(N, alunoVadio(N), R).



alunoVadio2(N) :- aluno(Id,N,_), not(inscrito(Id,_)); 
                  aluno(Id,N,_), inscrito(Id,Disc), not(disciplina(Disc,_,_,_)).

alunoVadioMentiroso(R) :- findall(N, alunoVadio2(N), R).



alunoVadioTeste(R) :- findall(Id, disciplina(Id,_,_,_), L), 
                      findall(Alunos, (inscrito(Alunos,X), not(member(X,L))),L2),
                      findall(Alunos2, (inscrito(Alunos2,Y), member(Y,L)), L3),
                      findall(IDS, (aluno(IDS,_,_), member(IDS,L2), (member(IDS,L3))), R).

listaAlunosVadiosTeste(R) :- listaAlunosVadios(M), alunoVadioTeste(N), append(N,M,R). 



%%-------------------------------T-Balé---------------------------------%%
%alunoNaoInscritoDV(Aluno) :-aluno(Aluno,_,_), 
%							(inscrito(Aluno,Disciplina),
%								not(disciplina(Disciplina,_,_,_)); 
%								not(inscrito(Aluno,_))). 
%
%naoInscritosDV(L) :- findall(Aluno, alunoNaoInscritoDV(Aluno), L).
%%-----------------------------------------------------------------------%%




notasAluno(Id, R) :- findall(N, nota(Id,_,N), R).

soma([],0).
soma([H|T], R) :- soma(T, R1), R is R1+H.

comprimento([], 0).
comprimento([H|T], R) :- comprimento(T, R1), R is R1+1.

mediaAluno(Id, R) :- notasAluno(Id, X), soma(X,Y), comprimento(X,Z), R is Y/Z.

mediaTotal(R) :- findall(N, nota(_,_,N), L), soma(L, X), comprimento(L, Y), R is X/Y.

comparaMedia(ID,R) :- mediaAluno(ID, M), mediaTotal(MT), (M>MT) -> R = 'true'; R = 'false'.

xicosEspertos(R) :- setof(Xicos, (nota(Xicos,_,_), comparaMedia(Xicos,T), T=='true'), R).



copioes(R) :- findall(N,(aluno(Id,N,_), copia(Id,_)), R).

mapToNome(L, R) :- findall(IDS, aluno(IDS,_,_), Validos),
                   findall(X, (member(X,L),member(X,Validos)), Alunos),
                   findall(Nomes, (aluno(IDS,Nomes,_), member(IDS,Alunos)), R).



%%---------------------------------SAYER--------------------------------%%
%mapToNome([], []).
%mapToNome([H|T], [Nome|R1]) :- aluno(H, Nome, _), mapToNome(T, R1),!.
%mapToNome([H|T], R1) :- mapToNome(T, R1).
%%----------------------------------------------------------------------%%