/*TRATAMENTO NO CADASTRO DE PRODUTOS*/
/*ATENÇÃO!!!!!!!!!
/*ATENÇÃO!!!!!!!!!
ESTE SCRIPT ALTERA AS CSTS DOS PRODUTOS DE SAÍDA E
ENTRADA DE ACORDO COM A TRIBUTAÇÃO DE SAÍDA. */
update produto p set p.ALIQUOTA = 0 where p.ALIQUOTA is null;
update produto p set p.CF = null where p.CF = '';
update produto p set p.QTDEMBALAGEM = 1 where p.QTDEMBALAGEM is null;
update produto p set p.CUSTOOPERACIONAL = p.CUSTO where p.CUSTOOPERACIONAL = 0;
update produto p set p.CUSTOOPERACIONAL = 0.01 where p.CUSTOOPERACIONAL = 0;
update produto p set p.ALIQUOTAEXTERNA = 0 where p.ALIQUOTAEXTERNA is null;
update produto p set p.ID_GENERO = substring(p.NCM from 1 for 2);
update produto p set p.PERMITE_MULTIPLOS = 'N';
update produto p set p.PERMITE_FRACIONAR_VENDA = 'S';
update produto p set p.FATOR_FRACAO_VENDA = 1;
update produto p set p.altera = 'A';
UPDATE produto p SET p.ORIGEM = '0';
update produto p set p.CSOSN = '500' where p.ALIQUOTASAIDA = 10;
update produto p set p.CSOSN = '102' where p.ALIQUOTASAIDA = 1;
update produto p set p.CSOSN = '102' where p.ALIQUOTASAIDA = 2;
update produto p set p.CSOSN = '102' where p.ALIQUOTASAIDA = 3;
update produto p set p.CSOSN = '102' where p.ALIQUOTASAIDA = 4;
update produto p set p.CSOSN = '400' where p.ALIQUOTASAIDA = 11;
update produto p set p.CSOSN = '400' where p.ALIQUOTASAIDA = 12;*/
UPDATE estoques e, produto p SET e.CSOSN = p.CSOSN
WHERE e.id_produto = p.coditem;
/*PREENCHER CÓDIGO DA TRIBUTAÇÃO DO PISCOFINS DE ACORDO COM A CST DO PRODUTO*/
delete from tributacaopiscofins where id in(98,99);
insert INTO `tributacaopiscofins` (`ID`, `DESCRICAO`, `CST_PIS`, `CST_COFINS`, `ALIQUOTAPIS`, `ALIQUOTACOFINS`, `CFOP`, `COD_CRED`, `COD_CONT`, `NAT_BC_CRED`, `ID_EMPRESA`, `TIPO`, `REGIME`, `NAT_REC`, `ITM_TAB_EXCLUSAO`) VALUES (98, 'SEM TRIBUTACAO', '64', '64', 0.0000, 0.0000, '1.102', 101, NULL, NULL, 1, 'E', 'NC', NULL, NULL);
insert INTO `tributacaopiscofins` (`ID`, `DESCRICAO`, `CST_PIS`, `CST_COFINS`, `ALIQUOTAPIS`, `ALIQUOTACOFINS`, `CFOP`, `COD_CRED`, `COD_CONT`, `NAT_BC_CRED`, `ID_EMPRESA`, `TIPO`, `REGIME`, `NAT_REC`, `ITM_TAB_EXCLUSAO`) VALUES (99, 'SEM TRIBUTACAO', '63', '63', 1.6500, 7.6000, '1.403', 101, NULL, 1, 1, 'E', 'NC', NULL, NULL);
update produto p set p.COD_TRIBPISCOFINSVENDAS = 98;
update produto p set p.COD_TRIBPISCOFINSCOMPRAS = 99;
update produto p set p.COD_TRIBPISCOFINSVENDAS = (select t.id from tributacaopiscofins t where t.CST_PIS = p.PISVENDAS limit 1);
update produto p set p.COD_TRIBPISCOFINSCOMPRAS = (select t.id from tributacaopiscofins t where t.CST_PIS = p.PIS limit 1);
delete from tributacaopiscofins where id in(98,99);
/*fim do tratamento do código da tributação do piscofins*/

/*TRATAMENTO NO CADASTRO DE CLIENTES/FORNECEDORES*/
update clientes c set c.NOMEPAI = null where c.NOMEPAI = '';
update clientes c set c.NOMEMAE = null where c.NOMEMAE = '';
update clientes c set c.LOCTRAB = null where c.LOCTRAB = '';
update clientes c set c.IDENINSC = null where c.IDENINSC = '';
update clientes c set c.NOMEPAI = null where c.NOMEPAI = '';
update clientes c set c.ID_CIDADE = (select max(cd.ID_CIDADE) from cidades cd where cd.nome = c.NOMECIDADE);
update clientes c set c.VENDECREDIARIO = 'N' WHERE c.VENDECREDIARIO IS NULL;
update clientes c set c.VENDECREDIARIO = 'S' where c.ATIVO = 'S';
update clientes c set c.VENDECHEQUE = 'S' where c.ATIVO = 'S';
update clientes c set c.VENDECARTAO = 'S' where c.ATIVO = 'S';
update clientes c set c.COOPERADO = 'N' where c.COOPERADO is null;

/*consertar codigos padrão e produtos de balança que estão com codigos errados*/
update produto p set p.CODBARRA = null;
update produto p set p.CODBARRA = (select MAX(c.CODIGO) from codigos c where c.id_produto = p.CODITEM);
select * from produto p where p.CODBARRA =  null;

update produto p set p.CODBARRA = 
(select c.codigo from codigos c where c.ID_PRODUTO = p.coditem and c.codigo<9999 order by codigo desc limit 1) 
 where p.BALANCA = 'S'
 and p.codbarra > 9999
 and (select c.codigo from codigos c where c.ID_PRODUTO = p.coditem and c.codigo<9999 order by codigo desc limit 1) is not null;

update codigos c set c.PADRAO = 'N';
update codigos c, produto p set c.PADRAO = 'S' where p.CODBARRA = c.CODIGO;

/* uso e consumo está migrando errado, e consultar também, segue correção:*/
update produto p set p.USOCONSUMO = 'N', p.CONSULTAR = 'S';

