-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- PostgreSQL version: 9.1
-- Project Site: pgmodeler.com.br
-- Model Author: Victor Azevedo

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: md_portal_osc | type: DATABASE --
-- -- Banco de dados do Portal das Organizações da Sociedade Civil --
-- CREATE DATABASE md_portal_osc
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'pt_BR.UTF8'
-- 	LC_CTYPE = 'pt_BR.UTF8'
-- ;
-- -- ddl-end --
-- 

-- object: spat | type: SCHEMA --
CREATE SCHEMA spat;
COMMENT ON SCHEMA spat IS 'Esquema das dimensões espaciais';
-- ddl-end --
-- ddl-end --

-- object: data | type: SCHEMA --
CREATE SCHEMA data;
COMMENT ON SCHEMA data IS 'Esquema que contém os dados da pesquisa da FGV com as 17 bases de dados coletadas';
-- ddl-end --
-- ddl-end --

-- object: syst | type: SCHEMA --
CREATE SCHEMA syst;
COMMENT ON SCHEMA syst IS 'Esquema interno do portal';
-- ddl-end --
-- ddl-end --

-- object: olap | type: SCHEMA --
CREATE SCHEMA olap;
COMMENT ON SCHEMA olap IS 'Modelo olap';
-- ddl-end --
-- ddl-end --

-- object: portal | type: SCHEMA --
CREATE SCHEMA portal;
COMMENT ON SCHEMA portal IS 'Tabelas que são utilizadas exclusivamente para armazenar dados do Portal ou das OSCs cadastrados pelo Portal';
-- ddl-end --
-- ddl-end --

SET search_path TO pg_catalog,public,spat,data,syst,olap,portal;
-- ddl-end --

-- object: spat.ed_regiao | type: TABLE --
CREATE TABLE spat.ed_regiao(
	edre_cd_regiao numeric NOT NULL,
	edre_sg_regiao character varying(2) NOT NULL,
	edre_nm_regiao character varying(20) NOT NULL,
	edre_geometry geometry(MULTIPOLYGON, 4674) NOT NULL,
	edre_centroid geometry(POINT, 4674) NOT NULL,
	edre_bounding_box geometry(POLYGON, 4674) NOT NULL,
	CONSTRAINT pk_edre PRIMARY KEY (edre_cd_regiao)

);
-- ddl-end --
COMMENT ON TABLE spat.ed_regiao IS 'Dimensão espacial que representa a macroregião do Brasil';
-- ddl-end --
COMMENT ON COLUMN spat.ed_regiao.edre_cd_regiao IS 'Código da macroregião no IBGE';
-- ddl-end --
COMMENT ON COLUMN spat.ed_regiao.edre_sg_regiao IS 'Sigla da região';
-- ddl-end --
COMMENT ON COLUMN spat.ed_regiao.edre_nm_regiao IS 'Nome da Macroregiao';
-- ddl-end --
COMMENT ON COLUMN spat.ed_regiao.edre_geometry IS 'Geometria da Macroregião';
-- ddl-end --
COMMENT ON COLUMN spat.ed_regiao.edre_centroid IS 'Centroide da região';
-- ddl-end --
COMMENT ON COLUMN spat.ed_regiao.edre_bounding_box IS 'Retângulo envolvente da macroregião';
-- ddl-end --
COMMENT ON CONSTRAINT pk_edre ON spat.ed_regiao IS 'Chave primária da dimensão de regiões';
-- ddl-end --
-- ddl-end --

-- object: spat.ed_uf | type: TABLE --
CREATE TABLE spat.ed_uf(
	eduf_cd_uf numeric(2) NOT NULL,
	eduf_nm_uf character varying(20) NOT NULL,
	eduf_sg_uf character varying(2) NOT NULL,
	edre_cd_regiao smallint NOT NULL,
	eduf_geometry geometry(MULTIPOLYGON, 4674) NOT NULL,
	eduf_centroid geometry(POINT, 4674) NOT NULL,
	eduf_bounding_box geometry(POLYGON, 4674) NOT NULL,
	CONSTRAINT pk_eduf PRIMARY KEY (eduf_cd_uf)

);
-- ddl-end --
COMMENT ON TABLE spat.ed_uf IS 'Dimensão espacial que representa a unidade da federação do Brasil';
-- ddl-end --
COMMENT ON COLUMN spat.ed_uf.eduf_cd_uf IS 'Código da unidade da federação no IBGE';
-- ddl-end --
COMMENT ON COLUMN spat.ed_uf.eduf_nm_uf IS 'Nome da unidade da federação';
-- ddl-end --
COMMENT ON COLUMN spat.ed_uf.eduf_sg_uf IS 'Sigla da UF';
-- ddl-end --
COMMENT ON COLUMN spat.ed_uf.edre_cd_regiao IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN spat.ed_uf.eduf_geometry IS 'Geometria da unidade da federação';
-- ddl-end --
COMMENT ON COLUMN spat.ed_uf.eduf_centroid IS 'Centroide da UF';
-- ddl-end --
COMMENT ON COLUMN spat.ed_uf.eduf_bounding_box IS 'Retângulo envolvente da unidade da federação';
-- ddl-end --
COMMENT ON CONSTRAINT pk_eduf ON spat.ed_uf IS 'Chave primária da dimensão de regiões';
-- ddl-end --
-- ddl-end --

-- object: spat.ed_municipio | type: TABLE --
CREATE TABLE spat.ed_municipio(
	edmu_cd_municipio numeric(7) NOT NULL,
	edmu_nm_municipio character varying(50) NOT NULL,
	eduf_cd_uf smallint NOT NULL,
	edmu_geometry geometry(MULTIPOLYGON, 4674) NOT NULL,
	edmu_centroid geometry(POINT, 4674) NOT NULL,
	edmu_bounding_box geometry(POLYGON, 4674) NOT NULL,
	CONSTRAINT pk_edmu PRIMARY KEY (edmu_cd_municipio)

);
-- ddl-end --
COMMENT ON TABLE spat.ed_municipio IS 'Dimensão espacial que representa um município do Brasil';
-- ddl-end --
COMMENT ON COLUMN spat.ed_municipio.edmu_cd_municipio IS 'Código do municipio no IBGE';
-- ddl-end --
COMMENT ON COLUMN spat.ed_municipio.edmu_nm_municipio IS 'Nome do municipio';
-- ddl-end --
COMMENT ON COLUMN spat.ed_municipio.eduf_cd_uf IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN spat.ed_municipio.edmu_geometry IS 'Geometria do municipio';
-- ddl-end --
COMMENT ON COLUMN spat.ed_municipio.edmu_centroid IS 'Centróide do município';
-- ddl-end --
COMMENT ON COLUMN spat.ed_municipio.edmu_bounding_box IS 'Retângulo envolvente do município';
-- ddl-end --
COMMENT ON CONSTRAINT pk_edmu ON spat.ed_municipio IS 'Chave primária da dimensão de municípios';
-- ddl-end --
-- ddl-end --

-- object: data.dc_tipo_identificador | type: TABLE --
CREATE TABLE data.dc_tipo_identificador(
	dcti_cd_tipo smallint NOT NULL,
	dcti_sg_tipo character varying(10) NOT NULL,
	dcti_nm_tipo character varying(50),
	CONSTRAINT pk_dcti PRIMARY KEY (dcti_cd_tipo)

);
-- ddl-end --
COMMENT ON TABLE data.dc_tipo_identificador IS 'Tipo de identificador utilizado pela fonte de dados';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_identificador.dcti_cd_tipo IS 'Código do tipo';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_identificador.dcti_sg_tipo IS 'Sigla do tipo de identificador';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_identificador.dcti_nm_tipo IS 'Nome do tipo de identificador';
-- ddl-end --
-- ddl-end --

-- object: data.md_fonte_dados | type: TABLE --
CREATE TABLE data.md_fonte_dados(
	mdfd_cd_fonte_dados smallint NOT NULL,
	mdfd_sg_fonte_dados character varying(20) NOT NULL,
	mdfd_nm_fonte_dados character varying(200) NOT NULL,
	mdfd_ds_fonte_dados text,
	mdfd_dt_aquisicao date,
	mdfd_ee_referencia character varying(300),
	CONSTRAINT pk_mdfd PRIMARY KEY (mdfd_cd_fonte_dados)

);
-- ddl-end --
COMMENT ON TABLE data.md_fonte_dados IS 'Fonte de dados da Organização da Sociedade Civil';
-- ddl-end --
COMMENT ON COLUMN data.md_fonte_dados.mdfd_cd_fonte_dados IS 'Código da fonte de dados';
-- ddl-end --
COMMENT ON COLUMN data.md_fonte_dados.mdfd_sg_fonte_dados IS 'Sigla da fonte de dados';
-- ddl-end --
COMMENT ON COLUMN data.md_fonte_dados.mdfd_nm_fonte_dados IS 'Nome da fonte de dados';
-- ddl-end --
COMMENT ON COLUMN data.md_fonte_dados.mdfd_ds_fonte_dados IS 'Descrição da fonte de dados';
-- ddl-end --
COMMENT ON COLUMN data.md_fonte_dados.mdfd_dt_aquisicao IS 'Data de aquisição dos dados junto a fonte de dados';
-- ddl-end --
COMMENT ON COLUMN data.md_fonte_dados.mdfd_ee_referencia IS 'link de referência para a fonte de dados';
-- ddl-end --
COMMENT ON CONSTRAINT pk_mdfd ON data.md_fonte_dados IS 'Chave primária da tabela de fonte de dados';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc | type: TABLE --
CREATE TABLE data.tb_osc(
	bosc_sq_osc serial NOT NULL,
	bosc_nr_identificacao numeric(14) NOT NULL,
	dcti_cd_tipo smallint NOT NULL,
	bosc_nm_osc character varying(250) NOT NULL,
	bosc_nm_fantasia_osc character varying(250),
	bosc_geometry geometry(POINT, 4674),
	CONSTRAINT pk_bosc PRIMARY KEY (bosc_sq_osc),
	CONSTRAINT un_identificador UNIQUE (bosc_nr_identificacao,dcti_cd_tipo)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc IS 'Tabela que contém todas as Organizações da Sociedade Civil levantadas durante a pesquisa da FGV';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc.bosc_sq_osc IS 'Código interno da base de dados para a OSC pesquisada';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc.bosc_nr_identificacao IS 'Número que identifica univocamente a OSC na sua base de dados original. Geralmente o CNPJ da Entidade.';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc.dcti_cd_tipo IS 'Chave Estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc.bosc_nm_osc IS 'Nome ou Razão Social da Organização da Sociedade Civil';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc.bosc_nm_fantasia_osc IS 'Nome fantasia da OSC';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc.bosc_geometry IS 'Localização da OSC apresentada no mapa em coordenadas geográficas (Geometria Postgis)';
-- ddl-end --
COMMENT ON CONSTRAINT pk_bosc ON data.tb_osc IS 'Chave primária da tabela de Organizações da Sociedade Civil';
-- ddl-end --
COMMENT ON CONSTRAINT un_identificador ON data.tb_osc IS 'Restrição de identificador único';
-- ddl-end --
-- ddl-end --

-- object: data.tb_localizacao | type: TABLE --
CREATE TABLE data.tb_localizacao(
	bosc_sq_osc integer NOT NULL,
	mdfd_cd_fonte_dados smallint NOT NULL,
	loca_ds_endereco character varying(200) NOT NULL,
	loca_ds_endereco_complemento character varying(200),
	loca_ds_endereco_corrigido character varying(200),
	loca_nm_bairro character varying(200) DEFAULT null,
	edmu_cd_municipio numeric(7) NOT NULL,
	loca_nm_cep numeric(9) DEFAULT null,
	loca_geometry geometry(POINT, 4674),
	gcod_cd_fonte_geocodificacao char,
	loca_dt_geocodificacao date,
	CONSTRAINT pk_cblo PRIMARY KEY (bosc_sq_osc,mdfd_cd_fonte_dados)

);
-- ddl-end --
COMMENT ON TABLE data.tb_localizacao IS 'Localizações da OSC nas várias fontes de dados pesquisadas';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.bosc_sq_osc IS 'Chave estrangeira (código da OSC)';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.mdfd_cd_fonte_dados IS 'Chave estrangeira (Código da fonte de dados)';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.loca_ds_endereco IS 'Descrição do endereço com Logradouro, número e bairro';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.loca_ds_endereco_complemento IS 'Complemento do endereço';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.loca_ds_endereco_corrigido IS 'Endereço formatado e corrigido após processo de geocodificação';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.loca_nm_bairro IS 'Nome do Bairro quando houver na fonte de dados';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.edmu_cd_municipio IS 'Chave estrangeira do município';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.loca_nm_cep IS 'Número do CEP';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.loca_geometry IS 'Localização da OSC na fonte de dados em coordenadas geográficas (Geometria Postgis)';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.gcod_cd_fonte_geocodificacao IS 'Fonte da geocodificação';
-- ddl-end --
COMMENT ON COLUMN data.tb_localizacao.loca_dt_geocodificacao IS 'Data da geocodificação';
-- ddl-end --
COMMENT ON CONSTRAINT pk_cblo ON data.tb_localizacao IS 'Chave primária composta da Localização';
-- ddl-end --
-- ddl-end --

-- object: data.tb_contatos | type: TABLE --
CREATE TABLE data.tb_contatos(
	bosc_sq_osc integer NOT NULL,
	mdfd_cd_fonte_dados smallint NOT NULL,
	cont_tx_telefone character varying(200),
	cont_ee_email character varying(200),
	cont_nm_representante character varying(200),
	cont_ee_site text,
	CONSTRAINT pk_cont PRIMARY KEY (bosc_sq_osc,mdfd_cd_fonte_dados)

);
-- ddl-end --
COMMENT ON TABLE data.tb_contatos IS 'Contatos da OSC por fonte de dados';
-- ddl-end --
COMMENT ON COLUMN data.tb_contatos.bosc_sq_osc IS 'Chave estrangeira (código da OSC)';
-- ddl-end --
COMMENT ON COLUMN data.tb_contatos.mdfd_cd_fonte_dados IS 'Chave estrangeira (Código da fonte de dados)';
-- ddl-end --
COMMENT ON COLUMN data.tb_contatos.cont_tx_telefone IS 'Telefone da OSC na fonte de dados';
-- ddl-end --
COMMENT ON COLUMN data.tb_contatos.cont_ee_email IS 'Email da entidade na fonte de dados';
-- ddl-end --
COMMENT ON COLUMN data.tb_contatos.cont_nm_representante IS 'Nome do representante legal da entidade';
-- ddl-end --
COMMENT ON COLUMN data.tb_contatos.cont_ee_site IS 'Endereço do site da entidade';
-- ddl-end --
COMMENT ON CONSTRAINT pk_cont ON data.tb_contatos IS 'Chave primária de contatos';
-- ddl-end --
-- ddl-end --

-- object: data.dc_rais_tamanho_estabelecimento | type: TABLE --
CREATE TABLE data.dc_rais_tamanho_estabelecimento(
	dcte_cd_tamanho_estabelecimento numeric(2) NOT NULL,
	dcte_ds_tamanho_estabelecimento character varying(50) NOT NULL,
	CONSTRAINT pk_dcte PRIMARY KEY (dcte_cd_tamanho_estabelecimento)

);
-- ddl-end --
COMMENT ON TABLE data.dc_rais_tamanho_estabelecimento IS 'Dicionário do tamanho do estabelecimento da RAIS, definido pelo número de vínculos ativos';
-- ddl-end --
COMMENT ON COLUMN data.dc_rais_tamanho_estabelecimento.dcte_cd_tamanho_estabelecimento IS 'Código do tamanho do estabelecimento';
-- ddl-end --
COMMENT ON COLUMN data.dc_rais_tamanho_estabelecimento.dcte_ds_tamanho_estabelecimento IS 'Descrição do tamanho do estabelecimento';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dcte ON data.dc_rais_tamanho_estabelecimento IS 'Chave primária do tamanho do estabelecimento';
-- ddl-end --
-- ddl-end --

-- object: data.dc_subclasse_cnae_2_1 | type: TABLE --
CREATE TABLE data.dc_subclasse_cnae_2_1(
	dcsc_cd_subclasse numeric(7) NOT NULL,
	dcsc_cd_alpha_subclasse character varying(10) NOT NULL,
	dcsc_nm_subclasse character varying(250),
	CONSTRAINT pk_dcsc PRIMARY KEY (dcsc_cd_subclasse)

);
-- ddl-end --
COMMENT ON TABLE data.dc_subclasse_cnae_2_1 IS 'Dicionário da subclasse do CNAE 2.1';
-- ddl-end --
COMMENT ON COLUMN data.dc_subclasse_cnae_2_1.dcsc_cd_subclasse IS 'Código da subclasse do CNAE 2.1';
-- ddl-end --
COMMENT ON COLUMN data.dc_subclasse_cnae_2_1.dcsc_cd_alpha_subclasse IS 'Código da subclasse da atividade econômica no CNAE 2.1 com traço e barras';
-- ddl-end --
COMMENT ON COLUMN data.dc_subclasse_cnae_2_1.dcsc_nm_subclasse IS 'Denominação da atividade econômica no CNAE 2.1';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dcsc ON data.dc_subclasse_cnae_2_1 IS 'Chave primária da subclasse da atividade econômica';
-- ddl-end --
-- ddl-end --

-- object: data.dc_natureza_juridica | type: TABLE --
CREATE TABLE data.dc_natureza_juridica(
	dcnj_cd_natureza_juridica numeric(4) NOT NULL,
	dcnj_cd_alpha_natureza_juridica character varying(5) NOT NULL,
	dcnj_nm_natureza_juridica character varying(100),
	dcnj_in_osc boolean NOT NULL DEFAULT false,
	CONSTRAINT pk_dcnj PRIMARY KEY (dcnj_cd_natureza_juridica)

);
-- ddl-end --
COMMENT ON TABLE data.dc_natureza_juridica IS 'Dicionário da natureza jurídica das entidades sem fins lucrativos segundo o CONCLA';
-- ddl-end --
COMMENT ON COLUMN data.dc_natureza_juridica.dcnj_cd_natureza_juridica IS 'Código da natureza jurídica';
-- ddl-end --
COMMENT ON COLUMN data.dc_natureza_juridica.dcnj_cd_alpha_natureza_juridica IS 'Código da natureza jurídica com traço';
-- ddl-end --
COMMENT ON COLUMN data.dc_natureza_juridica.dcnj_nm_natureza_juridica IS 'Denominação da natureza jurídica';
-- ddl-end --
COMMENT ON COLUMN data.dc_natureza_juridica.dcnj_in_osc IS 'Indicador de natureza juridica de OSC';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dcnj ON data.dc_natureza_juridica IS 'Chave primária da natureza jurídica';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_rais | type: TABLE --
CREATE TABLE data.tb_osc_rais(
	bosc_sq_osc integer NOT NULL,
	dcsc_cd_subclasse numeric(7) NOT NULL,
	dcnj_cd_natureza_juridica numeric(4) NOT NULL,
	dcte_cd_tamanho_estabelecimento numeric(2) NOT NULL,
	rais_qt_vinculo_clt smallint,
	rais_qt_vinculo_ativo smallint,
	rais_qt_vinculo_estatutario smallint,
	rais_in_atividade boolean,
	rais_in_negativa boolean,
	rais_in_osc boolean NOT NULL DEFAULT false,
	CONSTRAINT pk_rais PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_rais IS 'Dados das OSCs segundo a RAIS';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_rais.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_rais.dcsc_cd_subclasse IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_rais.dcnj_cd_natureza_juridica IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_rais.dcte_cd_tamanho_estabelecimento IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_rais.rais_qt_vinculo_clt IS 'Quantidade de Vínculos em Regime CLT';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_rais.rais_qt_vinculo_ativo IS 'Quantidade de Vínculos que estão ativos';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_rais.rais_qt_vinculo_estatutario IS 'Quantidade de Vínculos em Regime Estatutário';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_rais.rais_in_atividade IS 'Se a Entidade estava ativa no ano de declaração (2011)';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_rais.rais_in_negativa IS 'Declara-se se não há vínculos ativos ou se não houve atividade';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_rais.rais_in_osc IS 'Campo que indica se a Entidade é uma OSC';
-- ddl-end --
COMMENT ON CONSTRAINT pk_rais ON data.tb_osc_rais IS 'Chave primária da tabela RAIS';
-- ddl-end --
-- ddl-end --

-- object: data.dc_nivel_receita | type: TABLE --
CREATE TABLE data.dc_nivel_receita(
	dcnr_cd_nivel_receita numeric NOT NULL,
	dcnr_ds_nivel_receita character varying(50) NOT NULL,
	CONSTRAINT pk_dcnr PRIMARY KEY (dcnr_cd_nivel_receita)

);
-- ddl-end --
COMMENT ON TABLE data.dc_nivel_receita IS 'Nível de receita';
-- ddl-end --
COMMENT ON COLUMN data.dc_nivel_receita.dcnr_cd_nivel_receita IS 'Código do nível de receita';
-- ddl-end --
COMMENT ON COLUMN data.dc_nivel_receita.dcnr_ds_nivel_receita IS 'Descrição do nível de receita';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dcnr ON data.dc_nivel_receita IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_censo_suas | type: TABLE --
CREATE TABLE data.tb_osc_censo_suas(
	bosc_sq_osc integer NOT NULL,
	suas_dt_ano_fundacao numeric(4) NOT NULL,
	suas_in_acesso_internet boolean NOT NULL,
	suas_tx_outras_areas_atuacao text,
	suas_in_servicos_gratuitos boolean NOT NULL,
	suas_in_defesa_direitos boolean NOT NULL,
	suas_in_beneficios_eventuais boolean NOT NULL,
	suas_qt_vagas_protecao_social_basica integer,
	suas_qt_vagas_protecao_social_media integer,
	suas_qt_vagas_protecao_social_alta integer,
	suas_qt_vagas_integracao_mercado_trabalho integer,
	suas_qt_vagas_inclusao_produtiva integer,
	suas_qt_vagas_pessoas_deficiencia integer,
	suas_qt_vagas_usuarios_droga integer,
	suas_qt_vagas_tratamento_saude integer,
	suas_qt_vagas_inclusao_digital integer,
	suas_qt_vagas_outros_servicos integer,
	suas_qt_contratados_fundamental integer,
	suas_qt_contratados_medio integer,
	suas_qt_contratados_superior integer,
	suas_qt_cedidos_fundamental integer,
	suas_qt_cedidos_medio integer,
	suas_qt_cedidos_superior integer,
	suas_qt_estagiario_fundamental integer,
	suas_qt_estagiario_medio integer,
	suas_qt_estagiario_superior integer,
	suas_qt_voluntario_fundamental integer,
	suas_qt_voluntario_medio integer,
	suas_qt_voluntario_superior integer,
	dcnr_cd_nivel_receita numeric NOT NULL,
	CONSTRAINT pk_censo_suas PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_censo_suas IS 'Dados das OSCs coletados a partir do Censo SUAS do MDS';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_dt_ano_fundacao IS 'Ano em que a entidade foi fundada
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_in_acesso_internet IS 'Indicador que informa se a entidade possui acesso à internet
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_tx_outras_areas_atuacao IS 'Outras áreas de atuação da entidade';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_in_servicos_gratuitos IS 'Indicador que informa se os serviços prestados pela entidade são totalmente gratuitos aos usuários
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_in_defesa_direitos IS 'Desenvolve atividade de assessoramento e defesa e garantia de direitos
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_in_beneficios_eventuais IS 'Indica se a entidade concede benefícios eventuais aos usuários
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_vagas_protecao_social_basica IS 'Quantidade de vagas ofertadas pela entidade no âmbito da proteção social básica
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_vagas_protecao_social_media IS 'Quantidade de vagas ofertadas pela entidade no âmbito da proteção social especial de média complexidade
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_vagas_protecao_social_alta IS 'Quantidade de vagas ofertadas pela entidade no âmbito da proteção social especial de alta complexidade
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_vagas_integracao_mercado_trabalho IS 'Quantidade de vagas ofertadas pela entidade para capacitação e promoção da integração ao mercado de trabalho.
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_vagas_inclusao_produtiva IS 'Quantidade de vagas ofertadas pela entidade para projetos de enfrentamento à pobreza / inclusão social
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_vagas_pessoas_deficiencia IS 'Quantidade de vagas ofertadas pela entidade para habilitação e reabilitação de pessoas com deficiência
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_vagas_usuarios_droga IS 'Quantidade de vagas ofertadas pela entidade para atendimento a usuários de substancias psicoativas
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_vagas_tratamento_saude IS 'Quantidade de vagas ofertadas pela entidade para apoio para pessoas em tratamento de saúde';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_vagas_inclusao_digital IS 'Quantidade de vagas ofertadas pela entidade para projeto/programa de inclusão digital
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_vagas_outros_servicos IS 'Quantidade de vagas ofertadas pela entidade para outros serviços/programas/projetos
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_contratados_fundamental IS 'Trabalhadores contratados com ensino fundamental.';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_contratados_medio IS 'Trabalhadores contratados com ensino medio.
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_contratados_superior IS 'Trabalhadores contratados com ensino superior.
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_cedidos_fundamental IS 'Trabalhadores cedidos com ensino fundamental';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_cedidos_medio IS 'Trabalhadores cedidos com ensino medio.
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_cedidos_superior IS 'Trabalhadores cedidos com ensino superior.
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_estagiario_fundamental IS 'Estagiários com ensino fundamental';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_estagiario_medio IS 'Estagiários com ensino medio';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_estagiario_superior IS 'Estagiários com ensino superior.
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_voluntario_fundamental IS 'Trabalhadores Voluntários com ensino fundamental.';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_voluntario_medio IS 'Trabalhadores Voluntários com ensino medio.
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.suas_qt_voluntario_superior IS 'Trabalhadores Voluntários com ensino superior.
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_censo_suas.dcnr_cd_nivel_receita IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON CONSTRAINT pk_censo_suas ON data.tb_osc_censo_suas IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.dc_bloco_servico | type: TABLE --
CREATE TABLE data.dc_bloco_servico(
	dcbs_cd_bloco_servico character varying(3) NOT NULL,
	dcbs_nm_bloco_servico character varying(100) NOT NULL,
	CONSTRAINT pk_dcbs PRIMARY KEY (dcbs_cd_bloco_servico)

);
-- ddl-end --
COMMENT ON TABLE data.dc_bloco_servico IS 'Tabela dicionário de bloco de serviço';
-- ddl-end --
COMMENT ON COLUMN data.dc_bloco_servico.dcbs_cd_bloco_servico IS 'Código do bloco de serviço';
-- ddl-end --
COMMENT ON COLUMN data.dc_bloco_servico.dcbs_nm_bloco_servico IS 'Nome do Bloco de Serviço';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dcbs ON data.dc_bloco_servico IS 'Chave promária';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_certificacao | type: TABLE --
CREATE TABLE data.tb_osc_certificacao(
	bosc_sq_osc integer NOT NULL,
	cnea_dt_publicacao date DEFAULT null,
	cebas_mec_dt_inicio_validade date DEFAULT null,
	cebas_mec_dt_fim_validade date DEFAULT null,
	cebas_saude_dt_inicio_validade date DEFAULT null,
	cebas_saude_dt_fim_validade date DEFAULT null,
	cebas_mds_dt_inicio_validade date,
	cebas_mds_dt_fim_validade date,
	cnes_oscip_dt_publicacao date DEFAULT null,
	cnes_upf_dt_declaracao date DEFAULT null,
	CONSTRAINT pk_cert PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_certificacao IS 'Títulos e Certificações obtidas pela OSCs ';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_certificacao.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_certificacao.cnea_dt_publicacao IS 'Data de publicação da entidade no CNEA';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_certificacao.cebas_mds_dt_inicio_validade IS 'Início da validade do cebas mds';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_certificacao.cebas_mds_dt_fim_validade IS 'Fim da validade do cebas mds';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_certificacao.cnes_oscip_dt_publicacao IS 'Data da Publicação da Certificação OSCIP do Ministério da Justiça';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_certificacao.cnes_upf_dt_declaracao IS 'Data da declaração da Certificação UPF do Ministério da Justiça';
-- ddl-end --
COMMENT ON CONSTRAINT pk_cert ON data.tb_osc_certificacao IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_lic | type: TABLE --
CREATE TABLE data.tb_osc_lic(
	bosc_sq_osc integer NOT NULL,
	lic_vl_solicitado double precision NOT NULL,
	lic_vl_aprovado double precision NOT NULL,
	lic_vl_captado double precision NOT NULL,
	CONSTRAINT pk_lic PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_lic IS 'Dados das OSCs coletados a partir dos dados da Lei de Incentivo à cultura (LIC)';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_lic.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_lic.lic_vl_solicitado IS 'Valor solicitado pelo proponente';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_lic.lic_vl_aprovado IS 'Valor aprovado pelo MINC para o projeto';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_lic.lic_vl_captado IS 'Valor captado para o projeto fora da LIC';
-- ddl-end --
COMMENT ON CONSTRAINT pk_lic ON data.tb_osc_lic IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.dc_abrangencia_regional | type: TABLE --
CREATE TABLE data.dc_abrangencia_regional(
	abre_cd_abrangencia smallint NOT NULL,
	abre_nm_abrangencia character varying(30) NOT NULL,
	CONSTRAINT pk_abre PRIMARY KEY (abre_cd_abrangencia)

);
-- ddl-end --
COMMENT ON TABLE data.dc_abrangencia_regional IS 'Tabela dicionário de abrangência regional';
-- ddl-end --
COMMENT ON COLUMN data.dc_abrangencia_regional.abre_cd_abrangencia IS 'Código da Abrangência regional';
-- ddl-end --
COMMENT ON COLUMN data.dc_abrangencia_regional.abre_nm_abrangencia IS 'Denominação da Abrangência regional';
-- ddl-end --
COMMENT ON CONSTRAINT pk_abre ON data.dc_abrangencia_regional IS 'Chave primária da abrangência regional';
-- ddl-end --
-- ddl-end --

-- object: data.dc_nivel_abrangencia | type: TABLE --
CREATE TABLE data.dc_nivel_abrangencia(
	niab_cd_nivel_abrangencia char NOT NULL,
	niab_ds_nivel_abrangencia character varying(60) NOT NULL,
	CONSTRAINT pk_niab PRIMARY KEY (niab_cd_nivel_abrangencia)

);
-- ddl-end --
COMMENT ON TABLE data.dc_nivel_abrangencia IS 'Os níveis de enquadramento dizem respeito à quantidade de unidades habitacionais que poderão ser apresentadas simultaneamente em projetos de habitação de interesse social junto aos programas geridos pelo Ministério das Cidades';
-- ddl-end --
COMMENT ON COLUMN data.dc_nivel_abrangencia.niab_cd_nivel_abrangencia IS 'Código do nível de abrangência';
-- ddl-end --
COMMENT ON COLUMN data.dc_nivel_abrangencia.niab_ds_nivel_abrangencia IS 'Descrição do nível de abrangência';
-- ddl-end --
COMMENT ON CONSTRAINT pk_niab ON data.dc_nivel_abrangencia IS 'Chave primária do nível de abrangência';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_mcmv | type: TABLE --
CREATE TABLE data.tb_osc_mcmv(
	bosc_sq_osc integer NOT NULL,
	mcmv_dt_ano_selecao numeric(4) NOT NULL,
	abre_cd_abrangencia smallint NOT NULL,
	niab_cd_nivel_abrangencia char NOT NULL,
	CONSTRAINT pk_mcmv PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_mcmv IS 'Dados das OSCs coletados a partir do programa Minha Casa Minha Vida Entidades (MCMV-E)';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_mcmv.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_mcmv.mcmv_dt_ano_selecao IS 'Ano de seleção da entidade no programa minha casa minha vida';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_mcmv.abre_cd_abrangencia IS 'Código da abrangência da habilitação';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_mcmv.niab_cd_nivel_abrangencia IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON CONSTRAINT pk_mcmv ON data.tb_osc_mcmv IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.dc_nivel_complexidade_sus | type: TABLE --
CREATE TABLE data.dc_nivel_complexidade_sus(
	dcnc_cd_nivel_complexidade smallint NOT NULL,
	dcnc_nm_nivel_complexidade character varying(50) NOT NULL,
	dcnc_ds_nivel_complexidade text,
	CONSTRAINT pk_dcnc PRIMARY KEY (dcnc_cd_nivel_complexidade)

);
-- ddl-end --
COMMENT ON TABLE data.dc_nivel_complexidade_sus IS 'Tabela dicionário do nível de complexidade segundo o NOB-SUS (Norma Operacional Básica do SUS)';
-- ddl-end --
COMMENT ON COLUMN data.dc_nivel_complexidade_sus.dcnc_cd_nivel_complexidade IS 'Código do nível de complexidade';
-- ddl-end --
COMMENT ON COLUMN data.dc_nivel_complexidade_sus.dcnc_nm_nivel_complexidade IS 'Denominação do nível de complexidade';
-- ddl-end --
COMMENT ON COLUMN data.dc_nivel_complexidade_sus.dcnc_ds_nivel_complexidade IS 'Descrição do nível de complexidade';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dcnc ON data.dc_nivel_complexidade_sus IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.dc_tipo_unidade_sus | type: TABLE --
CREATE TABLE data.dc_tipo_unidade_sus(
	dctu_cd_tipo_unidade smallint NOT NULL,
	dctu_nm_tipo_unidade character varying(100) NOT NULL,
	CONSTRAINT pk_dctu PRIMARY KEY (dctu_cd_tipo_unidade)

);
-- ddl-end --
COMMENT ON TABLE data.dc_tipo_unidade_sus IS 'Tabela dicionário do tipo de unidade de atendimento do SUS';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_unidade_sus.dctu_cd_tipo_unidade IS 'Código do tipo de unidade';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_unidade_sus.dctu_nm_tipo_unidade IS 'Denominação do tipo de unidade de atendimento';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dctu ON data.dc_tipo_unidade_sus IS 'Chave primária do tipo de unidade de atendimento';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_base_mds | type: TABLE --
CREATE TABLE data.tb_osc_base_mds(
	bosc_sq_osc integer NOT NULL,
	dcbs_cd_bloco_servico character varying(3) NOT NULL,
	bmds_ds_atividade text NOT NULL
);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_base_mds IS 'Dados das OSCs coletados a partir da base do MDS (Formulário Eletrônico)';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_base_mds.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_base_mds.dcbs_cd_bloco_servico IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_base_mds.bmds_ds_atividade IS 'Descrição da atividade da OSC no bloco de serviço';
-- ddl-end --
-- ddl-end --

-- object: data.dc_atividade_ensino_sus | type: TABLE --
CREATE TABLE data.dc_atividade_ensino_sus(
	dcae_cd_atividade_ensino numeric NOT NULL,
	dcae_nm_atividade_ensino character varying(50) NOT NULL,
	CONSTRAINT pk_dcae PRIMARY KEY (dcae_cd_atividade_ensino)

);
-- ddl-end --
COMMENT ON TABLE data.dc_atividade_ensino_sus IS 'Tabela dicionário da atividade de ensino no SUS';
-- ddl-end --
COMMENT ON COLUMN data.dc_atividade_ensino_sus.dcae_cd_atividade_ensino IS 'Código da atividade de ensino';
-- ddl-end --
COMMENT ON COLUMN data.dc_atividade_ensino_sus.dcae_nm_atividade_ensino IS 'Denominação da atividade de ensino';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dcae ON data.dc_atividade_ensino_sus IS 'Chave primária da atividade de ensino';
-- ddl-end --
-- ddl-end --

-- object: data.dc_tipo_gestao | type: TABLE --
CREATE TABLE data.dc_tipo_gestao(
	dctg_cd_tipo_gestao char NOT NULL,
	dctg_nm_tipo_gestao character varying(50) NOT NULL,
	CONSTRAINT pk_dctg PRIMARY KEY (dctg_cd_tipo_gestao)

);
-- ddl-end --
COMMENT ON TABLE data.dc_tipo_gestao IS 'Tabela dicionário do tipo de gestão';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_gestao.dctg_cd_tipo_gestao IS 'Código do tipo de gestão';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_gestao.dctg_nm_tipo_gestao IS 'Denominação do tipo de gestão';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dctg ON data.dc_tipo_gestao IS 'Chave primária do tipo de gestão';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_sus | type: TABLE --
CREATE TABLE data.tb_osc_sus(
	bosc_sq_osc integer NOT NULL,
	sus_cd_cnes numeric(7) NOT NULL,
	sus_nr_cnpj_mantenedora numeric(14),
	dcnj_cd_natureza_juridica numeric(4) NOT NULL,
	dcnc_cd_nivel_complexidade smallint,
	dctu_cd_tipo_unidade smallint NOT NULL,
	dcae_cd_atividade_ensino smallint NOT NULL,
	dctg_cd_tipo_gestao char NOT NULL,
	sus_qt_vinculo_autonomo smallint,
	sus_qt_vinculo_cooperativa smallint,
	sus_qt_vinculo_estagio smallint,
	sus_qt_vinculo_residencia smallint,
	sus_qt_vinculo_clt smallint,
	sus_qt_vinculo_emprego_publico smallint,
	sus_qt_vinculo_temporario smallint,
	sus_qt_vinculo_outros smallint,
	CONSTRAINT pk_sus PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_sus IS 'Dados das OSCs coletados a partir da base do SUS (MS)';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.sus_cd_cnes IS 'Código da entidade no CNES';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.sus_nr_cnpj_mantenedora IS 'Número do CNPJ da Entidade mantenedora';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.dcnj_cd_natureza_juridica IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.dcnc_cd_nivel_complexidade IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.dctu_cd_tipo_unidade IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.dcae_cd_atividade_ensino IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.dctg_cd_tipo_gestao IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.sus_qt_vinculo_autonomo IS 'Quantidade de vínculos como autonomo';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.sus_qt_vinculo_cooperativa IS 'Quantidade de vínculos como cooperativado';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.sus_qt_vinculo_estagio IS 'Quantidade de vínculos de estágio';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.sus_qt_vinculo_residencia IS 'Quantidade de vínculos como residente';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.sus_qt_vinculo_clt IS 'Quantidade de vínculos CLT';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.sus_qt_vinculo_emprego_publico IS 'Quantidade de vínculos de empregados públicos cedidos';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.sus_qt_vinculo_temporario IS 'Quantidade de vínculos de empregos temporários';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_sus.sus_qt_vinculo_outros IS 'Quantidade de outros tipos de vínculo';
-- ddl-end --
COMMENT ON CONSTRAINT pk_sus ON data.tb_osc_sus IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.dc_area_atuacao_suas | type: TABLE --
CREATE TABLE data.dc_area_atuacao_suas(
	dcaa_cd_area_atuacao smallint NOT NULL,
	dcaa_nm_area_atuacao character varying(100) NOT NULL,
	CONSTRAINT pk_dcaa PRIMARY KEY (dcaa_cd_area_atuacao)

);
-- ddl-end --
COMMENT ON TABLE data.dc_area_atuacao_suas IS 'Área de atuação da entidade declarada no censo SUAS';
-- ddl-end --
COMMENT ON COLUMN data.dc_area_atuacao_suas.dcaa_cd_area_atuacao IS 'Código da área de atuação';
-- ddl-end --
COMMENT ON COLUMN data.dc_area_atuacao_suas.dcaa_nm_area_atuacao IS 'Denominação da área de atuação';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dcaa ON data.dc_area_atuacao_suas IS 'Chave primária da área de atuação';
-- ddl-end --
-- ddl-end --

-- object: data.nm_suas_area_atuacao | type: TABLE --
CREATE TABLE data.nm_suas_area_atuacao(
	bosc_sq_osc integer NOT NULL,
	dcaa_cd_area_atuacao smallint NOT NULL,
	suaa_tipo char NOT NULL,
	CONSTRAINT pk_suaa PRIMARY KEY (bosc_sq_osc,dcaa_cd_area_atuacao),
	CONSTRAINT ck_suaa_tipo CHECK (suaa_tipo = 'P' OR suaa_tipo = 'S')

);
-- ddl-end --
COMMENT ON TABLE data.nm_suas_area_atuacao IS 'Tabela de relacionamento N:M do censo suas para a área de atuação da entidade';
-- ddl-end --
COMMENT ON COLUMN data.nm_suas_area_atuacao.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.nm_suas_area_atuacao.dcaa_cd_area_atuacao IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.nm_suas_area_atuacao.suaa_tipo IS 'Tipo de área de atuação (p-preponderante, s-secundária';
-- ddl-end --
COMMENT ON CONSTRAINT pk_suaa ON data.nm_suas_area_atuacao IS 'Chave primária';
-- ddl-end --
COMMENT ON CONSTRAINT ck_suaa_tipo ON data.nm_suas_area_atuacao IS 'Check de tipo';
-- ddl-end --
-- ddl-end --

-- object: data.dc_tipo_fonte_recursos | type: TABLE --
CREATE TABLE data.dc_tipo_fonte_recursos(
	tpfr_cd_fonte smallint NOT NULL,
	tpfr_nm_fonte character varying(50) NOT NULL,
	tpfr_tx_fonte text,
	CONSTRAINT pk_tpfr PRIMARY KEY (tpfr_cd_fonte)

);
-- ddl-end --
COMMENT ON TABLE data.dc_tipo_fonte_recursos IS 'Tipo de fontes de recurso';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_fonte_recursos.tpfr_cd_fonte IS 'Código da Fonte';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_fonte_recursos.tpfr_nm_fonte IS 'Denominação da fonte';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_fonte_recursos.tpfr_tx_fonte IS 'Descrição da fonte';
-- ddl-end --
COMMENT ON CONSTRAINT pk_tpfr ON data.dc_tipo_fonte_recursos IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.nm_suas_fonte_recursos | type: TABLE --
CREATE TABLE data.nm_suas_fonte_recursos(
	bosc_sq_osc integer NOT NULL,
	tpfr_cd_fonte smallint NOT NULL,
	CONSTRAINT pk_sufr PRIMARY KEY (bosc_sq_osc,tpfr_cd_fonte)

);
-- ddl-end --
COMMENT ON TABLE data.nm_suas_fonte_recursos IS 'Tabela de relacionamento N:M que indica quais tipos de fontes de recursos a OSC possui.';
-- ddl-end --
COMMENT ON COLUMN data.nm_suas_fonte_recursos.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.nm_suas_fonte_recursos.tpfr_cd_fonte IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON CONSTRAINT pk_sufr ON data.nm_suas_fonte_recursos IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: syst.dc_status_carga | type: TABLE --
CREATE TABLE syst.dc_status_carga(
	dcsc_cd_satus smallint NOT NULL,
	dcsc_nm_status character varying(50) NOT NULL,
	dcsc_tx_status text,
	CONSTRAINT pk_dcsc PRIMARY KEY (dcsc_cd_satus)

);
-- ddl-end --
COMMENT ON TABLE syst.dc_status_carga IS 'Status da carga do dado';
-- ddl-end --
COMMENT ON COLUMN syst.dc_status_carga.dcsc_cd_satus IS 'Código do status';
-- ddl-end --
COMMENT ON COLUMN syst.dc_status_carga.dcsc_nm_status IS 'Nome do status';
-- ddl-end --
COMMENT ON COLUMN syst.dc_status_carga.dcsc_tx_status IS 'Descrição do status';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dcsc ON syst.dc_status_carga IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: syst.ct_log_carga | type: TABLE --
CREATE TABLE syst.ct_log_carga(
	ctlc_sq_log serial NOT NULL,
	mdfd_cd_fonte_dados smallint NOT NULL,
	ctlc_nr_cnpj_osc numeric(14) NOT NULL,
	dcsc_cd_satus smallint NOT NULL,
	ctlc_tx_mensagem text NOT NULL,
	CONSTRAINT pk_ctlc PRIMARY KEY (ctlc_sq_log)

);
-- ddl-end --
COMMENT ON TABLE syst.ct_log_carga IS 'Log da carga dos dados';
-- ddl-end --
COMMENT ON COLUMN syst.ct_log_carga.ctlc_sq_log IS 'Código sequência do log';
-- ddl-end --
COMMENT ON COLUMN syst.ct_log_carga.mdfd_cd_fonte_dados IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN syst.ct_log_carga.ctlc_nr_cnpj_osc IS 'Número do CNPJ da OSC';
-- ddl-end --
COMMENT ON COLUMN syst.ct_log_carga.dcsc_cd_satus IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN syst.ct_log_carga.ctlc_tx_mensagem IS 'Mensagem de log';
-- ddl-end --
COMMENT ON CONSTRAINT pk_ctlc ON syst.ct_log_carga IS 'Chave primária do log de controle';
-- ddl-end --
-- ddl-end --

-- object: syst.nm_osc_fonte_dados | type: TABLE --
CREATE TABLE syst.nm_osc_fonte_dados(
	bosc_sq_osc integer NOT NULL,
	mdfd_cd_fonte_dados smallint NOT NULL,
	CONSTRAINT pk_osfd PRIMARY KEY (bosc_sq_osc,mdfd_cd_fonte_dados)

);
-- ddl-end --
COMMENT ON TABLE syst.nm_osc_fonte_dados IS 'Relaciona as OSC às fontes de dados onde estão presentes';
-- ddl-end --
COMMENT ON COLUMN syst.nm_osc_fonte_dados.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN syst.nm_osc_fonte_dados.mdfd_cd_fonte_dados IS 'Fonte de dados';
-- ddl-end --
COMMENT ON CONSTRAINT pk_osfd ON syst.nm_osc_fonte_dados IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: olap.tb_indicador | type: TABLE --
CREATE TABLE olap.tb_indicador(
	indi_cd_indicadores smallint NOT NULL,
	indi_sg_indicador character varying(6),
	indi_nm_indicador character varying(50) NOT NULL,
	indi_tx_indicador text,
	CONSTRAINT pk_indi PRIMARY KEY (indi_cd_indicadores)

);
-- ddl-end --
COMMENT ON TABLE olap.tb_indicador IS 'Tabela de indicadores';
-- ddl-end --
COMMENT ON COLUMN olap.tb_indicador.indi_cd_indicadores IS 'Código do indicador';
-- ddl-end --
COMMENT ON COLUMN olap.tb_indicador.indi_sg_indicador IS 'Sigla do indicador';
-- ddl-end --
COMMENT ON COLUMN olap.tb_indicador.indi_nm_indicador IS 'Nome do indicador';
-- ddl-end --
COMMENT ON COLUMN olap.tb_indicador.indi_tx_indicador IS 'Descrição textual do indicador';
-- ddl-end --
COMMENT ON CONSTRAINT pk_indi ON olap.tb_indicador IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: olap.ft_regiao | type: TABLE --
CREATE TABLE olap.ft_regiao(
	edre_cd_regiao numeric NOT NULL,
	indi_cd_indicadores smallint NOT NULL,
	ftre_vl_valor double precision NOT NULL,
	CONSTRAINT pk_ftre PRIMARY KEY (edre_cd_regiao,indi_cd_indicadores)

);
-- ddl-end --
COMMENT ON TABLE olap.ft_regiao IS 'Tabela fato de região';
-- ddl-end --
COMMENT ON COLUMN olap.ft_regiao.edre_cd_regiao IS 'Código da Região';
-- ddl-end --
COMMENT ON COLUMN olap.ft_regiao.indi_cd_indicadores IS 'Código do indicador';
-- ddl-end --
COMMENT ON COLUMN olap.ft_regiao.ftre_vl_valor IS 'Valor do indicador para a região';
-- ddl-end --
COMMENT ON CONSTRAINT pk_ftre ON olap.ft_regiao IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: olap.ft_uf | type: TABLE --
CREATE TABLE olap.ft_uf(
	eduf_cd_uf numeric(2) NOT NULL,
	indi_cd_indicadores smallint NOT NULL,
	ftuf_vl_valor double precision NOT NULL,
	CONSTRAINT pk_ftuf PRIMARY KEY (eduf_cd_uf,indi_cd_indicadores)

);
-- ddl-end --
COMMENT ON TABLE olap.ft_uf IS 'Tabela fato da UF';
-- ddl-end --
COMMENT ON COLUMN olap.ft_uf.eduf_cd_uf IS 'Código da Unidade da Federação';
-- ddl-end --
COMMENT ON COLUMN olap.ft_uf.indi_cd_indicadores IS 'Código do indicador';
-- ddl-end --
COMMENT ON COLUMN olap.ft_uf.ftuf_vl_valor IS 'Valor do indicador para a UF';
-- ddl-end --
COMMENT ON CONSTRAINT pk_ftuf ON olap.ft_uf IS 'Chave primaria';
-- ddl-end --
-- ddl-end --

-- object: olap.ft_municipio | type: TABLE --
CREATE TABLE olap.ft_municipio(
	edmu_cd_municipio numeric(7) NOT NULL,
	indi_cd_indicadores smallint NOT NULL,
	ftmu_vl_valor double precision NOT NULL,
	CONSTRAINT pk_ftmu PRIMARY KEY (edmu_cd_municipio,indi_cd_indicadores)

);
-- ddl-end --
COMMENT ON TABLE olap.ft_municipio IS 'Tabela fato da UF';
-- ddl-end --
COMMENT ON COLUMN olap.ft_municipio.edmu_cd_municipio IS 'Código da Unidade da Federação';
-- ddl-end --
COMMENT ON COLUMN olap.ft_municipio.indi_cd_indicadores IS 'Código do indicador';
-- ddl-end --
COMMENT ON COLUMN olap.ft_municipio.ftmu_vl_valor IS 'Valor do indicador para o município';
-- ddl-end --
COMMENT ON CONSTRAINT pk_ftmu ON olap.ft_municipio IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_siconv | type: TABLE --
CREATE TABLE data.tb_osc_siconv(
	bosc_sq_osc integer NOT NULL,
	siconv_qt_parceria_finalizada smallint NOT NULL,
	siconv_qt_parceria_execucao smallint NOT NULL,
	siconv_vl_global double precision NOT NULL,
	siconv_vl_repasse double precision NOT NULL,
	siconv_vl_contrapartida_financeira double precision NOT NULL,
	siconv_vl_contrapartida_outras double precision NOT NULL,
	siconv_vl_empenhado double precision NOT NULL,
	siconv_vl_desembolsado double precision NOT NULL,
	CONSTRAINT pk_siconv PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_siconv IS 'Tabela de OSCs cadastradas no SICONV que recebem recursos do governo federal';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siconv.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siconv.siconv_qt_parceria_finalizada IS 'Quantidade de parcerias finalizadas';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siconv.siconv_qt_parceria_execucao IS 'Quantidade de parcerias em execução';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siconv.siconv_vl_global IS 'Valor global das parcerias';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siconv.siconv_vl_repasse IS 'Valor de repasse';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siconv.siconv_vl_contrapartida_financeira IS 'Valor da contrapartida financeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siconv.siconv_vl_contrapartida_outras IS 'Valorda contrapartida de bens e serviços';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siconv.siconv_vl_empenhado IS 'Valor das parcerias já empenhado';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siconv.siconv_vl_desembolsado IS 'Valor das parcerias já desembolsado';
-- ddl-end --
COMMENT ON CONSTRAINT pk_siconv ON data.tb_osc_siconv IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_siafi | type: TABLE --
CREATE TABLE data.tb_osc_siafi(
	bosc_sq_osc integer NOT NULL,
	siafi_dt_ano numeric(4) NOT NULL,
	siafi_vl_total_empenho double precision NOT NULL,
	siafi_vl_empenho_liquidar double precision,
	siafi_vl_empenho_liquidado double precision,
	CONSTRAINT pk_siafi PRIMARY KEY (bosc_sq_osc,siafi_dt_ano)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_siafi IS 'Tabela de OSC do Sistema Integrado de Administração Financeira do Governo Federal do período entre 2009 e 2013';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siafi.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siafi.siafi_dt_ano IS 'Ano de apuração';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siafi.siafi_vl_total_empenho IS 'Valor total do empenho';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siafi.siafi_vl_empenho_liquidar IS 'Valor do empenho que ainda não foi liquidado';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_siafi.siafi_vl_empenho_liquidado IS 'Valor do empenho que já foi liquidado';
-- ddl-end --
COMMENT ON CONSTRAINT pk_siafi ON data.tb_osc_siafi IS 'Chave primária da base do SIAFI';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_finep | type: TABLE --
CREATE TABLE data.tb_osc_finep(
	bosc_sq_osc integer NOT NULL,
	finep_qt_projetos_proponente smallint NOT NULL,
	finep_qt_projetos_executor smallint NOT NULL,
	finep_qt_projetos_coexecutor smallint NOT NULL,
	finep_qt_projetos_interveniente smallint NOT NULL,
	CONSTRAINT pk_finep PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_finep IS 'Tabela de OSCs da FINEP';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_finep.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_finep.finep_qt_projetos_proponente IS 'Quantidade de projetos onde a OSC foi proponente';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_finep.finep_qt_projetos_executor IS 'Quantidade de projetos onde foi executor do projeto';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_finep.finep_qt_projetos_coexecutor IS 'Quantidade de projetos onde foi co-executor do projeto';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_finep.finep_qt_projetos_interveniente IS 'Quantidade de projetos onde foi interveniente';
-- ddl-end --
COMMENT ON CONSTRAINT pk_finep ON data.tb_osc_finep IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.tb_osc_mda | type: TABLE --
CREATE TABLE data.tb_osc_mda(
	bosc_sq_osc integer NOT NULL,
	mda_qt_atividade_capacitacao smallint,
	mda_qt_participantes_atividade_capacitacao smallint,
	mda_qt_projeto_investimento smallint,
	mda_in_paticipacao_colegiado boolean NOT NULL,
	CONSTRAINT pk_mda PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE data.tb_osc_mda IS 'Tabela do Ministério do desenvolvimento agrário';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_mda.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_mda.mda_qt_atividade_capacitacao IS 'Número de atividades de capacitação realizadas no período';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_mda.mda_qt_participantes_atividade_capacitacao IS 'Quantidade de participantes beneficiados nas atividades de capacitação
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_mda.mda_qt_projeto_investimento IS 'Quantidade de Projetos de Investimento nos Territórios Rurais
';
-- ddl-end --
COMMENT ON COLUMN data.tb_osc_mda.mda_in_paticipacao_colegiado IS 'Indicador de participação em colegiado territorial';
-- ddl-end --
COMMENT ON CONSTRAINT pk_mda ON data.tb_osc_mda IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: portal.tb_osc_interacao | type: TABLE --
CREATE TABLE portal.tb_osc_interacao(
	bosc_sq_osc integer NOT NULL,
	inte_in_ativa boolean NOT NULL DEFAULT true,
	inte_in_osc boolean NOT NULL DEFAULT true,
	CONSTRAINT pk_inte PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE portal.tb_osc_interacao IS 'Tabela que registra as interações do usuário com o portal';
-- ddl-end --
COMMENT ON COLUMN portal.tb_osc_interacao.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN portal.tb_osc_interacao.inte_in_ativa IS 'Indica se a OSC está ativa';
-- ddl-end --
COMMENT ON COLUMN portal.tb_osc_interacao.inte_in_osc IS 'Indicador de entidade sem fim lucrativo que é OSC';
-- ddl-end --
COMMENT ON CONSTRAINT pk_inte ON portal.tb_osc_interacao IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: syst.dc_fonte_geocodificacao | type: TABLE --
CREATE TABLE syst.dc_fonte_geocodificacao(
	gcod_cd_fonte_geocodificacao char NOT NULL,
	gcod_nm_fonte_geocodificacao character varying(200) NOT NULL,
	CONSTRAINT pk_gcod PRIMARY KEY (gcod_cd_fonte_geocodificacao)

);
-- ddl-end --
COMMENT ON TABLE syst.dc_fonte_geocodificacao IS 'Fonte da geocodificação do endereço';
-- ddl-end --
COMMENT ON COLUMN syst.dc_fonte_geocodificacao.gcod_cd_fonte_geocodificacao IS 'Código da fonte de geocodificação';
-- ddl-end --
COMMENT ON COLUMN syst.dc_fonte_geocodificacao.gcod_nm_fonte_geocodificacao IS 'Nome da fonte de geocodificação';
-- ddl-end --
COMMENT ON CONSTRAINT pk_gcod ON syst.dc_fonte_geocodificacao IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: portal.tb_usuario | type: TABLE --
CREATE TABLE portal.tb_usuario(
	tusu_sq_usuario serial NOT NULL,
	tpus_cd_tipo_usuario smallint NOT NULL,
	tusu_ee_email character varying(50) NOT NULL,
	tusu_nm_usuario character varying(100) NOT NULL,
	tusu_cd_senha character varying NOT NULL,
	tusu_nr_cpf numeric(11),
	bosc_sq_osc integer,
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
COMMENT ON COLUMN portal.tb_usuario.bosc_sq_osc IS 'Identificador da OSC que o usuário representa. Se nulo, não é representante de OSC.';
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

-- object: portal.tb_osc_contato | type: TABLE --
CREATE TABLE portal.tb_osc_contato(
	bosc_sq_osc integer NOT NULL,
	cont_cd_contato smallint NOT NULL,
	cont_ds_tipo_contato character varying(50) NOT NULL,
	cont_ds_contato character varying(200) NOT NULL,
	CONSTRAINT pk_cont PRIMARY KEY (bosc_sq_osc,cont_cd_contato)

);
-- ddl-end --
COMMENT ON TABLE portal.tb_osc_contato IS 'Tabela de contatos da OSC';
-- ddl-end --
COMMENT ON COLUMN portal.tb_osc_contato.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN portal.tb_osc_contato.cont_cd_contato IS 'Código do contato';
-- ddl-end --
COMMENT ON COLUMN portal.tb_osc_contato.cont_ds_tipo_contato IS 'Tipo de contato (Telefone, email, etc.)';
-- ddl-end --
COMMENT ON COLUMN portal.tb_osc_contato.cont_ds_contato IS 'Descrição do contato (conteúdo)';
-- ddl-end --
COMMENT ON CONSTRAINT pk_cont ON portal.tb_osc_contato IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: portal.vm_osc_principal | type: TABLE --
CREATE TABLE portal.vm_osc_principal(
	bosc_sq_osc integer NOT NULL,
	bosc_nr_identificacao numeric(14) NOT NULL,
	dcti_cd_tipo smallint NOT NULL,
	bosc_nm_osc character varying(250) NOT NULL,
	bosc_nm_fantasia_osc character varying(250),
	ospr_geometry geometry(POINT, 4674) NOT NULL,
	ospr_tx_descricao text,
	ospr_ds_endereco character varying(200) NOT NULL,
	ospr_ds_endereco_complemento character varying(200),
	ospr_nm_bairro character varying(200) DEFAULT null,
	edmu_cd_municipio numeric(7) NOT NULL,
	edmu_nm_municipio character varying(50) NOT NULL,
	eduf_sg_uf character varying(2) NOT NULL,
	ospr_nm_cep numeric(9) DEFAULT null,
	dcsc_cd_alpha_subclasse character varying(10),
	dcsc_nm_subclasse character varying(250),
	dcnj_cd_alpha_natureza_juridica character varying(5),
	dcnj_nm_natureza_juridica character varying(100),
	ospr_dt_ano_fundacao numeric(4),
	ospr_ee_site text,
	CONSTRAINT pk_ospr PRIMARY KEY (bosc_sq_osc)

);
-- ddl-end --
COMMENT ON TABLE portal.vm_osc_principal IS 'View Materializada dos dados gerais da OSC';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.bosc_nr_identificacao IS 'Número que identifica univocamente a OSC na sua base de dados original. Geralmente o CNPJ da Entidade.';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.dcti_cd_tipo IS 'Chave Estrangeira';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.bosc_nm_osc IS 'Nome ou Razão Social da Organização da Sociedade Civil';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.bosc_nm_fantasia_osc IS 'Nome fantasia da OSC';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.ospr_geometry IS 'Localização da OSC apresentada no mapa em coordenadas geográficas (Geometria Postgis)';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.ospr_tx_descricao IS 'Descrição da OSC';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.ospr_ds_endereco IS 'Descrição do endereço com Logradouro, número e bairro';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.ospr_ds_endereco_complemento IS 'Complemento do endereço';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.ospr_nm_bairro IS 'Nome do Bairro quando houver na fonte de dados';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.edmu_cd_municipio IS 'Chave estrangeira do município';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.edmu_nm_municipio IS 'Nome do municipio';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.eduf_sg_uf IS 'Sigla da UF';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.ospr_nm_cep IS 'Número do CEP';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.dcsc_cd_alpha_subclasse IS 'Código da subclasse da atividade econômica no CNAE 2.1 com traço e barras';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.dcsc_nm_subclasse IS 'Denominação da atividade econômica no CNAE 2.1';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.dcnj_cd_alpha_natureza_juridica IS 'Código da natureza jurídica com traço';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.dcnj_nm_natureza_juridica IS 'Denominação da natureza jurídica';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.ospr_dt_ano_fundacao IS 'Ano de fundação da OSC';
-- ddl-end --
COMMENT ON COLUMN portal.vm_osc_principal.ospr_ee_site IS 'Endereço do site da OSC';
-- ddl-end --
COMMENT ON CONSTRAINT pk_ospr ON portal.vm_osc_principal IS 'Chave primária';
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
-- ddl-end --
-- ddl-end --

-- object: data.tb_conselhos | type: TABLE --
CREATE TABLE data.tb_conselhos(
	cons_cd_conselho smallint NOT NULL,
	cons_nm_conselho character varying(100) NOT NULL,
	cons_nm_orgao_vinculado character varying(100) NOT NULL,
	CONSTRAINT pk_cons PRIMARY KEY (cons_cd_conselho)

);
-- ddl-end --
COMMENT ON TABLE data.tb_conselhos IS 'Tabela de conselhos';
-- ddl-end --
COMMENT ON COLUMN data.tb_conselhos.cons_cd_conselho IS 'Código do conselho';
-- ddl-end --
COMMENT ON COLUMN data.tb_conselhos.cons_nm_conselho IS 'Nome do conselho ou comissão';
-- ddl-end --
COMMENT ON COLUMN data.tb_conselhos.cons_nm_orgao_vinculado IS 'Orgão ao qual a comissão ou conselho está vinculado';
-- ddl-end --
COMMENT ON CONSTRAINT pk_cons ON data.tb_conselhos IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.nm_osc_conselho | type: TABLE --
CREATE TABLE data.nm_osc_conselho(
	bosc_sq_osc integer NOT NULL,
	cons_cd_conselho smallint NOT NULL,
	tpar_cd_tipo_participacao smallint NOT NULL,
	CONSTRAINT pk_osco PRIMARY KEY (bosc_sq_osc,cons_cd_conselho)

);
-- ddl-end --
COMMENT ON TABLE data.nm_osc_conselho IS 'Tabela de relacionamento M:N entre a OSC e os Conselhos e comissões que ela participa';
-- ddl-end --
COMMENT ON COLUMN data.nm_osc_conselho.bosc_sq_osc IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.nm_osc_conselho.cons_cd_conselho IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON COLUMN data.nm_osc_conselho.tpar_cd_tipo_participacao IS 'Chave estrangeira';
-- ddl-end --
COMMENT ON CONSTRAINT pk_osco ON data.nm_osc_conselho IS 'Chave primária';
-- ddl-end --
-- ddl-end --

-- object: data.dc_tipo_participacao | type: TABLE --
CREATE TABLE data.dc_tipo_participacao(
	tpar_cd_tipo_participacao smallint NOT NULL,
	tpar_nm_tipo_participacao character varying(30) NOT NULL,
	CONSTRAINT pk_tpar PRIMARY KEY (tpar_cd_tipo_participacao)

);
-- ddl-end --
COMMENT ON TABLE data.dc_tipo_participacao IS 'Tipo de participação no conselho';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_participacao.tpar_cd_tipo_participacao IS 'Código do tipo de participação';
-- ddl-end --
COMMENT ON COLUMN data.dc_tipo_participacao.tpar_nm_tipo_participacao IS 'Nome do tipo de participação';
-- ddl-end --
COMMENT ON CONSTRAINT pk_tpar ON data.dc_tipo_participacao IS 'Chave primária';
-- ddl-end --
-- ddl-end --

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

-- object: fk_edre_eduf | type: CONSTRAINT --
ALTER TABLE spat.ed_uf ADD CONSTRAINT fk_edre_eduf FOREIGN KEY (edre_cd_regiao)
REFERENCES spat.ed_regiao (edre_cd_regiao) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_eduf_edmu | type: CONSTRAINT --
ALTER TABLE spat.ed_municipio ADD CONSTRAINT fk_eduf_edmu FOREIGN KEY (eduf_cd_uf)
REFERENCES spat.ed_uf (eduf_cd_uf) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcti_bosc | type: CONSTRAINT --
ALTER TABLE data.tb_osc ADD CONSTRAINT fk_dcti_bosc FOREIGN KEY (dcti_cd_tipo)
REFERENCES data.dc_tipo_identificador (dcti_cd_tipo) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_loca | type: CONSTRAINT --
ALTER TABLE data.tb_localizacao ADD CONSTRAINT fk_bosc_loca FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_mdfd_loca | type: CONSTRAINT --
ALTER TABLE data.tb_localizacao ADD CONSTRAINT fk_mdfd_loca FOREIGN KEY (mdfd_cd_fonte_dados)
REFERENCES data.md_fonte_dados (mdfd_cd_fonte_dados) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_edmu_loca | type: CONSTRAINT --
ALTER TABLE data.tb_localizacao ADD CONSTRAINT fk_edmu_loca FOREIGN KEY (edmu_cd_municipio)
REFERENCES spat.ed_municipio (edmu_cd_municipio) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_gcod_loca | type: CONSTRAINT --
ALTER TABLE data.tb_localizacao ADD CONSTRAINT fk_gcod_loca FOREIGN KEY (gcod_cd_fonte_geocodificacao)
REFERENCES syst.dc_fonte_geocodificacao (gcod_cd_fonte_geocodificacao) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_cont | type: CONSTRAINT --
ALTER TABLE data.tb_contatos ADD CONSTRAINT fk_bosc_cont FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_mdfd_cont | type: CONSTRAINT --
ALTER TABLE data.tb_contatos ADD CONSTRAINT fk_mdfd_cont FOREIGN KEY (mdfd_cd_fonte_dados)
REFERENCES data.md_fonte_dados (mdfd_cd_fonte_dados) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_rais | type: CONSTRAINT --
ALTER TABLE data.tb_osc_rais ADD CONSTRAINT fk_bosc_rais FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcsc_rais | type: CONSTRAINT --
ALTER TABLE data.tb_osc_rais ADD CONSTRAINT fk_dcsc_rais FOREIGN KEY (dcsc_cd_subclasse)
REFERENCES data.dc_subclasse_cnae_2_1 (dcsc_cd_subclasse) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcnj_rais | type: CONSTRAINT --
ALTER TABLE data.tb_osc_rais ADD CONSTRAINT fk_dcnj_rais FOREIGN KEY (dcnj_cd_natureza_juridica)
REFERENCES data.dc_natureza_juridica (dcnj_cd_natureza_juridica) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcte_rais | type: CONSTRAINT --
ALTER TABLE data.tb_osc_rais ADD CONSTRAINT fk_dcte_rais FOREIGN KEY (dcte_cd_tamanho_estabelecimento)
REFERENCES data.dc_rais_tamanho_estabelecimento (dcte_cd_tamanho_estabelecimento) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_suas | type: CONSTRAINT --
ALTER TABLE data.tb_osc_censo_suas ADD CONSTRAINT fk_bosc_suas FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcnr_suas | type: CONSTRAINT --
ALTER TABLE data.tb_osc_censo_suas ADD CONSTRAINT fk_dcnr_suas FOREIGN KEY (dcnr_cd_nivel_receita)
REFERENCES data.dc_nivel_receita (dcnr_cd_nivel_receita) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_cert | type: CONSTRAINT --
ALTER TABLE data.tb_osc_certificacao ADD CONSTRAINT fk_bosc_cert FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_lic | type: CONSTRAINT --
ALTER TABLE data.tb_osc_lic ADD CONSTRAINT fk_bosc_lic FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_mcmv | type: CONSTRAINT --
ALTER TABLE data.tb_osc_mcmv ADD CONSTRAINT fk_bosc_mcmv FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_abre_mcmv | type: CONSTRAINT --
ALTER TABLE data.tb_osc_mcmv ADD CONSTRAINT fk_abre_mcmv FOREIGN KEY (abre_cd_abrangencia)
REFERENCES data.dc_abrangencia_regional (abre_cd_abrangencia) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_niab_mcmv | type: CONSTRAINT --
ALTER TABLE data.tb_osc_mcmv ADD CONSTRAINT fk_niab_mcmv FOREIGN KEY (niab_cd_nivel_abrangencia)
REFERENCES data.dc_nivel_abrangencia (niab_cd_nivel_abrangencia) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_bmds | type: CONSTRAINT --
ALTER TABLE data.tb_osc_base_mds ADD CONSTRAINT fk_bosc_bmds FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcbs_bmds | type: CONSTRAINT --
ALTER TABLE data.tb_osc_base_mds ADD CONSTRAINT fk_dcbs_bmds FOREIGN KEY (dcbs_cd_bloco_servico)
REFERENCES data.dc_bloco_servico (dcbs_cd_bloco_servico) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_sus | type: CONSTRAINT --
ALTER TABLE data.tb_osc_sus ADD CONSTRAINT fk_bosc_sus FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcnj_sus | type: CONSTRAINT --
ALTER TABLE data.tb_osc_sus ADD CONSTRAINT fk_dcnj_sus FOREIGN KEY (dcnj_cd_natureza_juridica)
REFERENCES data.dc_natureza_juridica (dcnj_cd_natureza_juridica) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcnc_sus | type: CONSTRAINT --
ALTER TABLE data.tb_osc_sus ADD CONSTRAINT fk_dcnc_sus FOREIGN KEY (dcnc_cd_nivel_complexidade)
REFERENCES data.dc_nivel_complexidade_sus (dcnc_cd_nivel_complexidade) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dctu_sus | type: CONSTRAINT --
ALTER TABLE data.tb_osc_sus ADD CONSTRAINT fk_dctu_sus FOREIGN KEY (dctu_cd_tipo_unidade)
REFERENCES data.dc_tipo_unidade_sus (dctu_cd_tipo_unidade) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcae_sus | type: CONSTRAINT --
ALTER TABLE data.tb_osc_sus ADD CONSTRAINT fk_dcae_sus FOREIGN KEY (dcae_cd_atividade_ensino)
REFERENCES data.dc_atividade_ensino_sus (dcae_cd_atividade_ensino) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dctg_sus | type: CONSTRAINT --
ALTER TABLE data.tb_osc_sus ADD CONSTRAINT fk_dctg_sus FOREIGN KEY (dctg_cd_tipo_gestao)
REFERENCES data.dc_tipo_gestao (dctg_cd_tipo_gestao) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_suas_suaa | type: CONSTRAINT --
ALTER TABLE data.nm_suas_area_atuacao ADD CONSTRAINT fk_suas_suaa FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc_censo_suas (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcaa_suaa | type: CONSTRAINT --
ALTER TABLE data.nm_suas_area_atuacao ADD CONSTRAINT fk_dcaa_suaa FOREIGN KEY (dcaa_cd_area_atuacao)
REFERENCES data.dc_area_atuacao_suas (dcaa_cd_area_atuacao) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_suas_tpfr | type: CONSTRAINT --
ALTER TABLE data.nm_suas_fonte_recursos ADD CONSTRAINT fk_suas_tpfr FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc_censo_suas (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_tpfr_suas | type: CONSTRAINT --
ALTER TABLE data.nm_suas_fonte_recursos ADD CONSTRAINT fk_tpfr_suas FOREIGN KEY (tpfr_cd_fonte)
REFERENCES data.dc_tipo_fonte_recursos (tpfr_cd_fonte) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_dcsc_ctlc | type: CONSTRAINT --
ALTER TABLE syst.ct_log_carga ADD CONSTRAINT fk_dcsc_ctlc FOREIGN KEY (dcsc_cd_satus)
REFERENCES syst.dc_status_carga (dcsc_cd_satus) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_mdfd_ctlc | type: CONSTRAINT --
ALTER TABLE syst.ct_log_carga ADD CONSTRAINT fk_mdfd_ctlc FOREIGN KEY (mdfd_cd_fonte_dados)
REFERENCES data.md_fonte_dados (mdfd_cd_fonte_dados) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_osfd | type: CONSTRAINT --
ALTER TABLE syst.nm_osc_fonte_dados ADD CONSTRAINT fk_bosc_osfd FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_mdfd_osfd | type: CONSTRAINT --
ALTER TABLE syst.nm_osc_fonte_dados ADD CONSTRAINT fk_mdfd_osfd FOREIGN KEY (mdfd_cd_fonte_dados)
REFERENCES data.md_fonte_dados (mdfd_cd_fonte_dados) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_edre_ftre | type: CONSTRAINT --
ALTER TABLE olap.ft_regiao ADD CONSTRAINT fk_edre_ftre FOREIGN KEY (edre_cd_regiao)
REFERENCES spat.ed_regiao (edre_cd_regiao) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_indi_ftre | type: CONSTRAINT --
ALTER TABLE olap.ft_regiao ADD CONSTRAINT fk_indi_ftre FOREIGN KEY (indi_cd_indicadores)
REFERENCES olap.tb_indicador (indi_cd_indicadores) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_eduf_ftuf | type: CONSTRAINT --
ALTER TABLE olap.ft_uf ADD CONSTRAINT fk_eduf_ftuf FOREIGN KEY (eduf_cd_uf)
REFERENCES spat.ed_uf (eduf_cd_uf) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_indi_ftuf | type: CONSTRAINT --
ALTER TABLE olap.ft_uf ADD CONSTRAINT fk_indi_ftuf FOREIGN KEY (indi_cd_indicadores)
REFERENCES olap.tb_indicador (indi_cd_indicadores) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_edmu_ftmu | type: CONSTRAINT --
ALTER TABLE olap.ft_municipio ADD CONSTRAINT fk_edmu_ftmu FOREIGN KEY (edmu_cd_municipio)
REFERENCES spat.ed_municipio (edmu_cd_municipio) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_indi_ftmu | type: CONSTRAINT --
ALTER TABLE olap.ft_municipio ADD CONSTRAINT fk_indi_ftmu FOREIGN KEY (indi_cd_indicadores)
REFERENCES olap.tb_indicador (indi_cd_indicadores) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_siconv | type: CONSTRAINT --
ALTER TABLE data.tb_osc_siconv ADD CONSTRAINT fk_bosc_siconv FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_siafi | type: CONSTRAINT --
ALTER TABLE data.tb_osc_siafi ADD CONSTRAINT fk_bosc_siafi FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_finep | type: CONSTRAINT --
ALTER TABLE data.tb_osc_finep ADD CONSTRAINT fk_bosc_finep FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_mda | type: CONSTRAINT --
ALTER TABLE data.tb_osc_mda ADD CONSTRAINT fk_bosc_mda FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_inte | type: CONSTRAINT --
ALTER TABLE portal.tb_osc_interacao ADD CONSTRAINT fk_bosc_inte FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_tusu_tpus | type: CONSTRAINT --
ALTER TABLE portal.tb_usuario ADD CONSTRAINT fk_tusu_tpus FOREIGN KEY (tpus_cd_tipo_usuario)
REFERENCES portal.tb_tipo_usuario (tpus_cd_tipo_usuario) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_tusu | type: CONSTRAINT --
ALTER TABLE portal.tb_usuario ADD CONSTRAINT fk_bosc_tusu FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_ures_reso | type: CONSTRAINT --
ALTER TABLE portal.tb_usuario_rede_social ADD CONSTRAINT fk_ures_reso FOREIGN KEY (reso_cd_rede_social)
REFERENCES portal.tb_rede_social (reso_cd_rede_social) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_cont | type: CONSTRAINT --
ALTER TABLE portal.tb_osc_contato ADD CONSTRAINT fk_bosc_cont FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_ospr | type: CONSTRAINT --
ALTER TABLE portal.vm_osc_principal ADD CONSTRAINT fk_bosc_ospr FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: pk_tusu_tokn | type: CONSTRAINT --
ALTER TABLE portal.tb_token ADD CONSTRAINT pk_tusu_tokn FOREIGN KEY (tusu_sq_usuario)
REFERENCES portal.tb_usuario (tusu_sq_usuario) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_bosc_osco | type: CONSTRAINT --
ALTER TABLE data.nm_osc_conselho ADD CONSTRAINT fk_bosc_osco FOREIGN KEY (bosc_sq_osc)
REFERENCES data.tb_osc (bosc_sq_osc) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_cons_osco | type: CONSTRAINT --
ALTER TABLE data.nm_osc_conselho ADD CONSTRAINT fk_cons_osco FOREIGN KEY (cons_cd_conselho)
REFERENCES data.tb_conselhos (cons_cd_conselho) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_tpar_osco | type: CONSTRAINT --
ALTER TABLE data.nm_osc_conselho ADD CONSTRAINT fk_tpar_osco FOREIGN KEY (tpar_cd_tipo_participacao)
REFERENCES data.dc_tipo_participacao (tpar_cd_tipo_participacao) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
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



