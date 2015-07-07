-- object: portal | type: SCHEMA --
CREATE SCHEMA portal;
COMMENT ON SCHEMA portal IS 'Tabelas que são utilizadas exclusivamente para armazenar dados do Portal ou das OSCs cadastrados pelo Portal';

SET search_path TO pg_catalog,public,spat,data,syst,olap,portal;

-- object: portal.tb_usuario | type: TABLE --
CREATE TABLE portal.tb_usuario(
	tusu_sq_usuario serial NOT NULL,
	tpus_cd_tipo_usuario smallint NOT NULL,
	tusu_ee_email character varying(50) NOT NULL,
	tusu_nm_usuario character varying(100) NOT NULL,
	tusu_cd_senha character varying NOT NULL,
	tusu_nr_cpf numeric(11) NOT NULL,
	tusu_in_lista_email boolean NOT NULL,
	tusu_in_ativo boolean NOT NULL DEFAULT true,
	CONSTRAINT pk_pusu PRIMARY KEY (tusu_sq_usuario),
	CONSTRAINT un_email UNIQUE (tusu_ee_email),
	CONSTRAINT un_cpf UNIQUE (tusu_nr_cpf)

);
-- ddl-end --
COMMENT ON TABLE portal.tb_usuario IS 'Tabela que armazena os usuários do Portal';
-- ddl-end --
COMMENT ON COLUMN portal.tb_usuario.tusu_sq_usuario IS 'Código sequencial que identifica o usuário no portal';
-- ddl-end --
COMMENT ON COLUMN portal.tb_usuario.tpus_cd_tipo_usuario IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN portal.tb_usuario.tusu_ee_email IS 'Email do usuário. Utilizado como identificação única no Portal';
-- ddl-end --
COMMENT ON COLUMN portal.tb_usuario.tusu_nm_usuario IS 'Nome do usuário';
-- ddl-end --
COMMENT ON COLUMN portal.tb_usuario.tusu_cd_senha IS 'Senha do usuário cadastrado criptografada';
-- ddl-end --
COMMENT ON COLUMN portal.tb_usuario.tusu_nr_cpf IS 'Número do CPF do usuário';
-- ddl-end --
COMMENT ON COLUMN portal.tb_usuario.tusu_in_lista_email IS 'Indicador de que o usuário participa da lista de email para divulgação';
-- ddl-end --
COMMENT ON COLUMN portal.tb_usuario.tusu_in_ativo IS 'Indicador de usuário ativo no Portal';
-- ddl-end --
COMMENT ON CONSTRAINT pk_pusu ON portal.tb_usuario IS 'Chave primária';
-- ddl-end --
COMMENT ON CONSTRAINT un_email ON portal.tb_usuario IS 'Restrição de email único na base';
-- ddl-end --
COMMENT ON CONSTRAINT un_cpf ON portal.tb_usuario IS 'Restrição de CPF único no Portal';
-- ddl-end --
-- ddl-end --

-- object: portal.tb_usuario_rede_social | type: TABLE --
CREATE TABLE portal.tb_usuario_rede_social(
	ures_nm_login smallint NOT NULL,
	reso_cd_rede_social smallint NOT NULL,
	CONSTRAINT pk_ures PRIMARY KEY (ures_nm_login,reso_cd_rede_social)

);
-- ddl-end --
COMMENT ON TABLE portal.tb_usuario_rede_social IS 'Usuários de redes sociais que possuem acesso ao Portal';
-- ddl-end --
COMMENT ON COLUMN portal.tb_usuario_rede_social.ures_nm_login IS 'Login do usuário na rede social';
-- ddl-end --
COMMENT ON COLUMN portal.tb_usuario_rede_social.reso_cd_rede_social IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON CONSTRAINT pk_ures ON portal.tb_usuario_rede_social IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: portal.tb_rede_social | type: TABLE --
CREATE TABLE portal.tb_rede_social(
	reso_cd_rede_social smallint NOT NULL,
	reso_nm_rede_social character varying(50) NOT NULL,
	CONSTRAINT pk_reso PRIMARY KEY (reso_cd_rede_social)

);
-- ddl-end --
COMMENT ON TABLE portal.tb_rede_social IS 'Tabela de redes sociais do portal';
-- ddl-end --
COMMENT ON COLUMN portal.tb_rede_social.reso_cd_rede_social IS 'Código da rede social';
-- ddl-end --
COMMENT ON COLUMN portal.tb_rede_social.reso_nm_rede_social IS 'Nome da rede social';
-- ddl-end --
COMMENT ON CONSTRAINT pk_reso ON portal.tb_rede_social IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: portal.tb_tipo_usuario | type: TABLE --
CREATE TABLE portal.tb_tipo_usuario(
	tpus_cd_tipo_usuario smallint NOT NULL,
	tpus_nm_tipo_usuario character varying(30) NOT NULL,
	CONSTRAINT pk_tpus PRIMARY KEY (tpus_cd_tipo_usuario)

);
-- ddl-end --
COMMENT ON TABLE portal.tb_tipo_usuario IS 'Tipo de usuário do Portal';
-- ddl-end --
COMMENT ON COLUMN portal.tb_tipo_usuario.tpus_cd_tipo_usuario IS 'Código do tipo de usuário';
-- ddl-end --
COMMENT ON COLUMN portal.tb_tipo_usuario.tpus_nm_tipo_usuario IS 'Nome do tipo de usuário';
-- ddl-end --
COMMENT ON CONSTRAINT pk_tpus ON portal.tb_tipo_usuario IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: portal.tb_token | type: TABLE --
CREATE TABLE portal.tb_token(
	tusu_sq_usuario integer NOT NULL,
	tokn_cd_token character varying(200) NOT NULL,
	CONSTRAINT pk_tokn PRIMARY KEY (tusu_sq_usuario)

);
-- ddl-end --
COMMENT ON TABLE portal.tb_token IS 'Token de validação do usuário';
-- ddl-end --
COMMENT ON COLUMN portal.tb_token.tusu_sq_usuario IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN portal.tb_token.tokn_cd_token IS 'Token gerado para validar o usuário';
-- ddl-end --
COMMENT ON CONSTRAINT pk_tokn ON portal.tb_token IS 'Chave primária';

-- object: fk_tusu_tpus | type: CONSTRAINT --
ALTER TABLE portal.tb_usuario ADD CONSTRAINT fk_tusu_tpus FOREIGN KEY (tpus_cd_tipo_usuario)
REFERENCES portal.tb_tipo_usuario (tpus_cd_tipo_usuario) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_ures_reso | type: CONSTRAINT --
ALTER TABLE portal.tb_usuario_rede_social ADD CONSTRAINT fk_ures_reso FOREIGN KEY (reso_cd_rede_social)
REFERENCES portal.tb_rede_social (reso_cd_rede_social) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --

-- object: pk_tusu_tokn | type: CONSTRAINT --
ALTER TABLE portal.tb_token ADD CONSTRAINT pk_tusu_tokn FOREIGN KEY (tusu_sq_usuario)
REFERENCES portal.tb_usuario (tusu_sq_usuario) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --

-- Rede Social

INSERT INTO portal.tb_rede_social(reso_cd_rede_social, reso_nm_rede_social) VALUES (1, 'Google Plus');
INSERT INTO portal.tb_rede_social(reso_cd_rede_social, reso_nm_rede_social) VALUES (2, 'Facebook');
INSERT INTO portal.tb_rede_social(reso_cd_rede_social, reso_nm_rede_social) VALUES (3, 'LinkedIn');
INSERT INTO portal.tb_rede_social(reso_cd_rede_social, reso_nm_rede_social) VALUES (4, 'Yahoo');
INSERT INTO portal.tb_rede_social(reso_cd_rede_social, reso_nm_rede_social) VALUES (5, 'Twitter');

-- Tipo de usuário

INSERT INTO portal.tb_tipo_usuario(tpus_cd_tipo_usuario, tpus_nm_tipo_usuario) VALUES (1, 'Usuário master');
INSERT INTO portal.tb_tipo_usuario(tpus_cd_tipo_usuario, tpus_nm_tipo_usuario) VALUES (2, 'Usuário padrão do portal');
INSERT INTO portal.tb_tipo_usuario(tpus_cd_tipo_usuario, tpus_nm_tipo_usuario) VALUES (3, 'Usuário de redes sociais');
INSERT INTO portal.tb_tipo_usuario(tpus_cd_tipo_usuario, tpus_nm_tipo_usuario) VALUES (4, 'Representante da Entidade');