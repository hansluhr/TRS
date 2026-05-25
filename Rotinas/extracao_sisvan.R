# Extração base dos dados -------------------------------------------------

#Carregando pacotes
library(basedosdados)
library(tidyverse)
set_billing_id("juntarcnpj")
#Declaração pasta raiz.
here::i_am("SISVAN/sisvan.R")


base <- 
  read_sql("
    SELECT
      ano,
      id_municipio,
      AVG(imc) AS media_imc
    FROM `basedosdados.br_ms_sisvan.microdados`
    GROUP BY ano, id_municipio
    ORDER BY id_municipio, ano")



base <- read_sql("
SELECT
    ano,
    id_municipio,
    sexo,
    AVG(imc) AS media_imc
FROM `basedosdados.br_ms_sisvan.microdados`
GROUP BY ano, id_municipio, sexo
ORDER BY ano, id_municipio, sexo
")


base <- read_sql("
SELECT
    ano,
    id_municipio,

    AVG(imc) AS media_imc_geral,

    AVG(CASE 
            WHEN sexo = 'M' THEN imc 
        END) AS media_imc_masculino,

    AVG(CASE 
            WHEN sexo = 'F' THEN imc 
        END) AS media_imc_feminino

FROM `basedosdados.br_ms_sisvan.microdados`

WHERE fase_vida = '8'

GROUP BY ano, id_municipio
ORDER BY ano, id_municipio")


read_sql("SELECT * FROM `basedosdados.br_ms_sisvan.microdados` LIMIT 100") -> x



#Agregação das Querys de interesse
tibb

















#Carregando pacotes
library(basedosdados)
library(tidyverse)
library(duckdb)
set_billing_id("juntarcnpj")
#Declaração pasta raiz.
here::i_am("SISVAN/sisvan.R")

# Conexão com o DuckDB
con <- dbConnect(duckdb(), dbdir = paste0(dirname(getwd()),"/bases/sisvan/duckdb/sisvan.duckdb"))

# Loop entre 2008 e 2023
for (ano in 2018:2023) {
  
  message("Baixando ano: ", ano)
  
  # Query com ano e limite de linhas
  df <- read_sql(
    paste0("SELECT *
            FROM `basedosdados.br_ms_sisvan.microdados` as sisvan
            WHERE ano = ", ano) ) |>
    mutate(across(everything(), as.character))
  
  # Salva no DuckDB — append = TRUE empilha os anos
  dbWriteTable(con,
               name      = "sisvan",
               value     = df,
               append    = TRUE,   # empilha sem sobrescrever
               overwrite = FALSE)
  
  message("Ano ", ano, " salvo com sucesso!");gc()
}; beepr::beep(); gc()

# Encerra a conexão
dbDisconnect(con)

library(duckplyr)
#Reabre a conexão e verifica
con <- dbConnect(duckdb::duckdb(), 
                 dbdir = paste0(dirname(getwd()),"/bases/sisvan/duckdb/sisvan.duckdb"),
                 read_only = FALSE)

DBI::dbListTables(con)
data <- 
  tbl(con, "sisvan")


library(bit64)


# data |> head() |> view()
#   
#   #mutate(mes = mes |> as.integer() )   |>
#   
#   count(ano)

read_sql("SELECT ano id_individuo 
           COUNT(id_individuo) AS contagem
           GROUP BY ano
           FROM `basedosdados.br_ms_sisvan.microdados`" ) 







base <- 
  read_sql("
SELECT 
   id_individuo ano,
    COUNT(id_individuo) AS contagem
FROM `basedosdados.br_ms_sisvan.microdados`
GROUP BY id_individuo
ORDER BY ano")



base |>
  arrange(desc(contagem))


(tibble(
  query = c(
    "SELECT * FROM `basedosdados.br_inep_ideb.escola`",
    "SELECT ana.id_municipio, ana.indice_sem_atend
     FROM `basedosdados.br_ana_atlas_esgotos.municipio` as ana",
    "SELECT * FROM `basedosdados.br_ibge_pib.municipio`")) %>%
    mutate(resultados = map(query, read_sql)) ->
    queries)

(queries %>%
    pull(resultados) %>%
    reduce(left_join) ->
    painel)




#dbDisconnect(con)

# library(basedosdados)
# library(tidyverse)
# set_billing_id("juntarcnpj")
# base <-
#   read_sql("SELECT * FROM `basedosdados.br_ms_sisvan.microdados` as sisvan
#           where ano = 2014 LIMIT 100")
# class(base)
# base

# 
# 
# query <- "SELECT * FROM `basedosdados.br_ms_sisvan.microdados`"
# dir <- tempdir()
# data <- download(query, "sisvan.csv",
#                  path = )
# 
# tibble(
#   
#   query = c(
#     
#     "SELECT * FROM `basedosdados.br_ms_sisvan.microdados` LIMIT 100 as sisvan")
# )
# 
# download("SELECT * FROM `basedosdados.br_ms_sisvan.microdados` as sisvan LIMIT 100",
#          path = "abc.csv")
# 
# 
# 
# unique(base$id_municipio) |>
#   as_tibble()
# 
# 
# names(base)

