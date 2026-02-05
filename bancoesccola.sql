-- 1. Criar o Banco de Dados
CREATE DATABASE EscolaDB;
USE EscolaDB;

-- 2. Tabela de Professores
CREATE TABLE Professores (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- 3. Tabela de Disciplinas
CREATE TABLE Disciplinas (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome_disciplina VARCHAR(50) NOT NULL,
    carga_horaria INT
);

-- 4. Tabela de Alunos
CREATE TABLE Alunos (
    id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    matricula VARCHAR(20) UNIQUE
);

-- 5. Tabela de Turmas (Relaciona Professor e Disciplina)
CREATE TABLE Turmas (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT,
    id_disciplina INT,
    ano_letivo INT,
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

-- 6. Tabela de Matrículas (Relaciona Alunos às Turmas)
CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_turma INT,
    nota_final DECIMAL(4,2),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_alumno),
    FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma)
);
