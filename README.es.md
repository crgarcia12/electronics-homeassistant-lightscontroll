# Controlador de luces de automatización del hogar - Compatible con ESPHome y Home Assistant

Este circuito controla las luces del hogar siguiendo estas reglas:
1. Seguro: La seguridad es lo primero y no se negocia en ninguna decisión
1. A prueba de fallos: Si este dispositivo falla, las luces siguen siendo controlables usando los interruptores mecánicos
1. Sigue la instalación estándar: Este dispositivo no requiere que cablees tu casa especialmente para él
1. Puede ser instalado de forma centralizada

Siguiendo esas reglas y usando como referencia una luz de múltiples interruptores controlada con un relé de enganche mecánico, esta es la idea del cableado:

![alt text](PCB/schematics-v19-jlcpcb/readme-media/relay-wiring.png)

Un circuito normal envía todos los pulsadores al relé de enganche, que controla las luces.
Este circuito (ESPHome) es un sidecar del relé de enganche actuando como un pulsador estándar, pero también detectando la salida del relé de enganche para saber si las luces están encendidas o apagadas.

Este dispositivo es extensible:
- Expone pines I2C
- Expone pines Serial
- Expone muchos GPIOs
- Jumper de 3.3V: Permite desconectar el ESP32 interno y reemplazarlo por cualquier otro microcontrolador
- Pines de relés (versión de 4 canales): Los relés pueden ser controlados con un microcontrolador externo o dispositivo directamente 
- Pines de detección de corriente: La información de detección de corriente se expone a través de esos pines. Esto puede usarse para conectar cualquier microcontrolador externo o cualquier otro dispositivo
- Proporciona 3.3V y 5V
- Compatible con ESPHome - Es muy fácil de integrar con Home Assistant

Este dispositivo tiene varias medidas de seguridad:
- Fusible de fusión rápida en la entrada
- MOV de entrada
- Fusibles lentos en cada salida de relé
- Fusibles lentos en cada entrada de detección de red
- Fuente de alimentación aislada de 4kv para bajo voltaje
- Recubrimiento conformal con aislamiento de 90kV/mm2
- Sensor de temperatura de alta precisión

Hay dos versiones de la placa, una con cuatro canales y otra con ocho canales.
Las últimas versiones usan ESP32-S3, que es un microcontrolador muy potente con muchas características.

# Versión 27
Esta es una evolución de la 26.1. Ese es el tamaño correcto que encaja perfectamente en la caja

Versión 7 (SN74LVCH8 + OUTPUT_ENABLED)
![board-schematics](PCB/schematics-v27/readme-media/schematics.svg)
![board-pcb](PCB/schematics-v27/readme-media/board.png)
![board-pcb](PCB/schematics-v27/readme-media/board-front.svg)
![board-pcb](PCB/schematics-v27/readme-media/board-back.svg)
![board-pcb](PCB/schematics-v27/readme-media/board-3d-1.png)
![board-pcb](PCB/schematics-v27/readme-media/board-3d-2.png)
![board-pcb](PCB/schematics-v27/readme-media/board-3d-3.png)
![board-pcb](PCB/schematics-v27/readme-media/board-3d-4.png)
![board-pcb](PCB/schematics-v27/readme-media/board-3d-5.png)

# ¿Cómo funciona?
## Detección de red eléctrica
La PCB utiliza un optoacoplador (LDA210 o ILD755) para detectar la presencia de voltaje de red. Estos optoacopladores darlington se eligen específicamente por sus bajos requisitos de corriente, consumiendo solo 0.7mA a menos de 2V. Este diseño de bajo consumo permite una detección eficiente sin sobrecalentar los componentes.

Para reducir el voltaje de red a un nivel seguro para el optoacoplador, se utiliza una configuración de resistencia de 300kΩ. Esta configuración disipa solo 0.17W, que se divide entre dos resistencias. Cada resistencia, por lo tanto, disipa aproximadamente 0.08W, previniendo problemas de sobrecalentamiento comúnmente vistos con otros diseños (como los que usan el chip HCP). Esta mejora aumenta tanto la seguridad como la longevidad de la PCB.

Cada canal de detección de red está equipado con un fusible para proteger contra fallos. En caso de que una de las resistencias falle en cortocircuito, la resistencia restante puede transportar hasta 1.5mA hasta que el fusible se queme, previniendo efectivamente más daños. Durante esta condición de fallo, la resistencia disiparía aproximadamente 0.4W, por lo que se utilizan resistencias grandes para soportar esta carga potencial.

## Comportamiento del optoacoplador y los condensadores

Esta PCB utiliza un optoacoplador Darlington (LDA210), elegido por su comportamiento de alta ganancia, que permite al sistema reaccionar más rápidamente cuando se enciende la red eléctrica y requiere menos corriente en el lado del LED.

Las imágenes del osciloscopio a continuación muestran dos canales diferentes después del optoacoplador mientras están detectando la red. El canal amarillo no tiene ningún condensador en la salida, mientras que la línea azul tiene los condensadores.

En la primera imagen, se muestra la respuesta del optoacoplador a la onda sinusoidal cuando la red está ENCENDIDA. La línea azul ilustra cómo los condensadores ayudan a mantener la salida en estado alto cuando el ciclo AC está cruzando cero. Este efecto de retención inducido por el condensador asegura que la salida permanezca estable, previniendo fluctuaciones en la salida DC que podrían causar disparos falsos de APAGADO. Sin embargo, este diseño significa que la línea debe estar apagada durante varios ciclos antes de que el microcontrolador pueda detectar de manera confiable el estado "apagado". Usar condensadores excesivamente grandes puede aumentar el retraso de detección a un grado notable, por lo que el tamaño del condensador debe seleccionarse cuidadosamente para equilibrar la capacidad de respuesta y la estabilidad.

![oscilloscope-sensing-mains-1](PCB/schematics-v22-jlcpcb/readme-media/osc-sens-on.jpg)

Cuando se aplica por primera vez la red eléctrica (línea amarilla), el condensador requiere tiempo para cargarse antes de que la salida del optoacoplador alcance un estado alto (línea azul). Esto resulta en un ligero retraso antes de que el microcontrolador detecte el estado de encendido. Si se usan condensadores excesivamente grandes, este retraso se vuelve más pronunciado, lo que puede reducir la capacidad de respuesta. El tamaño del condensador debe seleccionarse cuidadosamente para minimizar este retraso mientras se asegura la estabilidad del sistema.

![oscilloscope-sensing-mains-2](PCB/schematics-v22-jlcpcb/readme-media/osc-sens-switch-on.jpg)

Apagar la red eléctrica puede generar ruido, particularmente dependiendo de dónde en la onda sinusoidal se corta la energía (por ejemplo, en el cruce por cero). Los condensadores en la PCB ayudan a absorber gran parte de este ruido, reduciendo la probabilidad de picos transitorios o disparos falsos de "encendido" que podrían interferir con otros componentes o el microcontrolador. Este filtrado ayuda a mejorar la confiabilidad del sistema, especialmente en entornos ruidosos.

![oscilloscope-sensing-mains-3](PCB/schematics-v22-jlcpcb/readme-media/osc-sens-switch-off.jpg)

## Relés
El diseño inicial para este sistema incluía pequeños relés mecánicos montados en PCB, como el modelo PCN105D. Estos relés, aunque compactos y efectivos para conmutación básica, generaban interferencia electromagnética (EMI) significativa debido a los contactos mecánicos. A pesar de los esfuerzos para mitigar este ruido agregando diodos flyback y aislando el plano de tierra, la interferencia seguía siendo alta. Bajo ciertas condiciones, los niveles de EMI eran lo suficientemente altos como para causar que el microcontrolador se reiniciara, haciendo esta configuración poco confiable para automatización del hogar estable.

La imagen a continuación ilustra el ruido generado por el relé mecánico PCN105D durante la operación. Este pico de ruido, especialmente durante los eventos de conmutación, demostró las limitaciones de los relés montados en PCB en aplicaciones que requieren baja EMI.

Estos relés PCB están destinados a activar relés de enganche montados en riel DIN, que se usan comúnmente en instalaciones eléctricas típicamente sin diodos flyback, resultando en picos de voltaje de varios KV cuando se apagan.

Esta imagen muestra los relés PCN105D cuando se apagan
![oscilloscope-relays-mechanical](readme-media/relay-analysis/Mechanical-PCN-105D.png)

Para abordar los problemas de ruido y estabilidad, el diseño se actualizó para usar relés de estado sólido AQG22205. Estos relés solo están clasificados para 2A, pero incorporan un circuito snubber interno, haciéndolos mucho más resistentes a los picos de voltaje en el lado de red. A diferencia de los relés mecánicos, estos relés de estado sólido no generan ningún ruido durante la conmutación.

![oscilloscope-relays-ssr](readme-media/relay-analysis/SSR-AQG12105.png)

# Simular el circuito de detección de red

Si quieres entender cómo funciona el circuito de detección de red, puedes usar esta simulación: [lushprojects](http://lushprojects.com/circuitjs/circuitjs.html?ctz=CQAgjCAMB0l3BWEBmGZkDYAcmte2AJwYYgDskISClCApgLRhgBQAbiA8Stp91pUoQaIAEyookmAhYB3EABYsIAYuVgFCqCwAma8JvBhRYyMpM66AMwCGAVwA2AF137RZE8xOizYkJdtHFz0mUh9lJQMtC2t7Z1dQ0wjzDz8AuJd5SPcTSNxtLOV8rlJ8yDlOMDDfRNQtcvkvJPAMSnCCytLIaNEtOu0AJz5SVUjVSlR4coAPEAxkZBQECDIRZAQtaMoAUQBlAAVkUQAdAGcAcX2ASQB5FgVIMkVs3wRRc19WeVFesQexX79cocVbeVKg5qCRQTaCLKHSCoYX7tDZbZTlIZI6Lgt5iVK0KYVVF-WiGHLaADGc2RvixeJMglgUwUhFZbPZHNIaDAZkwGh5ZiwZAoXKZXyoZNSdPJDWpaPIuPa5VO9OaC2q6MktgcpzoLExgJ8CpMRyhAsJ8mlUsNggqEPJENN2lmPkI4CwSAeWjAeEUphAAFkbABLAB2pzOuzo4bDAHNI7Jg04KQALCqaD5FTCQirk9pVNq+WUZkkA6L-coAe0kGHq0NZKCNMHgZCwxiQbUkyBY1bAT1rkgeDY7TLghDIGAQSKQEE8T271fEczrQ7dI6m48n0783kW3aAA).

```
$ 1 0.000005 30.13683688681966 70 5 50 5e-11
v -96 368 -96 80 0 1 50 230 0 0 0.5
w 48 80 48 144 0
d 48 144 112 208 2 default
d 48 272 112 208 2 default
d -16 208 48 144 2 default
d -16 208 48 272 2 default
w 48 272 48 368 0
w 48 368 -96 368 0
w -16 208 -16 304 0
w 112 208 160 208 0
w -16 304 224 304 0
r -96 80 48 80 0 300000
x 633 351 750 354 4 20 ESP32\sGPIO
407 448 208 528 208 1
w 224 240 224 304 0
v 752 272 752 208 0 0 40 3.3 0 0 0.5
w 624 208 544 208 0
r 624 272 752 272 0 50000
w 544 240 544 272 0
c 624 208 624 272 0 0.0000049999999999999996 0.08913507182464649 0.001
w 544 272 624 272 0
w 624 208 752 208 0
s 272 208 336 208 0 0 false
r 624 320 752 320 0 1000000
w 624 272 624 320 0
w 752 272 752 320 0
x 209 185 404 188 4 20 Mains\sSensing\sSwitch
w 448 208 336 208 0
w 272 208 160 208 0
w 448 240 224 240 0
o 0 64 0 4099 320 0.00078125 0 2 0 3
o 17 64 0 4099 5 0.00009765625 1 2 17 3
o 23 64 0 4099 5 0.00009765625 2 2 23 3
```

## Cómo pedir de JLCPCB:
![how-to-order-from-jlcpcb](readme-media/jlcpcb-how-to-order.gif)

# Notas de desarrollo

## Generando archivos de fabricación para JLCPCB
1. Graficar PCB Gerber + Taladro + Mapa:

    ![screenshot](readme-media/tutorial/plot-1.png)
    ![screenshot](readme-media/tutorial/plot-2.png)

1. Archivos Bom
    ![screenshot](readme-media/tutorial/bom-1.png)
    ![screenshot](readme-media/tutorial/bom-2.png)

    Comando: python3 "C:\Program Files\KiCad\bin\scripting\plugins/bom_csv_jlcpcb.py" "%I" "%O.csv"
    ![screenshot](readme-media/tutorial/bom-3.png)

1. Archivos de taladro
    ![screenshot](readme-media/tutorial/pos-1.png)
    ![screenshot](readme-media/tutorial/pos-2.png)
    ejecutar el script de python para rotar los componentes
    ![screenshot](readme-media/tutorial/pos-3.png)

    PS C:\\...\smt-assembly> python3 .\kicad-to-jlcpcb-pos.py .\hamodule-top-pos.csv .\hamodule-top-pos-jlcpcb.csv

## Generar documentos

esquemáticos:
![screenshot](readme-media/tutorial/gen-images-1.png)

PCB:
Imprimir a PDF, y usar un sitio web de conversión de PDF a JPG de alta resolución como: https://pdf2jpg.net/


# Versiones Antiguas: 26.1, 2 3: Ocho canales con expansor IO
Comparado con la versión 23:
* Usando TCAL6416A en lugar de MCP23108 debido a tener push-pull en lugar de salidas open-drain.
* MCP23017 ha publicado una enmienda a la hoja de datos declarando un error en dos pines. Haciéndolos de solo lectura
* Ajustar los recortes del borde para que encajen en el agujero de montaje central
* Hubo un error en la implementación del TXB0108. Los pines OE y DIR deben referenciar VccA. Esto significa que necesitan divisor de voltaje (VccA = 3V y no 3.3)
* Agregando descripciones en los esquemáticos
* Teniendo 3 subversiones hechas por jlcpcb para probar el ajuste en la caja. Todas son iguales, diferente tamaño de placa
* ERROR: Las resistencias R27-R34 son demasiado débiles, porque el nivel de cambio 74LVCH8T245PWE4 tiene retenedor de voltaje de bus.

Versión 26.1 (SN74LVCH8 + OUTPUT_ENABLED)
![board-schematics](PCB/schematics-v26.1-jlcpcb/readme-media/schematics.svg)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board.png)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-front.svg)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-back.svg)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-3d-1.png)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-3d-2.png)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-3d-3.png)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-3d-4.png)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-3d-5.png)

# Versiones Antiguas: 24 Ocho canales con expansor IO
Comparado con la versión 23:
* Usando TCAL6416A en lugar de MCP23108 debido a tener push-pull en lugar de salidas open-drain
* MCP23017 ha publicado una enmienda a la hoja de datos declarando un error en dos pines. Haciéndolos de solo lectura
* Ajustar los recortes del borde para que encajen en el agujero de montaje central
* Hay dos versiones de esta placa, una usando SN74LVCH8 y la otra usando TXB0108. Si quieres compararlas, cambia entre los dos esquemáticos en dos pestañas del navegador

Versión 24.8-1 (TXB0108)
![board-schematics](PCB/schematics-v24-1-jlcpcb/readme-media/schematics.svg)
![board-pcb](PCB/schematics-v24-1-jlcpcb/readme-media/board.png)

Versión 24.8-2 (SN74LVCH8 + OUTPUT_ENABLED)
![board-schematics](PCB/schematics-v24-2-jlcpcb/readme-media/schematics.svg)
![board-pcb](PCB/schematics-v24-2-jlcpcb/readme-media/board.png)
![board-pcb](PCB/schematics-v24-2-jlcpcb/readme-media/3d-board-1.png)
![board-pcb](PCB/schematics-v24-2-jlcpcb/readme-media/3d-board-2.png)
![board-pcb](PCB/schematics-v24-2-jlcpcb/readme-media/3d-board-3.png)
![board-pcb](PCB/schematics-v24-2-jlcpcb/readme-media/3d-board-4.png)

# Versiones Antiguas: 23 Ocho canales

Comparado con la versión 22:
* Ocho canales controlados vía I2C para relés y detección de red
* Agregado controlador LED RGB
* Condensador para línea de 5v
* Compatible con caja: RS PRO Modular Enclosure for DIN rail Número de stock: 1862291 (https://uk.rs-online.com/web/p/din-rail-enclosures/1862291/)
* Agregado MCP23018 como expansor IO y TXB0108PW para cambiar la salida del darlington (~2.5V) al lógico alto (3.3V)

Errores
* MCP23018 es open drain y no es un reemplazo directo de MCP23017: Las salidas son GND o desconectadas, no Vcc
* El agujero de montaje de PCB medio en la versión cortada no está colocado apropiadamente

![board-schematics](PCB/schematics-v23.8/-jlcpcbreadme-media/hamodule.svg)
![board-pcb](PCB/schematics-v23.8-jlcpcb/readme-media/board.png)
![board-pcb](PCB/schematics-v23.8-jlcpcb/readme-media/3d_board_2.png)
![board-pcb](PCB/schematics-v23.8-jlcpcb/readme-media/3d_board_3.png)
![board-pcb](PCB/schematics-v23.8-jlcpcb/readme-media/3d_board_4.png)


# Versiones antiguas: 22 Cuatro canales
[Información detallada](PCB/schematics-v22-jlcpcb/)

Desde la Versión 17: 
* Área de antena ESP32 recortada
* Mover serigrafía para legibilidad
* Legibilidad de esquemático mejorada
* Agregar leds para indicar cuando los relés están ENCENDIDOS

![board-schematics](PCB/schematics-v22-jlcpcb/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v22-jlcpcb/readme-media/board-pcb.jpg)
![board-pcb-3d](PCB/schematics-v22-jlcpcb/readme-media/board-pcb-3d-4.png)
![board-pcb-3d](PCB/schematics-v22-jlcpcb/readme-media/board-pcb-3d-5.png)
![board-pcb-3d](PCB/schematics-v22-jlcpcb/readme-media/board-pcb-3d-2.png)
![board-pcb-3d](PCB/schematics-v22-jlcpcb/readme-media/board-pcb-3d.png)
![board-pcb-3d](PCB/schematics-v22-jlcpcb/readme-media/board-pcb-3d-3.png)
![board-real-image](PCB/schematics-v22-jlcpcb/readme-media/board-real-1.jpg)
![board-real-image](PCB/schematics-v22-jlcpcb/readme-media/board-real-2.jpg)
![board-real-image](PCB/schematics-v22-jlcpcb/readme-media/board-real-3.jpg)
![board-real-image](PCB/schematics-v22-jlcpcb/readme-media/board-real-4.jpg)

# Versiones antiguas: 21
* Usando el nuevo ESP32-S3
* Reemplazar CP2102 por soporte USB integrado de ESP
* Reemplazar diodos de protección USB con un IC

![board-schematics](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-pcb.png)
![board-pcb-3d](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-pcb-3d.png)
![board-pcb-3d](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-pcb-3d-3.png)
![board-pcb-3d](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-pcb-3d-4.png)
![board-pcb-3d](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-pcb-3d-2.png)

# Versiones antiguas: 20
[Información detallada](PCB/schematics-v20-pcbway/)

Desde la Versión 17: 
* La detección de red está invertida, para hacer un mejor uso de los condensadores rectificadores y tener lectura constante
* Eliminado fusible de bajo voltaje. Tener solo un fusible es suficiente ya que la fuente de alimentación tiene protección de sobrecorriente y aislamiento >4kV
* Tornillos movidos. Ahora tiene un punto de sujeción extra
* Exponer GPIO12 y GPIO33, para mejor extensibilidad de la placa
* Movido a SSR con snubber integrado en lugar de relés mecánicos. El retroceso de la carga inductiva (relés de enganche) estaba creando picos y reiniciando el ESP32
* Agregando condensadores SMD a las líneas de 3.3v y 5V en caso de que sean necesarios en condiciones ruidosas
* GND separado para relés y ULN del plano de señal digital, para reducir el ruido

![board-schematics](PCB/schematics-v20-pcbway/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v20-pcbway/readme-media/board-pcb.png)
![board-pcb-3d](PCB/schematics-v20-pcbway/readme-media/board-pcb-3d.png)
![board-pcb-3d](PCB/schematics-v20-pcbway/readme-media/board-pcb-3d-3.png)
![board-pcb-3d](PCB/schematics-v20-pcbway/readme-media/board-pcb-3d-4.png)
![board-pcb-3d](PCB/schematics-v20-pcbway/readme-media/board-pcb-3d-2.png)

# Versiones antiguas: Versión 19
[Información detallada](PCB/schematics-v19-jlcpcb/)

Desde la Versión 17: 
* Agregando fusibles a cada salida de relé. Esto es para proteger en caso de que dos relés estén cerrados al mismo tiempo, y uno de ellos esté accidentalmente cableado a N. La corriente podría fluir de uno al otro
* Moviendo SHT40 y extendiendo la huella, para facilitar la soldadura
* Moviendo LD11. Ahora es más fácil encajar en la caja
* Probado con ambos optoacopladores: LDA210 y ILD755-D

![board-schematics](PCB/schematics-v19-jlcpcb/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v19-jlcpcb/readme-media/board-pcb.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d-3.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d-4.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d-2.png)


# Versiones antiguas: Versión 17
[Información detallada](PCB/schematics-v17-safety-jlcpcb/)

Desde la Versión 13 hubo muchos cambios: 
* Cambió el optoacoplador por otro con menos requisitos de corriente.
* Cambiar resistencias a 150k x 2
* Agregando fusibles a cada canal de detección, y eliminar fusible en N
* Agregando un fusible separado para pista de 5V y 3.3V
* Littlefuse tiene un soporte, en lugar de soldar directamente a la PCB
* Agregando módulo ESP32 integrado
* Agregando sensor de temperatura, para detectar si la placa se calienta demasiado
* Agregando USB-C alimentado por chip UART CP2102N
* Eliminar condensadores del convertidor de 5v->3.3, para evitar corriente de irrupción en el USB
* Agregando resistencias de pull-up externas para ESP32, algunos pines no tienen pull-ups internos
* Agregando redes de red con distancia de fuga y distancia de aislamiento
* Reemplazando conectores de red por Wago con palancas. ¡Son súper confiables y fáciles de usar!
* Reemplazar sensor de temperatura analógico por SHT40 usando protocolo I2C.
* También agregando terminal I2C, para que podamos conectar cualquier sensor I2C
![board-schematics](PCB/schematics-v17-safety-jlcpcb/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v17-safety-jlcpcb/readme-media/board-pcb.png)
![board-pcb-3d](PCB/schematics-v17-safety-jlcpcb/readme-media/board-pcb-3d.png)

![board-pcb-3d](PCB/schematics-v17-safety-jlcpcb/readme-media/enclosure.jpg)

La carcasa comparada con un relé DIN. El tamaño es perfecto :)
![board-pcb-3d](PCB/schematics-v17-safety-jlcpcb/readme-media/cage-vs-relay.jpg)

# Versión antigua: Versión 16
Comparación de tamaño entre V16 y V13:

![board-pcb-3d](PCB/schematics-v16-espinside-jlcpcb/readme-media/V16-v-sV2.jpg)

# Versiones antiguas: Versión 13

Esta versión fue minimizada por:
* Usando relés SPST-NO 3A más pequeños
* Usando resistencias SMD 3W 29k en lugar de THT
* Eliminado conector de botones externos
* Eliminado conector de leds externos
* Usando ULN2003A SMD en lugar de THT
* Condensadores THT HCPL3700 reemplazados por SMD de tantalio

Adiciones de seguridad:
* Agregado fusible en el retorno neutral de los sensores (F2)
* Las resistencias están antes de HCPL3700, para hacerlas funcionar con menos de 4V a N, en lugar de 110V a N

Estabilidad:
* Agregado condensador de filtro a ULN2003A
* Agregados condensadores de filtro a LD1117AV33

Otros:
* Agregado indicador led cuando está encendido

![v2-board-schematics](readme-media/v2-board-schematics.png)
![v2-board-pcb](readme-media/v2-board-pcb.png)
![v2-board-pcb-3d](readme-media/v2-board-pcb-3d.png)
![v2-board-pcb-3d](PCB/schematics-v13-new-relays-jlcpcb/readme-media/PCB.jpg)

# Versiones antiguas: Versión 9

Esquemáticos del dispositivo (en desarrollo)

![v1-board-schematics](readme-media/v1-board-schematics.png)
![v1-board-pcb](readme-media/v1-board-pcb.png)
![v1-board-pcb-3d](readme-media/v1-board-pcb-3d.png)
![v2-board-pcb-3d](PCB/schematics-v02/readme-media/PCBs.jpg)

# Versiones antiguas: Versiones 1
No tengo ni idea de lo que estaba pensando cuando hice esto. Supongo que lo pongo aquí para mostrar cuánto tuve que aprender :)

![v1-board-schematics](PCB/schematics-v01/readme-media/schematic.png)
![v1-board-layouts](PCB/schematics-v01/readme-media/pcb-layout.png)
