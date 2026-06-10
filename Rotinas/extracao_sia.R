#Carregando pacotes
library(basedosdados)
library(tidyverse)
set_billing_id("juntarcnpj")
#Declaração pasta raiz.
here::i_am("Rotinas/extracao_sia.R")


sia <- read_sql("
SELECT 
    id_municipio,
    ano_realizacao_procedimento,
    sexo_paciente,
    idade_paciente,
    raca_cor_paciente,
    carater_atendimento,
    id_processamento_ambulatorial,
    valor_produzido_procedimento,
    quantidade_produzida_procedimento,
    cid_principal_categoria,
    cid_principal_subcategoria,
    cid_secundario_categoria,
    cid_secundario_subcategoria
FROM `basedosdados.br_ms_sia.producao_ambulatorial`
WHERE ano_realizacao_procedimento = 2012
  AND id_processamento_ambulatorial IN ( 
      '0305010018',
      '0305010026',
      '0305010093',
      '0305010107',
      '0305010115',
      '0305010123',
      '0305010166',
      '0305010182',
      '0305020056')")



sia |>
  rio::export(x = _,
              "sia.csv")



nrow(sia)

sia <- data.table::fread("sia.csv")

sia |> count(carater_atendimento)





read_sql("SELECT carater_atendimento
         FROM `basedosdados.br_ms_sia.producao_ambulatorial` LIMIT 100") |> view()









