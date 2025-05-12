# Documentación del Script `ctex.sh`

Este script `ctex.sh` está diseñado para compilar un proyecto LaTeX y gestionar los archivos generados durante el proceso. Al finalizar la compilación, el script elimina automáticamente todos los archivos temporales y auxiliares, excepto el archivo PDF final (`main.pdf`). Además, si se desea, también ofrece la opción de mantener los archivos temporales utilizando la opción `-keep`.

# Requisitos
LaTeX: El script requiere que pdflatex y biber estén instalados y configurados en tu entorno.
Estructura del proyecto: El script asume que el archivo principal de LaTeX es main.tex y que los archivos generados se guardan en una carpeta llamada build/.

## Funcionalidad

1. **Compilación de LaTeX:**
   El script compila el archivo `main.tex` utilizando `pdflatex` y `biber` para generar el archivo PDF final (`main.pdf`) y procesar la bibliografía.

2. **Eliminación de archivos temporales:**
   Después de la compilación, el script elimina todos los archivos generados que no sean el archivo PDF final (`*.pdf`). Esto incluye:
   - Archivos `.aux`
   - Archivos `.log`
   - Archivos `.bcf`
   - Archivos `.bbl`
   - Archivos `.blg`
   - Otros archivos temporales generados durante la compilación

3. **Eliminación de carpetas vacías:**
   Además de los archivos, el script elimina también cualquier carpeta vacía dentro de la carpeta `build/` para mantener una estructura limpia.

4. **Opción `-keep`:**
   Si se desea mantener los archivos temporales, se puede ejecutar el script con la opción `-keep`. Esta opción preservará todos los archivos generados durante la compilación.
## Ejemplo de ejecución

1. **Compilación y eliminación de archivos temporales:**
   Para compilar el proyecto y eliminar automáticamente todos los archivos temporales (y carpetas vacías), simplemente ejecuta el siguiente comando:
   ```bash
   ./ctex.sh

## Mensaje de Advertencia sobre `shell escape`

Durante la compilación, es posible que aparezca el siguiente mensaje de advertencia:
Package ifplatform: shell escape is disabled, so I can only detect \ifwindows.


### ¿Qué significa este mensaje?

Este mensaje indica que **shell escape** está deshabilitado en la configuración de LaTeX por defecto, lo que puede afectar al uso de ciertos paquetes, como `ifplatform`, que requieren la ejecución de comandos del sistema operativo para detectar la plataforma (por ejemplo, Windows, Linux, etc.).

El mensaje puede seguir apareciendo si:
- **Shell escape no está habilitado globalmente** en la configuración de tu entorno LaTeX.
- Se está ejecutando un comando LaTeX que depende de la ejecución de comandos del sistema, como los utilizados por el paquete `ifplatform`.


### ¿Cómo maneja el script esta situación?

El script `ctex.sh` habilita **shell escape** de forma temporal durante la compilación de este proyecto añadiendo la opción `--shell-escape` a los comandos `pdflatex` y `biber`. Esto permite la ejecución de comandos del sistema necesarios para el funcionamiento del paquete `ifplatform`, sin necesidad de modificar la configuración global de LaTeX. De este modo, el problema se resuelve solo durante la ejecución de este script y no afecta otros proyectos o compilaciones.
