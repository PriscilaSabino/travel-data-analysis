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

**Palavras-chave:**

`TRIM` • `REPLACE` • `CAST` • `TRY_CAST` • `Normalização`

## Dia 2

**Problema:**

Após normalizar o banco de dados, a coluna `traveler_id` da tabela `db_trips` ficou com todos os valores `NULL`.

**Solução:**

- Percebi que a `FOREIGN KEY` não preenche o valor automaticamente.
- Utilizei um `INNER JOIN` entre `db_travel` e `db_travelers` para recuperar o `traveler_id`. (Na hora de transferir arquivos-INSERT INTO/SELECT)
- Fiz o relacionamento comparando `Traveler_name`, `Traveler_age`, `Traveler_gender` e `Traveler_nationality`, pois a tabela original não possuía um identificador único.

**Aprendizados:**

- `FOREIGN KEY` apenas garante a integridade dos dados; ela não busca nem preenche valores.
- Quando uma tabela não possui um ID, é necessário utilizar outras colunas para localizar o registro correspondente.
- O `JOIN` pode ser usado durante a importação dos dados para recuperar chaves primárias de tabelas relacionadas.
- Em bancos de dados reais, normalmente existe um identificador único (como `customer_id` ou `employee_id`), permitindo relacionamentos por apenas uma coluna.
- A normalização não consiste apenas em dividir uma tabela em várias; também é preciso reconstruir os relacionamentos entre elas.

**Palavras-chave:**

`INNER JOIN` • `PRIMARY KEY` • `FOREIGN KEY` • `IDENTITY` • `Normalização`

## Dia 3

**Problema:**

Ao inserir os dados na tabela `db_expenses`, apenas 46 de 139 registros foram importados.

**Solução:**

- Identifiquei que o `INNER JOIN` utilizado para recuperar o `trip_id` não encontrava correspondência para todas as viagens.
- Adicionei a coluna `original_trip_id` na tabela `db_trips` para armazenar o identificador do dataset original.
- Passei a relacionar `db_travel` com `db_trips` utilizando `original_trip_id`, garantindo um relacionamento 1:1.

**Aprendizados:**

- Nem sempre é uma boa ideia descartar o identificador da base de origem durante a normalização.
- Manter uma chave da origem pode simplificar processos de ETL e importação de dados.
- A modelagem do banco influencia diretamente a facilidade de realizar `JOIN`s e manter a integridade dos dados.
