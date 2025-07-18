DROP SCHEMA IF EXISTS CadastroDeEscolas;

CREATE SCHEMA CadastroDeEscolas;

USE CadastroDeEscolas;

CREATE TABLE cidade(
	idCidade INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    PRIMARY KEY (idCidade)
);

CREATE TABLE pessoa(
	idPessoa INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    telefone CHAR(11) NOT NULL,
    idCidade INT NOT NULL,
    PRIMARY KEY (idPessoa),
    FOREIGN KEY (idCidade) REFERENCES cidade (idCidade)
);

CREATE TABLE professor(
	idProfessor INT NOT NULL,
    RG CHAR(12) NOT NULL,
    CPF CHAR(14) NOT NULL,
    titulacao VARCHAR(255) NOT NULL,
    PRIMARY KEY (idProfessor),
    UNIQUE KEY (RG),
    UNIQUE KEY (CPF),
    FOREIGN KEY (idProfessor) REFERENCES pessoa (idPessoa)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE disciplina(
	idDisciplina INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    PRIMARY KEY (idDisciplina)
);

CREATE TABLE escola(
	idEscola INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    idCidade INT NOT NULL,
    idDiretor INT NOT NULL,
    PRIMARY KEY (idEscola),
    FOREIGN KEY (idCidade) REFERENCES cidade (idCidade),
    FOREIGN KEY (idDiretor) REFERENCES professor (idProfessor)
);

CREATE TABLE turma(
	idTurma INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    idEscola INT NOT NULL,
    PRIMARY KEY (idTurma),
    FOREIGN KEY (idEscola) REFERENCES escola (idEscola)
);

CREATE TABLE ministra(
	idProfessor INT NOT NULL,
    idDisciplina INT NOT NULL,
    PRIMARY KEY (idProfessor, idDisciplina),
    FOREIGN KEY (idProfessor) REFERENCES professor (idProfessor),
    FOREIGN KEY (idDisciplina) REFERENCES disciplina (idDisciplina)
);

CREATE TABLE ministraTurma(
	idTurma INT NOT NULL,
    idProfessor INT NOT NULL,
    idDisciplina INT NOT NULL,
    PRIMARY KEY (idTurma, idProfessor, idDisciplina),
    FOREIGN KEY (idTurma) REFERENCES turma (idTurma),
    FOREIGN KEY (idProfessor, idDisciplina) REFERENCES ministra (idProfessor, idDisciplina)
);

CREATE TABLE aluno(
	idAluno INT NOT NULL,
    matricula CHAR(9) NOT NULL,
    dataNasc DATE NOT NULL,
    idTurma INT NOT NULL,
    PRIMARY KEY (idAluno),
    FOREIGN KEY (idAluno) REFERENCES pessoa (idPessoa)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (idTurma) REFERENCES turma (idTurma)
);

CREATE TABLE contato(
	nome VARCHAR(255) NOT NULL,
    telefone CHAR(11) NOT NULL,
    idAluno INT NOT NULL,
    PRIMARY KEY (nome, idAluno),
    FOREIGN KEY (idAluno) REFERENCES aluno (idAluno)
);