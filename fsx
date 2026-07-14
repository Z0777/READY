Paso 1: Desencadenador Programado
Acción: Recurrencia (Programación).

Intervalo: Cada 1 o 2 horas (según la necesidad operativa).

Paso 2: Extraer datos de origen
Acción: SharePoint → Obtener elementos.

Sitio: [https://intecapedu.sharepoint.com/sites/TOMATE](https://intecapedu.sharepoint.com/sites/TOMATE)

Lista: Global Shipping Requests

Consulta de filtro (OData):

Fragmento de código
SHIP_FROM_COUNTRY eq 'Guatemala' and Status eq 'New Request' and (TYPE_OF_SHIPMENT eq 'Seed' or TYPE_OF_SHIPMENT eq 'Seed/Tissue')
Paso 3: Bucle de procesamiento
Acción: Control → Aplicar a cada uno.

Parámetro de entrada: value (Salida del Paso 2).

(Opcional pero recomendado: En Configuración del bucle, activar "Control de simultaneidad" a 1 para evitar duplicados si entran muchos datos de golpe).

Dentro de este bucle, van las siguientes acciones:

3.1 Verificar si el registro ya existe en el tablero
Acción: SharePoint → Obtener elementos.

Nombre de la acción: Obtener elementos SPA (vital respetar este nombre para las fórmulas).

Lista: SOLICITUDESPA1

Primeros puestos (Top count): 1

Consulta de filtro (OData):

Fragmento de código
Request_ID eq '@{items('Aplicar_a_cada_uno')?['ID']}'
3.2 Evaluar existencia (Condición)
Acción: Control → Condición.

Lado izquierdo (Expresión):

Fragmento de código
length(outputs('Obtener_elementos_SPA')?['body/value'])
Operador: es mayor que.

Lado derecho: 0

Paso 4: Las dos rutas (Crear o Actualizar)
🟩 Rama "En caso afirmativo" (True) → ACTUALIZAR ELEMENTO
Si el registro ya existe, actualizamos su información para capturar cualquier cambio hecho en Global Shipping, pero respetando los estados y fechas de la aplicación.

Acción: SharePoint → Actualizar elemento.

Lista: SOLICITUDESPA1

Id. (Expresión):

Fragmento de código
first(outputs('Obtener_elementos_SPA')?['body/value'])?['ID']
Mapeo de campos a actualizar:

Crop: CROP Value

PEA: Author/DisplayName (o PEA/Responsible si lo cambiaste).

SHIP_TO_LOCATION: SHIP_TO_LOCATION

Requested Date: Requested_date

⚠️ REGLA DE ORO: Dejar totalmente vacíos los campos Estatus, FechaInicio, FechaFin, FechaEntrega y BOAEmail. Si se mapean aquí, el flujo borrará los clics que los usuarios den en los botones de Power Apps.

🟥 Rama "En caso negativo" (False) → CREAR ELEMENTO
Si el registro es completamente nuevo, se inserta en el tablero como una solicitud fresca.

Acción: SharePoint → Crear elemento.

Lista: SOLICITUDESPA1

Mapeo de campos iniciales:

Request_ID: ID (el que viene directamente de Global Shipping).

Estatus: Escribir manualmente Requested (para que aparezca en la primera columna del tablero).

Actividad: Escribir manualmente Envío internacional (o la categoría que prefieras).

Crop: CROP Value

PEA: Author/DisplayName

SHIP_TO_LOCATION: SHIP_TO_LOCATION

Requested Date: Requested_date
