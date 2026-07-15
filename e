Fase 1: El Filtro Físico (Paso 1)
Pregunta: ¿En qué lugar físico de la operación vamos a enfocarnos hoy?
1.	El usuario entra y ve todas las áreas activas (Invernaderos si es Ubicación RD del 1 a 24, SPA, Campo Abierto, Procesos, Riego, Semilleros de RD 1 al 2, Produccion del 1 a 7, Nursery de 1  a 10).
2.	Al hacer clic en un área, la aplicación guarda esa ubicación y se hace una pregunta lógica clave:
o	¿Es un área de invernaderos Semilleros, Produccion Nursery Campo Abierto, con plantas vivas? (TieneSets = Sí). Entonces manda al usuario al Paso 2.
o	Es Procesos, y  SPA, Aparecen todos los sets, 
o	¿Es un área de servicio? (TieneSets = No). Salta directamente al Paso 3, porque ahí no hay "sets" de plantas que elegir.
Fase 2: El Volumen de Trabajo (Paso 2)
Pregunta: ¿Qué material vegetal específico vamos a manipular?
1.	La aplicación filtra la  base general (DATASUMMARY1) y solo muestra los sets que están físicamente sembrados en el área elegida en el Paso 1 (Greenhouse). Y se puede buscar por Crop, por MCT si lo tiene, por programa, generation, Triaintet, SetName
2.	El usuario selecciona uno o varios sets (o todos).
3.	Cuando esta en SPA, Procesos, deben de aparecer todos los sets Activos. 
4.	El dato maestro aquí: Al elegir los sets, la aplicación suma en segundo plano la cantidad total de plantas (PlantsRequired), cuando lo tiene, porque es importante saber que cuando se esta trabajando en invernaderos se tiene las plantas trasplantas no requeridas, pero en semillero no se sabe que cantidad todal de plantas hay y es necesario determinar este proceso para ver como poder establer la actividad, o dejar una casilla de la cantidad de plantas que hay que sembrar o algo asi, en SPA, aquí no tiene plantas trasplantdas, si no que quiza baserse en la cantidad de sets, y materiales que hay para hacer el proceso, o visualiza como esta ingresando las actividades espa, pero debe de haber un parámetro para saber que cantidad de materiales o plots o sets hay para poder definir la cantidad de personas que se van a trabajar, en procesos aquí es solo lo que pasa en cosecha porque hay varias cosechas, . Esto nos da el volumen base sobre el que vamos a trabajar. Cuando esta en invernadero. Debe de existir una forma para poder establecer este sistema, 
Fase 3: La Acción y la Historia (Paso 3)
Pregunta: ¿Qué actividad agronómica se les va a aplicar y qué tan rápidos somos haciéndola?
1.	El usuario elige la tarea (Siembra, Polinización, Cosecha, Extracción de tejido, etc.). y aquí es donde aplica que no solo se base el rendimiento en base a la actividad, si no que también si el set seleccionado tiene un Trial Inte, Porgram, Generacion mct SI LO TIENE, para que el rendimiento sea mas pegado a la realidad. 
2.	El cálculo mágico: Al hacer clic, la aplicación cruza el cultivo de los sets elegidos (Paso 2) con la actividad seleccionada (Paso 3) y busca en el historial de evaluaciones (RENDIMIENTOS_CATALOGO) en base a los criterios mencionados si tiene Program, MCT, Trial Intems, Generacion.
3.	El sistema deduce el Rendimiento Base: "Históricamente, en este cultivo, Program, Trial Items, Generacion y para esta tarea, hacemos X operaciones por hora".
Fase 4: La Simulación de Realidad (Paso 4)
Pregunta: ¿A qué personal capacitado envío y, matemáticamente, terminarán su turno a tiempo?
Esta es la sala de control (las 3 columnas que estamos construyendo):
1.	La Demanda (Columna A): Multiplica las plantas seleccionadas (Paso 2) por las operaciones que requiere la tarea (Paso 3). Resultado: Ej. "Tenemos 5,000 operaciones por hacer".
2.	El Personal (Columna B): El sistema filtra tu catálogo y solo te muestra a las personas que tienen una nota aprobatoria (Nivel > 6) para esa actividad en específico. No te deja asignar gente sin experiencia. El usuario marca las casillas de quiénes irán y si van jornada completa o media jornada.
3.	El Simulador (Columna C): Suma la capacidad individual (op/hora) del equipo que armaste y la divide entre las 5,000 operaciones totales.
o	Veredicto Verde: "El equipo tiene capacidad para 800 op/h. Terminarán en 6.2 horas. ✅ Aprobado."
o	Veredicto Rojo: "El equipo terminará en 12 horas. ❌ En riesgo. Necesitas agregar a 2 personas más o bajar la meta de sets".
Fase 5: La Ejecución (Guardado y Vistas)
