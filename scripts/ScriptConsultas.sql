#1) Listar o nome e a cidade das escolas onde todos os alunos residam na mesma cidade onde a escola está localizada.
select e.nome as "escola", c.nome as "cidade"
from escola e, cidade c
where e.idCidade = c.idCidade
	and e.idEscola not in (select escola.idEscola
						   from pessoa, aluno, turma, escola
						   where pessoa.idPessoa = aluno.idAluno
							   and aluno.idTurma = turma.idTurma
							   and turma.idEscola = escola.idEscola
							   and escola.idCidade != pessoa.idCidade);

#2) Listar o nome e matrícula dos alunos sem nenhum contato cadastrado.
select pessoa.nome as "nome aluno", matricula 
from aluno, pessoa 
where not exists (select *
				  from contato
                  where contato.idAluno = aluno.idAluno)
				      and pessoa.idPessoa = aluno.idAluno;

#3) Listar o código e nome das turmas com mais de 5 alunos.
select turma.idTurma as "codigo turma", turma.nome as "nome turma"
from turma
where idTurma in (select idTurma
				  from aluno
				  group by idTurma
				  having count(aluno.idAluno) > 5);

#4) Listar o código, nome e titulação dos professores que ministram aulas para pelo menos três turmas diferentes.
select professor.idProfessor as "codigo", pessoa.nome, professor.titulacao
from professor, pessoa
where professor.idProfessor = pessoa.idPessoa
	and professor.idProfessor in (select idProfessor
								  from ministraTurma
								  group by idProfessor
								  having count(distinct idTurma) >= 3);

#5) Listar por disciplina o número de professores que podem ministrá-la e quantos efetivamente ministram a mesma para uma turma.
select disciplina.nome as "disciplina", count(distinct ministra.idProfessor) as "professores possiveis", count(distinct ministraTurma.idProfessor) as "professores efetivos"
from disciplina left join ministra on disciplina.idDisciplina = ministra.idDisciplina left join ministraTurma on disciplina.idDisciplina = ministraTurma.idDisciplina
group by disciplina.nome;

#6) Listar o nome da escola e o nome dos diretores de escola que residem em cidades diferentes da cidade da escola.
select escola.nome as "nome escola", pessoa.nome as "nome diretor"
from escola, professor, pessoa
where escola.idDiretor = professor.idProfessor
	and professor.idProfessor = pessoa.idPessoa
	and escola.idCidade != pessoa.idCidade;

#7) Listar por escola o número de turmas e o número de professores que ministram alguma disciplina para turmas da escola em questão.
select escola.nome as "nome escola", count(distinct turma.idTurma) as "numero de turmas", count(distinct ministraTurma.idProfessor) as "professores que dao aula"
from escola left join turma on escola.idEscola = turma.idEscola left join ministraTurma on turma.idTurma = ministraTurma.idTurma
group by escola.idEscola, escola.nome;

#8) Listar por escola a razão entre o número de alunos da escola e o número de professores que ministram alguma disciplina na escola em questão.
select escola.nome as "nome escola", count(distinct aluno.idAluno)/count(distinct ministraTurma.idProfessor) as "alunos/professores"
from escola left join turma on escola.idEscola = turma.idEscola left join aluno on turma.idTurma = aluno.idTurma left join ministraTurma on turma.idTurma = ministraTurma.idTurma
group by escola.nome, escola.idEscola;

#9) Listar todos os contatos dos alunos informando a matrícula e nome do aluno, nome e telefone do contato, ordenado por matrícula do aluno e nome do contato.
select aluno.matricula as "matricula aluno", pessoa.nome as "nome aluno", contato.nome as "nome contato", contato.telefone as "telefone contato"
from aluno, pessoa, contato
where pessoa.idPessoa = aluno.idAluno
	and contato.idAluno = aluno.idAluno
order by aluno.matricula, contato.nome;

#10) Listar todos os professores que ministram disciplinas para apenas uma turma.
select pessoa.nome as "nome professor"
from professor, pessoa
where professor.idProfessor = pessoa.idPessoa
	and professor.idProfessor in (select idProfessor
								  from ministraTurma
								  group by idProfessor
								  having count(distinct idTurma) = 1);