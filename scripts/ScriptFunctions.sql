DELIMITER //

CREATE FUNCTION GetIdCidade(nomeCidade VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE cidadeId INT;
    SELECT idCidade INTO cidadeId FROM cidade WHERE nome = nomeCidade LIMIT 1;
    RETURN cidadeId;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION GetIdPessoa(nomePessoa VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE pessoaId INT;
    SELECT idPessoa INTO pessoaId FROM pessoa WHERE nome = nomePessoa LIMIT 1;
    RETURN pessoaId;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION GetIdProfessor(nomeProfessor VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE professorId INT;
    SELECT idProfessor INTO professorId FROM professor, pessoa WHERE idProfessor = pessoa.idPessoa AND pessoa.nome = nomeProfessor LIMIT 1;
    RETURN professorId;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION GetIdEscola(nomeEscola VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE escolaId INT;
    SELECT idEscola INTO escolaId FROM escola WHERE nome = nomeEscola LIMIT 1;
    RETURN escolaId;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION GetIdAluno(nomeAluno VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE alunoId INT;
    SELECT idAluno INTO alunoId FROM aluno, pessoa WHERE idAluno = pessoa.idPessoa AND nome = nomeAluno LIMIT 1;
    RETURN alunoId;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION GetIdTurma(nomeTurma VARCHAR(255), nomeEscola VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE turmaId INT;
    SELECT idTurma INTO turmaId FROM turma, escola WHERE turma.idEscola = GetIdEscola(nomeEscola) AND turma.nome = nomeTurma LIMIT 1;
    RETURN turmaId;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION GetIdDisciplina(nomeDisciplina VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE disciplinaId INT;
    SELECT idDisciplina INTO disciplinaId FROM disciplina WHERE nome = nomeDisciplina LIMIT 1;
    RETURN disciplinaId;
END //

DELIMITER ;