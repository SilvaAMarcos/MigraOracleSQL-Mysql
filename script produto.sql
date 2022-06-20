select --distinct
emb.numseqatu as      "CODITEM", -- 2042,
--concat(emb.codprod,emb.numseqatu) as "CODITEM",
case when p.codsec is null then 1
  when p.codsec = '' then 1
    --when p.codsec = ' ' then 1
  else p.codsec end as      "GRUPO", -- 3,
case 
  when emb.descricaoecf = '' then 'ALTERAR'
  WHEN  emb.descricaoecf IS NULL THEN 'ALTERAR' 
    ELSE emb.descricaoecf END as     "DESCRICAO", -- "DORITOS QUEIJO NACHO 210G",
emb.pvenda AS     "UNITARIO", -- 16.000000,
coalesce(emb.enviabalanca,'N') AS      "BALANCA", -- "N",*/
null as      "TECLA", -- null,
ic.codicm as      "ALIQUOTA", -- 0.00,

CASE WHEN emb.embalagem = '1' THEN 'UN'
  WHEN emb.embalagem = '' THEN 'UN'
    WHEN emb.embalagem = 'BDJ' THEN 'BJ'
      WHEN emb.embalagem = 'CAIXA' THEN 'CX'
        WHEN emb.embalagem = 'PACOTE' THEN 'PC'
          WHEN emb.embalagem = 'LITRO' THEN 'LT'
        WHEN emb.embalagem = 'CCX' THEN 'CX'
          WHEN emb.embalagem = ' CX' THEN 'CX'
            WHEN emb.embalagem = ' UN' THEN 'UN'
          WHEN emb.embalagem = 'GALÃO' THEN 'GL'
  WHEN emb.embalagem = ' ' THEN 'UN'
  WHEN emb.embalagem IS NULL THEN 'UN'
  ELSE upper(emb.embalagem) END AS      "UNIDADE", -- "PCT",*/

'2022-06-14' as      "ULTDATA", -- "2022-03-07",
'A' as    "ALTERA", -- "A",
coalesce(emb.prazoval,0) as      "VALIDADE", -- "",
'GERAL' as      "SETOR", -- "GERAL",
'0.00' as      "PROMOCAO", -- 0.000,
concat('0', ic.sittribut) as  "CST", -- "000",
null as      "CF", -- null,
'0.000' as     "ALIQUOTAIPI", -- 0.0000,
case
  when concat('0', ic.sittribut) = '000' and ic.codicm = '7' then '1'
  when concat('0', ic.sittribut) = '000' and ic.codicm = '12' then '2'
  when (ic.sittribut = '' or ic.sittribut is null) and ic.codicm = '12' then '2'
  when (ic.sittribut = '' or ic.sittribut is null) and ic.codicm = '17' then '3'
  when concat('0', ic.sittribut) = '000' and ic.codicm = '18' then '3'
  when concat('0', ic.sittribut) = '000' and ic.codicm = '17' then '3'
  when concat('0', ic.sittribut) = '000' and ic.codicm = '25' then '4'
  when concat('0', ic.sittribut) = '060' then '10'
  when concat('0', ic.sittribut) = '040' then '11'
  when concat('0', ic.sittribut) = '041' then '12' 
else '10' end as   "ALIQUOTASAIDA", -- null,
ic.codicm as      "ICMS", -- 18.00,
'0.00' as      "IPI", -- 0.00,
p.vlfrete as      "FRETE", -- 0.00,
'0.00'as      "OUTROS", -- 0.00,
'0.00' as      "MARGEMAVISTA", -- 69.38,
'0' as      "CODELGIN", -- "0",

case when p.codsubcategoria is null then 809
  when p.codsubcategoria = '' then 809
    else p.codsubcategoria end as      "FAMILIA", -- 44,


LPAD(emb.codauxiliar ,14,'0' ) AS      "CODBARRA", -- "07892840817916",
'0.00' as      "REDUCAO", -- 0.00,
null as      "LABORATORIO", -- "ELMA CHIPS",
NULL AS       "REFERENCIA", -- "PEPSICO DO BRASIL",
'N' as     "ITEMDEGRADE", -- "N",
null as      "GRADE_HORIZONTAL", -- null,
null as      "GRADE_VERTICAL", -- null,
'N' as      "GRADE", -- "N",
null as      "ID_DETALHE_GRD", -- null,
null as      "ID_PRODUTO_GRD", -- null,
null as      "ID_DETALHE_GRD_VER", -- null,
null as      "IMAGEM", -- null,
'N' as      "CESTA", -- "N",
concat('0',ic.sittribut) as      "CST_SAIDAS", -- "060",
case when e.custoultent is null then 0.01 
  when e.custoultent = '' then 0.01 
    else cast(e.custoultent as decimal(10,3)) end  as      "CUSTO", -- 9.446,
'0.00' as      "MVA_ANTIGO", -- 0.00,
'0.000' as      "CUSTOMEDIO", -- 9.446,
p.nbm as      "NCM", -- "19059090",
'2022-06-14' as      "ULT_ENTRADA", -- "2022-03-07",
'N' as      "PISCOFINS", -- "N",
case when p.codcategoria is null then 192
  when p.codcategoria = '' then 192
    else p.codcategoria end as      "CATEGORIA", -- 4,
'N' as      "USOCONSUMO", -- "N",
'S' as      "CONSULTAR", -- "S",

-- ATIVO...............
 case 
   when emb.fatorconversao is null then 'N'
   when (select 1 from pcest u where u.codfilial = 1 and u.codprod = p.codprod and
        (((u.dtultsaida is null or u.dtultsaida = '') and (u.dtultent is null or u.dtultent = '')) 
        or (u.dtultsaida <'15-06-2021' and u.dtultent <'15-06-2021'))) = 1  then  'N'  
 else 'S' end as      "ATIVO", -- "S",
  -- emb.fatorconversao as "Fator",

null as      "LOCALIZACAO", -- "",
null as      "APLICACAO", -- "",
'0.00' as      "LLRVENDA", -- 0.00,
'0.00' as      "LLRCUSTO", -- 0.00,
'0.00' as      "LLPCUSTO", -- 0.00,
'0.00' as      "LLPVENDA", -- 0.00,
'0.00' as      "MARGEMVENDA", -- 0.00,
'0.00' as      "MARGEMCUSTO", -- 0.00,
null as      "VALIDADE_PROMOCAO", -- null,
'14:00:00'  as    "HORA_ALTERACAO", -- "14:33:02",
p.pesoliq as      "PESO_LIQUIDO", -- 0.300,
p.pesobruto as      "PESO_BRUTO", -- 0.300,
null as      "SITUACAOPISCOFINS", -- null,
null as      "OLDPISCOFINS", -- null,
'S' as      "ESTOQUE", -- "S",
null as      "CODFABRICANTE", -- null,
null as      "CODFORNECEDOR", -- null,
p.unidade as     "UNIDADECOMPRA", -- "PCT",
'0.00' as      "MARGEMFIXA", -- 0.00,
emb.qtunit as      "QTDEMBALAGEM", -- 12.000,
cast(e.custoultent as decimal(10,3)) as     "CUSTOANTERIOR", -- 11.651,
'0.00' as      "PRECOSUGESTAO", -- 9.450,
null as      "INICIOPROMOCAO", -- null,
null as      "LOTE", -- null,
 case when e.custoreal is null then 0.01 
   else cast(e.custoreal as decimal(10,3)) end as      "CUSTOREAL", -- 9.446,
'0.000' as      "CUSTOREALTMP", -- 0.000,
'2022-06-14' as      "DATAULTIMOCUSTOREAL", -- "2022-03-07",
'2022-06-14' as      "DATAULTIMAALTERACAOPRECO", -- "2022-03-07",
'0.00' as      "UNITARIOTMP", -- 0.00,
null as     "UNITARIOPORFILIAL", -- null,
null as      "CODALTERNATIVO", -- null,
null as      "REG_MEDICAMENTO", -- null,
null as      "CONTROLADO", -- null,
'0.00' as      "DESCONTOMAXIMO", -- 10.00,
'S' as      "PERMITIR_MULTIPLO", -- "S",
'1' as      "ID_EMPRESA", -- 1,
'999999'as      "ID_USUARIOCADASTRO", -- 1000000,
'999999' as      "ID_USUARIOALTERACAO", -- 1000000,
null as      "INFORMACOESNUTRICIONAIS", -- null,
'N' as      "COMPOSTO", -- "N",
'0' as      "ID_PRODUTO", -- 0,
'N' as      "EXPORTADONFE", -- "N",
null as      "ID_IMPOSTOCUSTO", -- null,
null as      "ID_FABRICANTE", -- 3119,
'1' as      "TIPO_CALCULO_CUSTO", -- 1,
null as      "SELECIONADO", -- null,
'0.00' as      "VALOR_MINIMO", -- 11.34,
'P' as      "TIPO", -- "P",
null as      "CODIGO", -- null,
cast(e.custoultent as decimal(10,3)) as      "CUSTOOPERACIONAL", -- 11.14628,
'0.00'  as     "COMISSAO", -- 2.00,
'T' as      "IAT", -- "T",
null as     "IPPT", -- null,
emb.pvenda as      "PRECOREVENDA", -- 12.470,
'2022-06-14'      "CADASTRADO", -- "2022-03-07",
pc.sittributdev as      "PIS", -- "50",
pc.sittributdev as      "COFINS", -- "50",
'S' as      "PARTICIPACOTACAO", -- "S",
'0' as     "ID_SIMILARIDADE", -- 0,
'0.00' as      "ALIQUOTAEXTERNA", -- 0.00,
'0' as      "ID_ORIGEM", -- 0,
'0.00'as      "UNITARIOATACADO", -- 0.000,
null as     "ID_COLECAO", -- null,
'0' as      "ANOCOLECAO", -- 0,
'0' as      "ID_TIPOITEM", -- 0,
'0' as      "EX_IPI", -- "0",
'00' as      "ID_GENERO", -- 19,
'2022-06-14' as      "DATA_INICIO_DESCRICAO", -- "2022-03-07",
case when concat('0',ic.sittribut) = '060' then '5405' else '5102' end  as   "CFOPVENDAECF", -- "5405",
'N' as      "DESCONTOICMSCOOPERADOS", -- "N",
null as     "CODSERVICO", -- null,
case 
  when pc.sittributdev = '50' then '01'
  when pc.sittributdev = '98' then '49' 
  when pc.sittributdev = '70' then '04'
  when pc.sittributdev = '73' then '05' 
    else '' end as "PISVENDAS", -- "01",
case 
  when pc.sittributdev = '50' then '01'
  when pc.sittributdev = '98' then '49' 
  when pc.sittributdev = '70' then '04'
  when pc.sittributdev = '73' then '05' 
    else '' end as "COFINSVENDAS", -- "01",
'99' as     "CSTIPI", -- null,
'99' as     "CSTIPIVENDAS", -- null,
null as      "DESCRICAOTECNICA", -- null,
'N' as      "POSSUISUBSTITUTO", -- "N",
null as      "INFONUTRICIONAIS", -- null,
'N' as      "PARTICIPAREDUCAOBASEPISCOFINS", -- "N",
'0' as      "EX_TIPI", -- 0,
'0.00' as      "FATORORIGEM", -- 0.000,
null as     "CSOSN", -- null,
'0' as     "ULTIMANOTACOMPRA", -- 105268,
/*500+p.codfornec*/ null as      "ID_ULTIMOFORNECEDOR", -- 3119,
'N' as      "ATIVOPERMANENTE", -- "N",
p.obs as      "OBSERVACOES", -- null,
case when e.custoultent is null then 0.01 
  when e.custoultent = '' then 0.01 
    else cast(e.custoultent as decimal(10,3)) end as      "ULTIMOCUSTOCOMPRA", -- 10.110,
'0.00' as      "GIRODIARIO", -- 0.000,
null as      "CLASSIFICACAO_ATM", -- null,
'0.00' as      "QTDVENDIDA_ATM", -- 0.00,
null as      "CLASSIFICACAO_FAMILIA_ATM", -- null,
'0.00' as      "ALTURA", -- 0.00,
'0.00' as      "FRENTE", -- 0.00,
'0.00' as      "PROFUNDIDADE", -- 0.00,
null as      "MD5", -- null,
'1' as      "ID_DIVISAO", -- 1,
'1' as      "COD_TRIBPISCOFINSCOMPRAS", -- 1,
'7' as      "COD_TRIBPISCOFINSVENDAS", -- 7,
null as      "CLENQ", -- null,
null as      "CSELO", -- null,
null as     "QSELO", -- null,
null as      "CENQ", -- null,
null as      "NAT_REC", -- "",
'999' as      "ITM_TAB_EXCLUSAO", -- 999,
null as      "MEDIDA", -- "",
'1.00' as      "FATOR_CONV_ATACADO", -- 1.000,
null as      "CERTIFICADO_CLASSIFICACAO", -- null,
null as      "codv", -- null,
null as      "codc", -- null,
cast(e.custoultentliq as decimal(10,3)) as      "CUSTOLIQUIDO", -- 8.688,
cast(e.custoultentmed as decimal(10,3)) as      "CUSTOMEDIOLIQUIDO", -- 0.000,
null as      "CODANP", -- null,
'0.00' as      "MARKDOWN", -- 40.96,
'0' as       "ID_CENTROCUSTO", -- 0,
null as      "AUXILIAR", -- null,
null as      "PEDIDOCLIENTE", -- null,
null as      "ITEMPEDIDOCLIENTE", -- null,
'0.00' as      "DEBITOMAXIMO", -- 5.00,
'0.00' as      "CREDITOMAXIMO", -- 10.00,
'N' as      "POSSUI_TONALIDADE", -- "N",
null as      "ID_CONTROLE", -- null,
'0' as     "NIVEL", -- 0,
'N' as      "GONDOLA", -- "N",
'0' as      "PEI", -- 0,
'S' as      "PERMITE_MULTIPLOS", -- "N",
'N' as      "AGREGADOS", -- "N",
'S' as      "PERMITE_INDICACAO", -- "S",
null as      "FOTO_PRODUTO1", -- null,
null as      "FOTO_PRODUTO2", -- null,
null as     "FOTO_PRODUTO3", -- null,
'N' as      "BENEFICIA_PRODUTOR_RURAL", -- "N",
'N' as       "TERMINAPROMOCAO_PRODUTOZERADO", -- "N",
'N' as       "MATERIA_PRIMA", -- "N",
'N' as       "TRANSFERE_MATERIA_PRIMA", -- "N",
'1.000' as      "FATOR_CNV_PRODUCAO", -- 1.000,
'0' as      "ID_MATERIA_PRIMA", -- 0,
'N' as      "FORA_DE_LINHA", -- "N",
'N' as      "SOBENCOMENDA", -- "N",
'N' as      "DADO_ADD_OBR", -- "N",
'N' as      "PERMITE_ALTERAR_DESCRICAO", -- "N",
'S' as      "PERMITE_FRACIONAR_VENDA", -- "S",
'1.00' as      "FATOR_FRACAO_VENDA", -- 1.000,
'S' as      "PERMITEALTERARUNITARIO", -- "S",
'0.00' as      "QTD_GONDOLA", -- 0.00,
'0.00' as      "MARKUPATACADO", -- 0.00,
'N' as      "PERMITE_ALTERAR_UNIDADE_PEDIDO", -- "N",
'S' as      "PERMITE_FRACIONAR_VENDA_PDA", -- "S",
e.codcest as      "CEST", -- "1703000",
null as      "DESCRICAO_ANP", -- "",
'S' as      "INDICADOR_ESCALA", -- "S",
null as      "ORIGEM", -- null,
'0.000' as      "PGLP", -- 0.0000,
'0.000' as      "PGNN", -- 0.0000,
'0.000' as      "PGNI", -- 0.0000,
'0.00' as      "VPART", -- 0.00,
'N' as      "COMBUSTIVEL", -- "N",
null as      "UN_TRIBUTAVEL", -- null,
'1.000' as     "FATOR_UN_TRIB", -- 1.000,
'S' as      "HABILITA_CLASS_TRIBUTARIA", -- "S",
'N' as      "PART_CAMPANHA_BENEF", -- "N",
null as      "CEANTRIB", -- null,
'N' as      "VASILHAME", -- "N",
'V' as     "TRATAMENTO_VASILHAME", -- "V",
'N' as      "POSSUI_VASILHAME", -- "N",
null as      "ID_VASILHAME", -- null,
'1' as      "QTD_VASILHAMES", -- 1,
'N' as      "RASTREABILIDADE", -- "N",
null as      "CPRODANVISA", -- null,
'0.00' as      "VPMC", -- 0.00,
'N' as      "CONFERENCIA_PESO", -- "N",
'0.000'as      "LITRAGEM", -- 0.000,
null as       "UNIDADE_CONV_PRODUCAO", -- "PCT",
'N' as      "TRIB_ICMS_POR_EMPRESA", -- "N",
null as      "COD_PROD_CLASSIFICADOR_TRIB", -- null,
'N' as      "PROD_REFEICAO", -- "N",
null as    "DATA_ULTIMO_REAJUST", -- null,
null as      "HORA_ULTIMO_REAJUSTE", -- null,
null as      "ID_UNIDADE_CONVERSAO", -- null,
null as      "DATA_ULTIMA_CONSULTA", -- null,
null as      "NOME_MARCA", -- null
EMB.CODPROD AS "CODPROD_SISTEMAANTIGO"

from 
pcprodut p 
         join pctabtrib t on t.codprod = p.codprod
         left join pctribpiscofins pc on pc.codtribpiscofins = t.codtribpiscofins
         left join pctribut ic on ic.codst = t.codst
         left join pcest e on e.codprod = p.codprod
         join pcembalagem emb on emb.codprod = p.codprod
         
where t.ufdestino = 'MG' 
--and p.codprod =  10855 --11069
--ORDER BY 1 DESC, 7 ASC
-- and p.codauxiliar <99999
-- and (p.descricao like '% UN' OR p.descricao like '% KG')
 --and exists(select 1 from pcest u where u.codfilial = 1 and u.codprod = p.codprod and
 --(((u.dtultsaida is null or u.dtultsaida = '') and (u.dtultent is null or u.dtultent = '')) or (u.dtultsaida <'15-06-2021' and u.dtultent <'15-06-2021')))
-- and (select sum(u.qtest) from pcest u where u.codfilial = 1 and u.codprod = p.codprod) !=0