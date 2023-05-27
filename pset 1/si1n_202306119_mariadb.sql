-- ALUNO: CAIO SILVA CAMPOS
-- TURMA: SI1N
-- MATRICULA: 202306119
-- MARIADB

--REMOVER BANCO DE DADOS CASO EXISTA
DROP DATABASE IF EXISTS uvv;

-- CRIAR BANCO DE DADOS
CREATE DATABASE uvv 
CHARACTER SET = 'UTF8';


--CRIAR USUÁRIO
CREATE USER caio_silva@localhost;

--COMANDO PARA CONECTAR AO BANCO DE DADOS
USE uvv;

-- CRIAÇÃO TABELA PRODUTOS
CREATE TABLE Produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome_produtos VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes LONGBLOB,
                imagem_produtos LONGBLOB,
                mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                PRIMARY KEY (produto_id)
);

ALTER TABLE Produtos COMMENT 'Tabela que armazena informações do produto';

ALTER TABLE Produtos MODIFY COLUMN produto_id NUMERIC(38) COMMENT 'id dos produtos';

ALTER TABLE Produtos MODIFY COLUMN nome_produtos VARCHAR(255) COMMENT 'nome dos produtos';

ALTER TABLE Produtos MODIFY COLUMN preco_unitario NUMERIC(10, 2) COMMENT 'Detalhes';

ALTER TABLE Produtos MODIFY COLUMN detalhes BLOB COMMENT 'Detalhes dos produtos';

ALTER TABLE Produtos MODIFY COLUMN imagem_produtos BLOB COMMENT 'imagem dos produtos';

ALTER TABLE Produtos MODIFY COLUMN mime_type VARCHAR(512) COMMENT 'tipo de arquivo da imagem';

ALTER TABLE Produtos MODIFY COLUMN imagem_arquivo VARCHAR(512) COMMENT 'arquivo da imagem';

ALTER TABLE Produtos MODIFY COLUMN imagem_charset VARCHAR(512) COMMENT 'charset das imagens';

ALTER TABLE Produtos MODIFY COLUMN imagem_ultima_atualizacao DATE COMMENT 'data da ultima atualizacao da imagem';


-- CRIAÇÃO TABELA LOJAS
CREATE TABLE Lojas (
                loja_id NUMERIC(38) NOT NULL,
                Nome VARCHAR(255) NOT NULL,
                endereco_fisico VARCHAR(512),
                endereco_web VARCHAR(100),
                latitude NUMERIC,
                longitude NUMERIC,
                logo LONGBLOB,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                PRIMARY KEY (loja_id)
);

ALTER TABLE Lojas COMMENT 'Tabela que armazena informações das lojas';

ALTER TABLE Lojas MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'id das lojas';

ALTER TABLE Lojas MODIFY COLUMN Nome VARCHAR(255) COMMENT 'nome das lojas';

ALTER TABLE Lojas MODIFY COLUMN endereco_fisico VARCHAR(512) COMMENT 'endereço das lojas';

ALTER TABLE Lojas MODIFY COLUMN endereco_web VARCHAR(100) COMMENT 'site das lojas';

ALTER TABLE Lojas MODIFY COLUMN latitude NUMERIC COMMENT 'latitude das lojas';

ALTER TABLE Lojas MODIFY COLUMN longitude NUMERIC COMMENT 'longitude das lojas';

ALTER TABLE Lojas MODIFY COLUMN logo BLOB COMMENT 'logo das lojas';

ALTER TABLE Lojas MODIFY COLUMN logo_mime_type VARCHAR(512) COMMENT 'tipo de arquivo da logo';

ALTER TABLE Lojas MODIFY COLUMN logo_arquivo VARCHAR(512) COMMENT 'arquivo da logo';

ALTER TABLE Lojas MODIFY COLUMN logo_charset VARCHAR(512) COMMENT 'charset da logo';

ALTER TABLE Lojas MODIFY COLUMN logo_ultima_atualizacao DATE COMMENT 'data da ultima atualização da logo';


-- CRIAÇÃO TABELA ESTOQUES
CREATE TABLE Estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                PRIMARY KEY (estoque_id)
);

ALTER TABLE Estoques COMMENT 'TAbela que armazena informações sobre o estoque dos produtos';

ALTER TABLE Estoques MODIFY COLUMN estoque_id NUMERIC(38) COMMENT 'id do estoque';

ALTER TABLE Estoques MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'id das lojas';

ALTER TABLE Estoques MODIFY COLUMN quantidade NUMERIC(38) COMMENT 'quantidade dos produtos no estoque';

ALTER TABLE Estoques MODIFY COLUMN produto_id NUMERIC(38) COMMENT 'id dos produtos';



-- CRIAÇÃO TABELA CLIENTES
CREATE TABLE Clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                PRIMARY KEY (cliente_id)
);

ALTER TABLE Clientes COMMENT 'Tabela para armazenar os dados de todos os clientes';

ALTER TABLE Clientes MODIFY COLUMN cliente_id NUMERIC(38) COMMENT 'coluna sobre os id dos clientes';

ALTER TABLE Clientes MODIFY COLUMN email VARCHAR(255) COMMENT 'email dos clientes';

ALTER TABLE Clientes MODIFY COLUMN nome VARCHAR(255) COMMENT 'nome dos clientes';

ALTER TABLE Clientes MODIFY COLUMN telefone1 VARCHAR(20) COMMENT 'numeros de telefone dos clientes';

ALTER TABLE Clientes MODIFY COLUMN telefone2 VARCHAR(20) COMMENT 'outro numero de telefone dos clientes';

ALTER TABLE Clientes MODIFY COLUMN telefone3 VARCHAR(20) COMMENT 'numero alternativo de telefone dos clientes';


-- CRIAÇÃO TABELA ENVIOS

CREATE TABLE Envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                PRIMARY KEY (envio_id)
);

ALTER TABLE Envios COMMENT 'Tabela que armazena informações dos envios';

ALTER TABLE Envios MODIFY COLUMN envio_id NUMERIC(38) COMMENT 'id do envio';

ALTER TABLE Envios MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'id das lojas';

ALTER TABLE Envios MODIFY COLUMN cliente_id NUMERIC(38) COMMENT 'coluna sobre os id dos clientes';

ALTER TABLE Envios MODIFY COLUMN endereco_entrega VARCHAR(512) COMMENT 'endereço de entrega';

ALTER TABLE Envios MODIFY COLUMN status VARCHAR(15) COMMENT 'status do envio';


CREATE TABLE Pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora DATETIME NOT NULL,
                status VARCHAR(15) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                PRIMARY KEY (pedido_id)
);

ALTER TABLE Pedidos COMMENT 'Tabela que armazena todos os pedidos, das lojas';

ALTER TABLE Pedidos MODIFY COLUMN pedido_id NUMERIC(38) COMMENT 'id dos pedidos';

ALTER TABLE Pedidos MODIFY COLUMN data_hora TIMESTAMP COMMENT 'data e hora em que os pedidos foram realizados';

ALTER TABLE Pedidos MODIFY COLUMN status VARCHAR(15) COMMENT 'status dos pedidos';

ALTER TABLE Pedidos MODIFY COLUMN cliente_id NUMERIC(38) COMMENT 'coluna sobre os id dos clientes';

ALTER TABLE Pedidos MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'id das lojas';


-- CRIAÇÃO PEDIDOS_ITENS
CREATE TABLE pedidos_itens (
                produto_id NUMERIC(38) NOT NULL,
                pedido_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                PRIMARY KEY (produto_id, pedido_id)
);

ALTER TABLE pedidos_itens COMMENT 'itens dos pedidos';

ALTER TABLE pedidos_itens MODIFY COLUMN produto_id NUMERIC(38) COMMENT 'id dos produtos';

ALTER TABLE pedidos_itens MODIFY COLUMN pedido_id NUMERIC(38) COMMENT 'id dos pedidos';

ALTER TABLE pedidos_itens MODIFY COLUMN numero_da_linha NUMERIC(38) COMMENT 'numero da linha dos items do pedido';

ALTER TABLE pedidos_itens MODIFY COLUMN preco_unitario NUMERIC(10, 2) COMMENT 'preco dos items';

ALTER TABLE pedidos_itens MODIFY COLUMN envio_id NUMERIC(38) COMMENT 'id do envio';

-- CRIAÇÃO DAS PKS E FKS

ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES Produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES Produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES Lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES Lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES Lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES Clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES Clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES Envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES Pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

alter table Pedidos add constraint check_status_pedidos
check (status in ('CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO'));

alter table Envios add constraint check_status_envios
check (status in ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'));

ALTER TABLE Lojas
ADD CONSTRAINT check_enderecos
CHECK ((endereco_fisico IS NOT NULL AND endereco_web IS NULL) OR
       (endereco_fisico IS NULL AND endereco_web IS NOT NULL));

      
ALTER TABLE Produtos
add constraint check_preco
CHECK (preco_unitario >= 0);

ALTER TABLE Estoques
ADD CONSTRAINT check_quantidade_estoques
CHECK (quantidade >= 0);

ALTER TABLE pedidos_itens
ADD CONSTRAINT check_quantidade_pedidos_itens
CHECK (quantidade >= 0);