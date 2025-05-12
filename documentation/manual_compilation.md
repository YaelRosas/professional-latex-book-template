recuerda cambiar de idioma eso
Documentación de compilación LaTeX con latexmk en VSCode
---------------------------------------------------------

Este documento explica cómo compilar un proyecto LaTeX usando el comando `latexmk` desde la terminal en tu proyecto de VSCode.

### 1. **Compilación manual usando `latexmk`**

Para compilar un archivo LaTeX manualmente en la terminal, utiliza el siguiente comando:

```bash
latexmk -pdf -interaction=nonstopmode -synctex=1 -bibtex <nombre-del-archivo>.tex
```

Donde:
- **`-pdf`**: Indica que el formato de salida será un archivo PDF.
- **`-interaction=nonstopmode`**: Continúa la compilación incluso si se encuentran errores. Esto evita que la compilación se detenga.
- **`-synctex=1`**: Habilita la sincronización entre el código fuente y el archivo PDF generado. Esto permite la sincronización inversa (hacer clic en el PDF y ser llevado directamente al código fuente).
- **`-bibtex`**: Ejecuta BibTeX para procesar las referencias bibliográficas (si el archivo contiene bibliografía).
- **`<nombre-del-archivo>.tex`**: Reemplaza `<nombre-del-archivo>` con el nombre de tu archivo `.tex` que deseas compilar. Por ejemplo, si tu archivo es `mi-libro.tex`, el comando sería:

  ```bash
  latexmk -pdf -interaction=nonstopmode -synctex=1 -bibtex mi-libro.tex
  ```

Este comando ejecutará el proceso de compilación y generará el archivo PDF correspondiente. Si hay referencias bibliográficas, `bibtex` se encargará de procesarlas.

### 2. **Compilación automática en VSCode**

Si tienes configurada la compilación automática en VSCode, cada vez que guardes tu archivo `.tex`, el proyecto se compilará automáticamente sin necesidad de ejecutar el comando manualmente. Esta opción se configura con el siguiente parámetro en el archivo `settings.json`:

```json
"latex-workshop.latex.autoBuild.run": "onFileChange"
```

Con esta configuración, cada vez que realices un cambio y guardes el archivo, VSCode ejecutará automáticamente la compilación.

### 3. **Atajos de teclado para compilar en VSCode**

Si prefieres compilar manualmente en VSCode, puedes usar el siguiente atajo de teclado:
- **Windows/Linux**: `Ctrl + Alt + B`
- **Mac**: `Cmd + Option + B`

Este atajo ejecutará el comando de compilación utilizando la configuración de `latexmk` que hayas definido en `settings.json`.

### 4. **Resumen del flujo de trabajo**

- **Compilación manual**: Utiliza el comando `latexmk -pdf -interaction=nonstopmode -synctex=1 -bibtex <nombre-del-archivo>.tex` en la terminal para compilar el archivo.
- **Compilación automática**: Si has habilitado la compilación automática en VSCode, la compilación se ejecutará cada vez que guardes el archivo.
- **Compilación con atajo de teclado**: Usa `Ctrl + Alt + B` (Windows/Linux) o `Cmd + Option + B` (Mac) para compilar manualmente desde VSCode.

Con estas configuraciones, tu entorno de trabajo para LaTeX en VSCode estará listo para una compilación eficiente y automatizada.
