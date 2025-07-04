# 1) Alterar todos os contatos vinculados a um aluno A para um aluno B.
# Aluno A: Ana; Aluno B: Jade
update contato
set idAluno = GetIdAluno("Jade")
where idAluno = GetIDAluno("Ana");

/* 2) Forneça um conjunto de instruções SQL para remover da base de dados um professor
qualquer. Caso o professor seja diretor de uma escola um novo diretor deverá ser
definido. */
update escola
set idDiretor = GetIdProfessor("Antonio")
where idDiretor = GetIDProfessor("Patrick");

delete from ministraTurma
where idProfessor = GetIdProfessor("Patrick");

delete from ministra
where idProfessor = GetIDProfessor("Patrick");

delete from professor
where idProfessor = GetIdProfessor("Patrick");

/* 3) Considerando que um Professor P1 precisou sair de licença médica, substituí-lo por
outro Professor P2 em todas as turmas onde P1 ministra disciplinas. Importante: Caso o
Professor P2 não esteja vinculado a todas as disciplinas ministradas pelo Professor P1,
inclua a informação de que o Professor P2 é capaz de ministrar todas as disciplinas
ministradas pelo Professor P1. */
insert into ministra (idProfessor, idDisciplina)
select GetIdProfessor("Antonio"), idDisciplina
from ministra
where idProfessor = GetIdProfessor("Patrick");

update ministraTurma
set idProfessor = GetIdProfessor("Antonio")
where idProfessor = GetIdProfessor("Patrick");
