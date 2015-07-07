DROP TABLE portal.vm_osc_principal;

CREATE TABLE portal.vm_osc_principal
(
        bosc_sq_osc integer NOT NULL,
        bosc_nr_identificacao numeric(14,0) NOT NULL,
        dcti_cd_tipo smallint NOT NULL,
        bosc_nm_osc character varying(250) NOT NULL,
        bosc_nm_fantasia_osc character varying(250),
        ospr_tx_descricao text,
        ospr_ds_endereco character varying(200) NOT NULL,
        ospr_ds_endereco_complemento character varying(200),
        ospr_nm_bairro character varying(200),
        ospr_nm_municipio character varying(50) NOT NULL,
        ospr_sg_uf character varying(2) NOT NULL,
        ospr_nm_cep numeric(8,0),
        ospr_geometry geometry(Point,4674) NOT NULL,
        ospr_cd_municipio numeric(7,0) NOT NULL,
        dcsc_cd_alpha_subclasse character varying(10),
        dcsc_nm_subclasse character varying(250),
        dcte_ds_tamanho_estabelecimento character varying(50),
        dcnj_cd_alpha_natureza_juridica character varying(5),
        dcnj_nm_natureza_juridica character varying(100),
        ospr_dt_ano_fundacao numeric(4,0),
	ospr_ee_site text,
	CONSTRAINT pk_ospr PRIMARY KEY (bosc_sq_osc), -- Chave primária da tabela de Organizações da Sociedade Civil
	CONSTRAINT fk_bosc_ospr FOREIGN KEY (bosc_sq_osc)
		REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO portal.vm_osc_principal(
            bosc_sq_osc, bosc_nr_identificacao, dcti_cd_tipo, bosc_nm_osc, bosc_nm_fantasia_osc,
            ospr_ds_endereco, ospr_ds_endereco_complemento, ospr_nm_bairro,
            ospr_nm_municipio, ospr_sg_uf, ospr_nm_cep, ospr_geometry, ospr_cd_municipio, dcsc_cd_alpha_subclasse,
            dcsc_nm_subclasse, dcte_ds_tamanho_estabelecimento, dcnj_cd_alpha_natureza_juridica,
            dcnj_nm_natureza_juridica, ospr_dt_ano_fundacao)
SELECT
  tb_osc.bosc_sq_osc,
  tb_osc.bosc_nr_identificacao,
  tb_osc.dcti_cd_tipo,
  tb_osc.bosc_nm_osc,
  tb_osc.bosc_nm_fantasia_osc,
  COALESCE(tb_localizacao.loca_ds_endereco_corrigido, tb_localizacao.loca_ds_endereco) loca_ds_endereco,
  tb_localizacao.loca_ds_endereco_complemento,
  COALESCE(tb_localizacao.loca_nm_bairro, tb_localizacao.loca_nm_bairro_encontrado) loca_nm_bairro,
  ed_municipio.edmu_nm_municipio,
  ed_uf.eduf_sg_uf,
  tb_localizacao.loca_nm_cep,
  tb_osc.bosc_geometry,
  tb_localizacao.edmu_cd_municipio,
  dc_subclasse_cnae_2_1.dcsc_cd_alpha_subclasse,
  dc_subclasse_cnae_2_1.dcsc_nm_subclasse,
  dc_rais_tamanho_estabelecimento.dcte_ds_tamanho_estabelecimento,
  dc_natureza_juridica.dcnj_cd_alpha_natureza_juridica,
  dc_natureza_juridica.dcnj_nm_natureza_juridica,
  tb_osc_censo_suas.suas_dt_ano_fundacao
FROM
  data.tb_osc
JOIN portal.tb_osc_interacao ON (tb_osc.bosc_sq_osc = portal.tb_osc_interacao.bosc_sq_osc)
JOIN data.tb_localizacao ON (tb_osc.bosc_sq_osc = tb_localizacao.bosc_sq_osc)
JOIN spat.ed_municipio ON (tb_localizacao.edmu_cd_municipio = ed_municipio.edmu_cd_municipio)
JOIN spat.ed_uf ON (ed_municipio.eduf_cd_uf = ed_uf.eduf_cd_uf)
LEFT JOIN data.tb_osc_rais ON (tb_osc.bosc_sq_osc = tb_osc_rais.bosc_sq_osc)
LEFT JOIN data.dc_subclasse_cnae_2_1 ON (tb_osc_rais.dcsc_cd_subclasse = dc_subclasse_cnae_2_1.dcsc_cd_subclasse)
LEFT JOIN data.dc_rais_tamanho_estabelecimento ON (tb_osc_rais.dcte_cd_tamanho_estabelecimento = dc_rais_tamanho_estabelecimento.dcte_cd_tamanho_estabelecimento)
LEFT JOIN data.dc_natureza_juridica ON (tb_osc_rais.dcnj_cd_natureza_juridica = dc_natureza_juridica.dcnj_cd_natureza_juridica)
LEFT JOIN data.tb_osc_censo_suas ON (tb_osc.bosc_sq_osc = tb_osc_censo_suas.bosc_sq_osc)
WHERE
  tb_localizacao.mdfd_cd_fonte_dados = (SELECT min(a.mdfd_cd_fonte_dados) FROM data.tb_localizacao a JOIN data.tb_osc b ON (a.bosc_sq_osc = b.bosc_sq_osc) WHERE b.bosc_sq_osc = tb_osc.bosc_sq_osc AND a.loca_geometry = b.bosc_geometry) AND
  tb_osc_interacao.inte_in_osc = true AND
  tb_osc.bosc_geometry is not null;


UPDATE portal.vm_osc_principal  SET ospr_ee_site = tb_contatos.cont_ee_site FROM data.tb_contatos
WHERE tb_contatos.bosc_sq_osc = vm_osc_principal.bosc_sq_osc AND tb_contatos.cont_ee_site IS NOT NULL;

  DROP TABLE portal.tb_osc_contato CASCADE ;

  CREATE TABLE portal.tb_osc_contato
(
	bosc_sq_osc integer NOT NULL, -- Chave estrangeira (código da OSC)
	cont_cd_contato smallint NOT NULL,
	cont_ds_tipo_contato character varying(50) NOT NULL,
	cont_ds_contato character varying(200) NOT NULL,
	CONSTRAINT pk_cont PRIMARY KEY (bosc_sq_osc, cont_cd_contato), -- Chave primária da tabela de contatos do portal
	CONSTRAINT fk_bosc_cont FOREIGN KEY (bosc_sq_osc)
		REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO portal.tb_osc_contato(bosc_sq_osc, cont_cd_contato, cont_ds_tipo_contato, cont_ds_contato)
SELECT bosc_sq_osc, row_number() OVER (PARTITION by bosc_sq_osc) as rnum , tipo, descricao FROM (
SELECT tb_contatos.bosc_sq_osc, 'Telefone' tipo, tb_contatos.cont_tx_telefone descricao
FROM data.tb_contatos WHERE tb_contatos.cont_tx_telefone IS NOT NULL AND tb_contatos.mdfd_cd_fonte_dados != 1
UNION
SELECT tb_contatos.bosc_sq_osc, 'Email' tipo, tb_contatos.cont_ee_email descricao
FROM data.tb_contatos WHERE tb_contatos.cont_ee_email IS NOT NULL AND tb_contatos.mdfd_cd_fonte_dados != 1
UNION
SELECT tb_contatos.bosc_sq_osc, 'Representante' tipo, tb_contatos.cont_nm_representante descricao
FROM data.tb_contatos WHERE tb_contatos.cont_nm_representante IS NOT NULL AND tb_contatos.mdfd_cd_fonte_dados != 1
) T ORDER BY bosc_sq_osc