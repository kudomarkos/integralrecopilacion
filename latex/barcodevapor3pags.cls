\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{barcodevapor3pags}[2026/10/23 Clase para Barco de Vapor]

\LoadClass[20pt]{extarticle}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{lettrine}
\RequirePackage{xparse}
\RequirePackage{eso-pic}
\RequirePackage{pgfpages}
\RequirePackage[
  pdfpagemode=FullScreen,
  pdfstartview=Fit
]{hyperref}

\geometry{
  paperwidth=640px,
  paperheight=1080px,
  top=0.9cm,
  left=0.9cm,
  right=0.9cm,
  bottom=0.5cm,
  includefoot,
  footskip=0.4cm,
  marginparwidth=0pt,
  marginparsep=0pt
}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5em}

\pgfpagesdeclarelayout{tres en una}
{}
{
  \pgfpagesphysicalpageoptions{
    logical pages=3,
    physical width=1920px,
    physical height=1080px
  }

  \pgfpageslogicalpageoptions{1}{
    resized width=640px,
    resized height=1080px,
    center=\pgfpoint{320px}{540px}
  }
  \pgfpageslogicalpageoptions{2}{
    resized width=640px,
    resized height=1080px,
    center=\pgfpoint{960px}{540px}
  }
  \pgfpageslogicalpageoptions{3}{
    resized width=640px,
    resized height=1080px,
    center=\pgfpoint{1600px}{540px}
  }
}

\pgfpagesuselayout{tres en una}



\newcounter{capitulo}
\renewcommand{\thecapitulo}{\Roman{capitulo}}

\newcommand{\capitulo}{%
  \clearpage
  \par
  \refstepcounter{capitulo}%
  \noindent\makebox[\linewidth][c]{\textbf{Capítulo \thecapitulo}}\par
}
\newcommand{\capituloN}[1]{%
  \clearpage
  \par
  \refstepcounter{capitulo}%
  \noindent\makebox[\linewidth][c]{\textbf{Capítulo \thecapitulo: #1}}\par
}
\newcommand{\directorioimagenes}{.}
\newcommand{\directorio}[1]{\renewcommand{\directorioimagenes}{#1}}
\newcommand{\miImage}[1]{%
  \clearpage
  \thispagestyle{empty}%
  \AddToShipoutPictureBG*{%
    \AtPageLowerLeft{%
      \includegraphics[
        width=\paperwidth,
        height=\paperheight
      ]{\directorioimagenes/#1}%
    }%
  }%
  \null
  \clearpage
}

\newcommand{\miImagenNormal}[2][]{%
  \includegraphics[#1]{\directorioimagenes/#2}%
}


\usepackage{wrapfig}

% Comando para insertar letra capitular automática
\newcommand{\insertarLetraFF}[1]{%
  % 1. Calculamos la altura de 3 líneas
  \def\altoLetra{3\baselineskip}%
  % 2. Usamos la imagen para "medir" su propio ancho basándose en esa altura
  \setbox0=\hbox{\includegraphics[height=\altoLetra]{\directorioimagenes/#1}}%
  % 3. Usamos el ancho de esa caja (\wd0) para el wrapfigure
  \begin{wrapfigure}{l}{\wd0}
    \centering
\includegraphics[height=3em]{\directorioimagenes/#1}
  \end{wrapfigure}
}

% Uso con lineas y altura opcional:
% \insertarLetra[líneas][altura]{imagen}{texto inicial}
\NewDocumentCommand{\insertarLetra}{O{3} O{80pt} m m}{%
  \lettrine[
    lines=#1,
    lraise=0,
    loversize=0,
    findent=0pt,
    nindent=0pt
  ]{%
    \includegraphics[
      height=#2
    ]{\directorioimagenes/#3}%
  }{#4}%
}
