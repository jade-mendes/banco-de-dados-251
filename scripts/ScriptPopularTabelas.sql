#cidades
insert into cidade (idCidade, nome) values 
(1, "Rio de Janeiro"),
(2, "Sao Paulo"),
(3, "Brasilia"),
(4, "Fotaleza"),
(5, "Belo Horizonte"),
(6, "Niteroi"),
(7, "Juiz de Fora");

#disciplinas
insert into disciplina (idDisciplina, nome) values 
(1, "Matematica"),
(2, "Portugues"),
(3, "Historia"),
(4, "Biologia"),
(5, "Geografia"),
(6, "Quimica"),
(7, "Sociologia"),
(8, "Fisica");

#todas as pessoas
insert into pessoa (idPessoa, nome, telefone, idCidade) values
(1, "Antonio", "21971246973", 6),
(2, "Francisco", "21912345678", 1),
(3, "Joao", "21998765432", 6),
(4, "Jade", "21934567891", 1),
(5, "Priscila", "21976543210", 6),
(6, "Ana", "21945612378", 6),
(7, "Patrick", "32975602978", 7),
(8, "Yumi", "21985502875", 6),
(9, "Luis", "11994422556", 2),
(10, "Luana", "11996688447", 2),
(11, "Vitor", "32987159552", 6),
(12, "Pedro", "21948965218", 6),
(13, "Bruno", "21987658259", 6),
(14, "Ingrid", "21945782596", 1);

#professores
insert into professor (idProfessor, RG, CPF, titulacao) values 
(1, "42.356.178-5", "347.982.416-20", "Doutor"), # Antonio
(7, "34.789.206-7", "034.325.728-98", "Doutor"), # Patrick
(10, "22.456.159-3", "478.785.852-15", "Mestre"), # Luana
(14, "15.741.963-8", "159.456.123-02", "Mestre"); # Ingrid

#escolas
insert into escola (idEscola, nome, idCidade, idDiretor) values 
(1, "Escola da UFF", 6, 1),
(2, "Felicidade", 6, 7),
(3, "Escola de SP", 2, 10);

#turmas na escola da uff
insert into turma (idTurma, nome, idEscola) values 
(1, "Turma UFF 1", 1),
(2, "Turma UFF 2", 1);

#turmas na escola Felicidade
insert into turma (idTurma, nome, idEscola) values
(3, "Turma Feliz 1", 2);

#turmas na escola de sp
insert into turma (idTurma, nome, idEscola) values
(4, "Turma SP 1", 3);

#alunos na escola da uff turma 1
insert into aluno (idAluno, matricula, dataNasc, idTurma) values 
(2, "024685317", '2004-12-25', 1), # Francisco
(3, "903176452", '2005-02-10', 1), # Joao
(4, "781239054", '2002-07-15', 1), # Jade
(5, "460981273", '2004-04-30', 1), # Priscila
(6, "135790246", '2003-10-27', 1), # Ana
(8, "574829475", '2005-01-08', 1); # Yumi

#alunos na escola da uff turma 2
insert into aluno (idAluno, matricula, dataNasc, idTurma) values 
(13, "115889475", '2005-08-07', 2); # Bruno

#alunos na escola felicidade turma 1
insert into aluno (idAluno, matricula, dataNasc, idTurma) values 
(11, "789555387", '2005-11-01', 3), # Vitor
(12, "159789123", '2005-01-08', 3); # Pedro

#alunos na escola de sp turma 1
insert into aluno (idAluno, matricula, dataNasc, idTurma) values 
(9, "194628317", '2004-05-19', 4); # Luis

#contatos
insert into contato (nome, telefone, idAluno) values
("Marisa", "21934564127", 4), # contato da Jade
("Jacira", "21945611234", 6), # contato1 da Ana
("Jose", "21919688238", 6); # contato2 da Ana

#ministra
insert into ministra (idProfessor, idDisciplina) values
(7, 1), # Patrick-Matematica
(1, 3), # Antonio-Historia
(10, 4), # Luana-Biologia
(14, 3); # Ingrid-Historia

#ministraTurma
insert into ministraTurma (idTurma, idProfessor, idDisciplina) values
(1, 7, 1), # TurmaUFF1-Patrick-Matematica
(2, 7, 1), # TurmaUFF2-Patrick-Matematica
(3, 7, 1), # TurmaFeliz1-Patrick-Matematica
(4, 10, 4); #TurmaSP1-Luana-Biologia