% El .cls debe ser lo más neutral posible para permitir su reutilización
% La idea es definir una estructura base reutilizable para varios documentos del mismo tipo 
% en este caso librios.


% Las configuraciones están organizadas por áreas sin un orden especifico
% pero algunas opciones impactan varias secciones
% Modificar el orden de alguna seccion o paquetes puede causar errores

\NeedsTeXFormat{LaTeX2e} % verificacion de compatibilidad

% --------------------------------------------------
% 1-Carga de clase base
 \LoadClass[12pt]{book}   


% --------------------------------------------------
% 2-Carga de paquetes necesarios
 \RequirePackage{graphicx}  % Para la inclusión y manipulación de archivos de gráficos (imágenes) en el documento. Permite usar formatos como JPG, PNG, PDF, etc.
 \RequirePackage{amsthm}    % Para ampliar las capacidades matemáticas de LaTeX:
 \RequirePackage{amsmath}   % Proporciona entornos y comandos avanzados para ecuaciones y otros elementos matemáticos.
 \RequirePackage{amssymb}   % Ofrece una gran cantidad de símbolos matemáticos adicionales.
 \RequirePackage{amsfonts}   % Proporciona fuentes matemáticas adicionales.                                                               %   - amsthm: Facilita la definición de entornos para teoremas, lemas, definiciones, etc.
 \RequirePackage{mathtools} % Extiende amsmath con útiles comandos y entornos (por ejemplo, para ecuaciones numeradas solo cuando se referencian).
 \RequirePackage{arev}      % Proporciona una familia de fuentes sans-serif que a menudo complementa bien el texto principal.
 \RequirePackage{fancyhdr} % Para la personalización avanzada de los encabezados y pies de página del documento, permitiendo diferentes estilos en páginas pares e impares, inclusión de información como números de página, títulos de sección, etc.
 \RequirePackage[sfdefault]{roboto}% change font to roboto % Cambia la fuente sans-serif predeterminada del documento a la familia de fuentes Roboto. La opción [sfdefault] hace que Roboto sea la fuente sans-serif principal utilizada cuando se especifica una fuente sans-serif.
 \RequirePackage{float}    % Control sobre la ubicación de las figuras y tablas (entornos float). Permite especificar con mayor precisión dónde deben aparecer los elementos flotantes en el documento.
 \RequirePackage{caption}  % Apariencia de los títulos (captions) de figuras y tablas. Permite modificar la fuente, el tamaño, la alineación y otros aspectos de los captions.
 \RequirePackage{array}    % Extiende las capacidades del entorno tabular estándar de LaTeX, permitiendo definir nuevas formas de columnas (por ejemplo, columnas con ancho fijo y centrado automático).
 \RequirePackage{colortbl} % Permite añadir color a filas, columnas o celdas individuales dentro de tablas (en entornos tabular y array).
 \RequirePackage{longtable}% Permite crear tablas que se extienden a lo largo de varias páginas, manteniendo los encabezados y pies de página definidos. Útil para tablas de datos extensas.
 \RequirePackage{booktabs} % Proporciona reglas horizontales de alta calidad para tablas (comandos como \toprule, \midrule, \bottomrule) que mejoran la estética y legibilidad de las tablas académicas y profesionales.

% --------------------------------------------------
% 3-Opciones globales de documento
 
 \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}  % Define un manejador para cualquier opción no declarada explícitamente.
                                                             % \* significa "cualquier opción".
                                                             % \PassOptionsToClass{\CurrentOption}{book} pasa la opción actual (\CurrentOption)
                                                             % a la clase base del documento, que en este caso es 'book'.
  \ProcessOptions\relax % Ejecuta el procesamiento de todas las opciones que se hayan pasado a la clase o al paquete.
                      % \relax es un comando que no hace nada, utilizado aquí como un marcador después de procesar las opciones.
% --------------------------------------------------
% 4-Indice

 \setcounter{tocdepth}{2} % Establece la profundidad hasta la que se mostrarán las secciones en la Tabla de Contenidos (Índice).
 % {2} significa que se incluirán \part, \chapter y \section en el índice.

% --------------------------------------------------
% 5-Configuración de márgenes o página
 \RequirePackage[left=1cm,right=1cm,top=1.5cm,bottom=1.5cm]{geometry}

% --------------------------------------------------
% 6-Definición / redefinición de Comandos Estructurales
 %tuve conflictos aqui asi que lo dejo por si despues quiero redefinir otra cosa

% --------------------------------------------------
% 7-Encabezados / pies de página
 \pagestyle{fancy}  % Activar fancyhdr
 \fancyhf{}  % Limpiar encabezados y pies
 \fancyhead[L]{Encabezado izquierdo}  % Personalizar encabezado
 \fancyfoot[C]{\thepage}  % Numeración de página en el pie de página

 \RequirePackage[bottom, hang]{footmisc}
 \RequirePackage{chngcntr}
 \counterwithout{footnote}{chapter}

 \renewcommand{\footnoterule}{%
   \vspace{1mm}
   \hrule width 1.0\textwidth
   \vspace{1mm}
 }
 \renewcommand{\footnotesize}{\small}


% --------------------------------------------------
% 8-Estilo texto, Numeracion, Indice y Títulos (\section, \subsection, \paragraph, etc)

 \setcounter{secnumdepth}{3}
 
 \RequirePackage{titlesec}  % Titlesec tiene que cargarse antes que tocloft
 \RequirePackage{tocloft}
 \RequirePackage{framed}    % Formato
 \RequirePackage{mdframed}
 \RequirePackage{mathpazo}  % Paquete de fuentes (Este me gusto por que se aplica a formulas y tiene buena legibilidad) si lo modificas tambien tienes que modificar la definicion de gls (tex/03-Referencia_Configuracion/02-definicion_glosarios.tex)


 %%% Modificar el estilo de cada nivel

  % % PART
  %  \titleformat{\part}
  %  [display]
  %  {\normalfont\Huge\fontseries{sb}\selectfont\color{black}}
  %  {\partname~\thepart}
  %  {20pt}
  %  {}
  %
  % % SECTION 
  %  \titleformat{\section}
  %  [block]
  %  {\normalfont\LARGE\fontseries{sb}\selectfont\color{black}}
  %  {\textcolor{blue}{\vrule width 4pt}\hspace{0.5em}\thesection}
  %  {1em}
  %  {}
  %
  % % SUBSECTION 
  %  \titleformat{\subsection}
  %  [block]
  %  {\normalfont\Large\fontseries{sb}\selectfont\color{black}}
  %  {\thesubsection}
  %  {1em}
  %  {}
  %
  % % SUBSUBSECTION 
  %  \titleformat{\subsubsection}
  %  [block]
  %  {\normalfont\normalsize\fontseries{sb}\selectfont\color{black}}
  %  {\thesubsubsection}
  %  {1em}
  %  {}
  %
  % % PARAGRAPH 
  %  \titleformat{\paragraph}[block]
  %  {\normalfont\normalsize\itshape\fontseries{sb}\selectfont\color{black}}
  %  {}
  %  {0pt}
  %  {}
  %  
  % % SUBPARAGRAPH
  %  \titleformat{\subparagraph}[block]
  %  {\normalfont\small\itshape\fontseries{sb}\selectfont\color{gray!80!black}}
  %  {}
  %  {0pt}
  %  {}
  %                
 % Modificar el formato de las secciones en el índice
  \titleformat{\section}[block]{\normalfont\Large\bfseries}{\thesection}{1em}{}
  \titleformat{\subsection}[runin]{\normalfont\large\itshape}{\thesubsection}{1em}{}
 
 % Ajustar espacios alrededor de la tabla de contenidos
  \setlength{\cftbeforetoctitleskip}{0pt}   % Espacio antes del título "Índice"
  \setlength{\cftaftertoctitleskip}{10pt}   % Espacio después del título "Índice"
  \setlength{\cftbeforesecskip}{5pt}    % Espacio antes de las secciones en el TOC
 
 % Agregar líneas de puntos en el índice
 \renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
 % Cambiar el título de la tabla de contenidos
 \renewcommand{\contentsname}{Índice}




 %%% Cambiar el espaciado {izquierda}{espacio antes}{espacio después}

 \titlespacing*{\section}{0pt}{10pt plus 2pt minus 1pt}{5pt}
 \titlespacing*{\subsection}{0pt}{8pt plus 1pt minus 1pt}{4pt}
 \titlespacing*{\subsubsection}{0pt}{6pt plus 1pt minus 1pt}{3pt}
 \titlespacing*{\paragraph}{0pt}{4pt}{2pt}

% --------------------------------------------------
% 9-Definición de  entornos / comandos 
  %%% comandos definidos por el usuario
  \newcommand{\autor}[1]{\textsc{#1}}
  
  %%% Entornos definidos por el usuario
  \newenvironment{resumen}{\begin{quote} \itshape}{\end{quote}}  
  
  \newenvironment{custompar}{
    \begin{quote}
    \setlength{\parindent}{0pt}%
    \renewcommand{\baselinestretch}{1.2}\normalsize%
    \sffamily\bfseries\color{black}
  }{
    \end{quote}
  }


% --------------------------------------------------
% 10-Cambios en los títulos, autor, fecha (si se quiere estilo personalizado)
 \renewcommand{\maketitle}{
   \begin{center}
     \today
   \end{center}
 }

% --------------------------------------------------
% 11-Imagenes de Fondo
 \RequirePackage{wallpaper}

% --------------------------------------------------
% 12-Epígrafe
 \RequirePackage{epigraph}

% --------------------------------------------------
% 13-Glosario
 
 \RequirePackage[
  	acronym,             % habilita acrónimos
  	symbols,             % habilita símbolos
  	nonumberlist,        % no imprime números de página en el glosario
  	nogroupskip,         % no agrega espacio extra entre grupos
  	nomain,              % no crea glosario "main" si no lo usás
  	toc,                 % agrega el glosario al índice
  	section=chapter,     % imprime los glosarios como capítulos (en book)
  	style=long,          % estilo del glosario
  ]{glossaries}
 
% --------------------------------------------------
% 14-Bibliografía
 \RequirePackage[
     style=apa,
     backend=biber,
     citestyle=authortitle,  % controla el estilo de cita
     sorting=nyt,           % ordena por nombre, año, título
     doi=true,             % oculta DOI
     isbn=true,            % oculta ISBN
     url=true              % oculta URL
   ]{biblatex}
   \DeclareLanguageMapping{spanish}{spanish-apa}

   \DefineBibliographyExtras{spanish}{%
     \protected\def\mkbibnamefamily#1{\textsc{#1}} % apellidos en versalitas
   }
 

% --------------------------------------------------
% 15-Hipervínculos (cargar despues de colores para evitar conflictos)

 
 \definecolor{linkblue}{rgb}{0.0, 0.6, 0.3}
 \definecolor{urlgreen}{rgb}{0.0, 0.6, 0.3}   
 
 \definecolor{citeorange}{rgb}{1.0, 0.38, 0.28}
 \definecolor{filepurple}{rgb}{0.54, 0.17, 0.89}
 \definecolor{menu}{rgb}{1.0, 0.84, 0.0}
 \definecolor{lightseagreen}{rgb}{0.13, 0.7, 0.67}
 
 
 
 \RequirePackage[
    colorlinks=true,
    linkcolor=linkblue,
    urlcolor=urlgreen,
    citecolor=citeorange,
    filecolor=filepurple,
    menucolor=menu,
    runcolor=lightseagreen,
 ]{hyperref}
% --------------------------------------------------
% 16-Apendice y colofon
 \RequirePackage[absolute,overlay]{textpos} % Permite colocar contenido en coordenadas absolutas
 \RequirePackage{appendix}
% --------------------------------------------------
