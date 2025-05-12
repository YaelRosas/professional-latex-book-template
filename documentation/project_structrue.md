El objetivo de esta estructura es permitir la adición o eliminación de secciones según sea necesario. Además, los paquetes en styles/.sty y .cls están organizados de manera consistente con esta estructura, facilitando las modificaciones cuando se requieran.

proyect-latex/  
├── build/
│   ├── main.pdf
│   ├── archivos_auxiliares_de_compilacion
│   └── ...
│
├── documentation/
│   ├── manual_compliation.md
│   └── script_ctex_compilation.md
│
├── images/
│   ├── portada.jpg
│   ├── adorno.png
│   └── ...
│
├── styles/
│   ├── proyecto.cls
│   └── custom-style.sty
│
├── tex
│   ├─01-Partes_preliminares
│   │  ├─01-cover.tex
│   │  ├─02-halftitle.tex
│   │  ├─03-copyright.tex
│   │  ├─04-dedication.tex
│   │  ├─05-acknowledgements.te
│   │  ├─06-epigraph.tex
│   │  ├─07-foreword.tex
│   │  ├─08-preface.tex
│   │  ├─09-contributors.tex
│   │  └─10-notas_del_autor.tex
│   │
│   ├─02-Cuerpo
│   │  ├─00-introduccion.tex
│   │  ├─01-capituo_ejemplos.tex
│   │  └─99-epilogue.tex
│   │
│   ├─01-references.bib
│   │  ├─00-introduccion.tex
│   │  ├─01-capitulo_ejemplos.tex
│   │  └─99-epilogo.tex
│   │
│   └─03-Material de referencia
│      ├─01-references.bib
│      ├─02-definicion_glosarios.tex
│      ├─03-definicion_apendices.tex
│      └─04-colophon.tex
│
├── lience.md
├── main.tex
└── ctex.sh (script_de_compilacion) 