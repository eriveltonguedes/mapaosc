-- object: portal.nm_osc_usuario | type: TABLE --
CREATE TABLE portal.nm_osc_usuario(
	bosc_sq_osc integer NOT NULL,
	tusu_sq_usuario integer NOT NULL,
	osus_in_recomendacao boolean NOT NULL,
	CONSTRAINT pk_osus PRIMARY KEY (bosc_sq_osc,tusu_sq_usuario)

);
-- ddl-end --
COMMENT ON TABLE portal.nm_osc_usuario IS 'Tabela N:M do relacionamento entre OSC e Usuário do Portal ';
-- ddl-end --
COMMENT ON COLUMN portal.nm_osc_usuario.bosc_sq_osc IS 'Chave Estrangeira';
-- ddl-end --
COMMENT ON COLUMN portal.nm_osc_usuario.tusu_sq_usuario IS 'Chave Estrangeira';
-- ddl-end --
COMMENT ON COLUMN portal.nm_osc_usuario.osus_in_recomendacao IS 'Indica se o usuário recomendou a OSC';
-- ddl-end --
COMMENT ON CONSTRAINT pk_osus ON portal.nm_osc_usuario IS 'Chave Primária';
-- ddl-end --
-- ddl-end --

-- object: fk_bosc_osus | type: CONSTRAINT --
ALTER TABLE portal.nm_osc_usuario ADD CONSTRAINT fk_bosc_osus FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_tusu_osus | type: CONSTRAINT --
ALTER TABLE portal.nm_osc_usuario ADD CONSTRAINT fk_tusu_osus FOREIGN KEY (tusu_sq_usuario)
REFERENCES portal.tb_usuario (tusu_sq_usuario) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --
