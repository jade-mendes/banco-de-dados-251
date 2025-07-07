/* 1) Alterar todos os contatos vinculados a um aluno A para um aluno B.
	  Aluno A: Ana; Aluno B: Joao */
update contato
set idAluno = 3 # Joao
where idAluno = 6; # Ana

/* 2) Forneça um conjunto de instruções SQL para remover da base de dados um professor
qualquer. Caso o professor seja diretor de uma escola um novo diretor deverá ser
definido. */
update escola
set idDiretor = 14 # Ingrid
where idDiretor = 7; # Patrick

delete from ministraTurma
where idProfessor = 7; # Patrick

delete from ministra
where idProfessor = 7; # Patrick

delete from pessoa
where idPessoa = 7; # Patrick

/* 3) Considerando que um Professor P1 precisou sair de licença médica, substituí-lo por
outro Professor P2 em todas as turmas onde P1 ministra disciplinas. Importante: Caso o
Professor P2 não esteja vinculado a todas as disciplinas ministradas pelo Professor P1,
inclua a informação de que o Professor P2 é capaz de ministrar todas as disciplinas
ministradas pelo Professor P1. */
insert into ministra (idProfessor, idDisciplina)
select 1, idDisciplina # Antonio
from ministra
where idProfessor = 10 # Luana
	and idDisciplina not in (select m.idDisciplina
							 from ministra m
                             where m.idProfessor = 1);

update ministraTurma
set idProfessor = 1 # Antonio
where idProfessor = 10; # Luana