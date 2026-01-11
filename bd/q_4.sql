USE target;

CREATE TABLE Estado (
    id_estado VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    id_estado VARCHAR(5) NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);

CREATE TABLE Tipo_Telefone (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL 
);

CREATE TABLE Telefone (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(20) NOT NULL,
    id_tipo INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_tipo) REFERENCES Tipo_Telefone(id_tipo),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);