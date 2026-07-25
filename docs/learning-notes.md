## Dia 1

Problema:

A coluna Transportation_cost e Accommodation_cost vieram como texto. Deu um erro na hora de transferir os arquivos para a tabela nova.

Solução:

Usei REPLACE para remover "USD", "," e "$".
Usei TRIM para remover espaços.
Usei TRY_CAST para converter para DECIMAL.

Aprendizados:

- TRIM remove espaços.
- REPLACE substitui caracteres.
- CAST converte tipos de dados.
- TRY_CAST nesse caso é melhor, pois retorna NULL em vez de derrubar a consulta.