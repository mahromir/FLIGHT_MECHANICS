\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sprawozdanie}

\LoadClass[9pt, twoside]{article}
\RequirePackage{lmodern}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphics}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{hyperref}

\RequirePackage[inner=3cm,outer=2cm, top = 3cm, bottom = 3cm]{geometry}

\RequirePackage{fancyhdr}
\RequirePackage{multirow}
\RequirePackage{placeins}

\RequirePackage{appendix}
\RequirePackage{rotating}
\RequirePackage{fourier}
\RequirePackage{amsmath}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{tabularray}
\RequirePackage{caption}
\RequirePackage{adjustbox}
\RequirePackage{subfig}
\RequirePackage{float}
\RequirePackage{subcaption}
\RequirePackage{fancybox}


\usetikzlibrary{calc}

\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\newcommand{\class}[1]{\gdef\@class{#1}}%
\newcommand{\@class}{\@latex@warning@no@line{No \noexpand\class given}}

\newcommand{\projectName}[1]{\gdef\@projectName{#1}}%
\newcommand{\@projectName}{\@latex@warning@no@line{No \noexpand\projectName given}}

%\newcommand{\indeks}[1]{\gdef\@indeks{#1}}%
%\newcommand{\@indeks}{\@latex@warning@no@line{No \noexpand\indeks given}}

\newcommand{\deadline}[1]{\gdef\@deadline{Data oddania: \textbf{#1}}}%
\newcommand{\@deadline}{\@latex@warning@no@line{No \noexpand\deadline given}}

\newcommand{\instructor}[1]{\gdef\@instructor{Prowadzący: #1}}%
\newcommand{\@instructor}{\@latex@warning@no@line{No \noexpand\instructor given}}

\newcommand{\facultyName}[1]{\gdef\@facultyName{#1}}%
\newcommand{\@facultyName}{\@latex@warning@no@line{No \noexpand\facultyName given}}



\renewcommand{\maketitle}{

  \begin{titlepage}
    
        \begin{center}
        %   \begin{tikzpicture}[remember picture, overlay]
        %     \draw[line width = 1pt] ($(current page.north west) + (2cm, 2cm)$) rectangle ($(current page.south east) + (2cm,2cm)$);
        %   \end{tikzpicture}
        
              
        % Upper part of the page
        \begin{flushright}
            \textsc{\Large \@author}\\ [0.1cm]
            \textsc{\Large \@class}\\ [0.1cm]
            \textsc{\Large Cessna 150m}\\ [0.1cm]
            \textsc{\Large \@instructor}\\[0.1cm]
            \textsc{\Large wtorek 14:15-16:00}\\[0.1cm]
        
        \end{flushright}
        
        \vspace*{5cm}
        
        % Title
        % \HRule \\[0.4cm]
        { \huge \bfseries \@projectName}\\[0.4cm]
        { \huge \bfseries \@title}\\[0.4cm]    
        
        \vfill
        \flushleft
        \textsc{\Large Data oddania projektu: } \hfill  \textsc{\Large Ocena: ...............}
        \textsc{\Large ..........................} 

        \end{center}
        \end{titlepage}
    
}

\pagestyle{fancy}
\fancyhf{}
\fancyhf[EHC]{\@facultyName}
\fancyhf[OHC]{\@author  \@projectName - \@title}
\fancyfoot[LE,RO]{\thepage}



\endinput