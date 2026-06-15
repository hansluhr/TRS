

# Conexão -----------------------------------------------------------------
library("RPostgreSQL")

drv = dbDriver("PostgreSQL")
con = dbConnect(drv, dbname = "sis_datasus",
                host = "psql13rj-saude.ipea.gov.br", port = 5432,
                user = "p224552695", password = "Do355ju290*")

#Check de tabelas disponíveis
sort(dbListTables(con))



# 03.05.01.001-8 - DIÁLISE PERITONEAL INTERMITENTE DPI (1 SESSÃO P --------
qrySim = paste0("SELECT *
FROM public.sia_br_pa 
WHERE pa_docorig = 'S' AND pa_proc_id = '0305010018' ")

t0=Sys.time()
sia=dbGetQuery(con,qrySim)
t1=Sys.time()
duracao1 = t1-t0
duracao1

sia |>
  rio::export(x = _,
              "dialise_secund.xlsx")



# 03.05.01.002-6 - DIÁLISE PERITONEAL INTERMITENTE DPI (MÁXIMO 2 Sessões por semana --------
qrySim = paste0("SELECT *
FROM public.sia_br_pa 

WHERE pa_docorig = 'P' AND 

      pa_proc_id = '0305010026' AND
      
      pa_cidpri LIKE 'N18%' ")

t0=Sys.time()
sia=dbGetQuery(con,qrySim);gc()
t1=Sys.time()
duracao1 = t1-t0
duracao1


sia |>
  rio::export(x = _,
              "dialise_apac_n180.xlsx")

# 03.05.01.009-3 - HEMODIÁLISE (MÁXIMO 1 SESSÃO POR SEMANA - EXCEPCIONALIDADE) --------
qrySim = paste0("SELECT *
FROM public.sia_br_pa 

WHERE pa_docorig = 'S' AND 

      pa_proc_id = '0305010093' ")

t0=Sys.time()
sia=dbGetQuery(con,qrySim);gc()
t1=Sys.time()
duracao1 = t1-t0
duracao1

sia |>
  rio::export(x = _,
              "hemodiálise_secund.csv")

# 03.05.01.010-7 - HEMODIÁLISE (MÁXIMO 3 SESSÕES POR SEMANA) --------------
qrySim = paste0("SELECT *
FROM public.sia_br_pa 

WHERE pa_docorig = 'P' AND 

      pa_proc_id = '0305010107' AND
      
      pa_cidpri LIKE 'N18%' ")

t0=Sys.time()
sia=dbGetQuery(con,qrySim);gc()
t1=Sys.time()
duracao1 = t1-t0
duracao1

sia |>
  rio::export(x = _,
              "hemodiálise.csv")


# 03.05.01.011-5 - HEMODIÁLISE EM PACIENTE COM SOROLOGIA POSITIVA  --------
qrySim = paste0("SELECT *
FROM public.sia_br_pa 

WHERE pa_docorig = 'P' AND 

      pa_proc_id = '0305010115' AND
      
      pa_cidpri LIKE 'N18%' ")

t0=Sys.time()
sia=dbGetQuery(con,qrySim);gc()
t1=Sys.time()
duracao1 = t1-t0
duracao1


sia |>
  rio::export(x = _,
              "hemodiálise_sorologia.csv")



# 03.05.01.012-3 - HEMODIÁLISE EM PACIENTE COM SOROLOGIA POSITIVA  --------
qrySim = paste0("SELECT *
FROM public.sia_br_pa 

WHERE pa_docorig = 'S' AND 

      pa_proc_id = '0305010123' ")

t0=Sys.time()
sia=dbGetQuery(con,qrySim);gc()
t1=Sys.time()
duracao1 = t1-t0
duracao1

sia |>
  rio::export(x = _,
              "hemodiálise_sorologia_secundario.csv")




# 03.05.01.016-6 - MANUTENÇÃO E ACOMPANHAMENTO DOMICILIAR DE PACIE --------
qrySim = paste0("SELECT *
FROM public.sia_br_pa 

WHERE pa_docorig = 'P' AND 

      pa_proc_id = '0305010166' AND
      
      pa_cidpri LIKE 'N18%' ")

t0=Sys.time()
sia=dbGetQuery(con,qrySim);gc()
t1=Sys.time()
duracao1 = t1-t0
duracao1

sia |>
  rio::export(x = _,
              "manutencao.csv")



# 03.05.01.018-2 - TREINAMENTO DE PACIENTE SUBMETIDO A DIALISE PER --------
qrySim = paste0("SELECT *
FROM public.sia_br_pa 

WHERE pa_docorig = 'P' AND 

      pa_proc_id = '0305010182' AND
      
      pa_cidpri LIKE 'N18%' ")

t0=Sys.time()
sia=dbGetQuery(con,qrySim);gc()
t1=Sys.time()
duracao1 = t1-t0
duracao1

sia |>
  rio::export(x = _,
              "treinamento.csv")


