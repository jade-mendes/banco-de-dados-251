#1) Listar o nome e a cidade das escolas onde todos os alunos residam na mesma cidade onde a escola está localizada.
#2) Listar o nome e matrícula dos alunos sem nenhum contato cadastrado.
select pessoa.nome, matricula from aluno, pessoa where not exists (select * from contato where contato.idAluno = aluno.idAluno) and pessoa.idPessoa = aluno.idAluno;

#3) Listar o código e nome das turmas com mais de 5 alunos.
select turma.idTurma as "Codigo Turma", turma.nome from turma where idTurma in (select idTurma from aluno group by idTurma having count(aluno.idAluno) > 5);

#4) Listar o código, nome e titulação dos professores que ministram aulas para pelo menos três turmas diferentes.
#5) Listar por disciplina o número de professores que podem ministrá-la e quantos efetivamente ministram a mesma para uma turma.
#6) Listar o nome da escola e o nome dos diretores de escola que residem em cidades diferentes da cidade da escola.
select escola.nome as "Nome Escola", pessoa.nome as "Nome Diretor" from escola, professor, pessoa where escola.idDiretor = professor.idProfessor and professor.idProfessor = pessoa.idPessoa and escola.idCidade != pessoa.idCidade;

#7) Listar por escola o número de turmas e o número de professores que ministram alguma disciplina para turmas da escola em questão.
select escola.nome as "Nome Escola", count(distinct turma.idTurma) as "Numero de Turmas", count(ministraTurma.idProfessor) as "Professores que dao Aula" from escola left join turma on escola.idEscola = turma.idEscola left join ministraTurma on turma.idTurma = ministraTurma.idTurma group by escola.idEscola, escola.nome; 

#8) Listar por escola a razão entre o número de alunos da escola e o número de professores que ministram alguma disciplina na escola em questão.
select escola.nome as "Nome Escola", count(distinct aluno.idAluno)/count(distinct ministraTurma.idProfessor) as "Alunos/Professores" from escola left join turma on escola.idEscola = turma.idEscola left join aluno on turma.idTurma = aluno.idTurma left join ministraTurma on turma.idTurma = ministraTurma.idTurma group by escola.nome, escola.idEscola;

#9) Listar todos os contatos dos alunos informando a matrícula e nome do aluno, nome e telefone do contato, ordenado por matrícula do aluno e nome do contato.
select aluno.matricula, pessoa.nome as "Nome Aluno", contato.nome as "Nome Contato", contato.telefone as "Telefone Contato" from aluno, pessoa, contato where pessoa.idPessoa = aluno.idAluno and contato.idAluno = aluno.idAluno order by aluno.matricula, contato.nome;

#10) Listar todos os professores que ministram disciplinas para apenas uma turma.




