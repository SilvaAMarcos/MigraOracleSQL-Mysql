select 
p.codcategoria as ID_CATEGORIA,  
p.categoria as DESCRICAO,
'N' as ENVIADO_ECOMMERCE,
'N' AS ENVIADO_BEASY
from pccategoria p ORDER BY p.codcategoria;