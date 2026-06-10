SELECT 
FROM public.sia_br_pa;


SELECT pa_docorig
FROM public.sia_br_pa
WHERE pa_docorig = 'I'


#03.05.01.001-8 - DIÁLISE PERITONEAL INTERMITENTE DPI (1 SESSÃO POR SEMANA -EXCEPCIONALIDADE)
#Procedimento secundário
select *
from public.sia_br_pa  
where pa_docorig = 'S' and  pa_proc_id = '0305010018'


#03.05.01.002-6 - DIÁLISE PERITONEAL INTERMITENTE DPI (MÁXIMO 2 SESSÕES POR SEMANA)
#APAC

select pa_cidpri
from public.sia_br_pa 
where pa_docorig = 'P' and pa_proc_id = '0305010026'


#03.05.01.009-3 - HEMODIÁLISE (MÁXIMO 1 SESSÃO POR SEMANA - EXCEPCIONALIDADE)
#APAC secundário
select *
from public.sia_br_pa  
where pa_docorig = 'S' and  pa_proc_id = '0305010093' limit 100
