/*#######################################################################################################
#######################################################################################################
###########VERIFICAR SE A TABELA ESTOQUES FOI PREENCHIDA CORRETAMENTE, COM UNITÁRIO, CUSTO ETC...######
###########E SE NÃO FOI, RODAR A CONSULTA ABAIXO#######################################################
#######################################################################################################
#######################################################################################################
*/
update estoques A, produto B set
 A.UNITARIO = B.UNITARIO,
 A.PROMOCAO = B.PROMOCAO,
 A.CUSTO = B.CUSTO,
 A.CUSTOREAL = B.CUSTOREAL,
 A.CUSTOMEDIO = B.CUSTOMEDIO,
 A.ULT_ENTRADA = B.ULT_ENTRADA,
 A.CUSTOANTERIOR = B.CUSTOANTERIOR,
 A.PRECOSUGESTAO = B.PRECOSUGESTAO,
 A.DATAULTIMOCUSTOREAL = B.dataultimocustoreal,
 A.DATAULTIMAALTERACAOPRECO = B.dataultimaalteracaopreco,
 A.MARGEMFIXA = B.MARGEMFIXA,
 A.MARGEMATUAL = B.MARGEMAVISTA,
 A.ALTERA = B.ALTERA,
 A.INICIOPROMOCAO = B.INICIOPROMOCAO,
 A.VALIDADE_PROMOCAO = B.VALIDADE_PROMOCAO,
 A.ULTDATA = B.ULTDATA,
 A.MARKDOWN = B.MARKDOWN,
 A.TIPO_CALCULO_CUSTO = B.TIPO_CALCULO_CUSTO,
 A.VALOR_MINIMO = B.VALOR_MINIMO,
 A.ICMS = B.ICMS,
 A.IPI = B.IPI,
 A.FRETE = B.FRETE,
 A.OUTROS = B.OUTROS,
 A.CUSTOOPERACIONAL = B.CUSTOOPERACIONAL,
 A.MARKUPATACADO = B.MARKUPATACADO,
 A.UNITARIOATACADO = B.UNITARIOATACADO,
 A.ALIQUOTA = B.ALIQUOTA,
 A.ALIQUOTASAIDA = B.ALIQUOTASAIDA,
 A.CST = B.CST,
 A.ORIGEM = 0
 WHERE 
 A.ID_PRODUTO = B.CODITEM