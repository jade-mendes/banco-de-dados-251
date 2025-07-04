#cidades
insert into cidade (idCidade, nome) values 
(default, "Rio de Janeiro"),
(default, "Sao Paulo"),
(default, "Brasilia"),
(default, "Fotaleza"),
(default, "Belo Horizonte"),
(default, "Niteroi"),
(default, "Juiz de Fora");

#disciplinas
insert into disciplina (idDisciplina, nome) values 
(default, "Matematica"),
(default, "Portugues"),
(default, "Historia"),
(default, "Biologia"),
(default, "Geografia"),
(default, "Quimica"),
(default, "Sociologia"),
(default, "Fisica");

#todas as pessoas
insert into pessoa (idPessoa, nome, telefone, idCidade) values
(default, "Antonio", "971246973", GetIdCidade("Niteroi")),
(default, "Francisco", "912345678", GetIdCidade("Rio de Janeiro")),
(default, "Joao", "998765432", GetIdCidade("Niteroi")),
(default, "Jade", "934567891", GetIdCidade("Rio de Janeiro")),
(default, "Priscila", "976543210", GetIdCidade("Niteroi")),
(default, "Ana", "945612378", GetIdCidade("Niteroi")),
(default, "Patrick", "975602978", GetIdCidade("Juiz de Fora")),
(default, "Yumi", "985502875", GetIdCidade("Niteroi"));

#professores na escola da uff
insert into professor (idProfessor, RG, CPF, titulacao) values 
(GetIdPessoa("Antonio"), "423561785", "34798241620", "Doutor"),
(GetIdPessoa("Patrick"), "347892067", "03432572898", "Rei, Imperador Supremo, Lider Incondicional, Mago da Nevoa, Pos-Doc");

#escolas
insert into escola (idEscola, nome, idCidade, idDiretor) values 
(default, "Escola da UFF", GetIdCidade("Niteroi"), GetIdProfessor("Antonio")),
(default, "Felicidade", GetIdCidade("Niteroi"), GetIdProfessor("Patrick"));

#turmas na escola da uff
insert into turma (idTurma, nome, idEscola) values 
(default, "Turma 1", GetIdEscola("Escola da UFF"));

insert into turma (idTurma, nome, idEscola) values 
(default, "Turma 2", GetIdEscola("Escola da UFF"));

#turmas na escola Felicidade
insert into turma (idTurma, nome, idEscola) values
(default, "Turma Feliz 1", GetIdEscola("Felicidade"));

#alunos na escola da uff turma 1
insert into aluno (idAluno, matricula, dataNasc, idTurma) values 
(GetIdPessoa("Francisco"), "024685317", '2004-12-25', GetIdTurma("Turma 1", "Escola da UFF")),
(GetIdPessoa("Joao"), "903176452", '2005-02-10', GetIdTurma("Turma 1", "Escola da UFF")),
(GetIdPessoa("Jade"), "781239054", '2002-07-15', GetIdTurma("Turma 1", "Escola da UFF")),
(GetIdPessoa("Priscila"), "460981273", '2004-04-30', GetIdTurma("Turma 1", "Escola da UFF")),
(GetIdPessoa("Ana"), "135790246", '2003-10-27', GetIdTurma("Turma 1", "Escola da UFF")),
(GetIdPessoa("Yumi"), "574829475", '2005-01-08', GetIdTurma("Turma 1", "Escola da UFF"));

#contatos
insert into contato (nome, telefone, idAluno) values
("Marisa", "934564127", GetIdAluno("Jade")),
("Jacira", "945611234", GetIdAluno("Ana"));

#ministra
insert into ministra (idProfessor, idDisciplina) values
(GetIdProfessor("Patrick"), GetIdDisciplina("Matematica")),
(GetIdProfessor("Antonio"), GetIdDisciplina("Historia"));

#ministraTurma
insert into ministraTurma (idTurma, idProfessor, idDisciplina) values
(GetIdTurma("Turma 1", "Escola da UFF"), GetIdProfessor("Patrick"), GetIdDisciplina("Matematica"));

insert into ministraTurma (idTurma, idProfessor, idDisciplina) values
(GetIdTurma("Turma 2", "Escola da UFF"), GetIdProfessor("Patrick"), GetIdDisciplina("Matematica"));

insert into ministraTurma (idTurma, idProfessor, idDisciplina) values
(GetIdTurma("Turma Feliz 1", "Felicidade"), GetIdProfessor("Patrick"), GetIdDisciplina("Matematica"));