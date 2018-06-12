%Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{isnotes} [2016/06/08 Example LaTex class]

%preliminary declaration
\newcommand{\headlinecolor}{\color{slcolor}}
\LoadClass{report}

\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage[newfloat]{minted}
\usemintedstyle{borland}
\RequirePackage[left=2cm, right=5cm, top=2cm]{geometry}
\definecolor{slcolor}{HTML}{882B21}
\usepackage[sfdefault,thin]{roboto}
\usepackage[familydefault,light]{Chivo}
\usepackage[T1]{fontenc}

%options

\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%More declarations

\definecolor{orange}{RGB}{230,100,50}
\newcommand*{\titlecolor}{\color{orange}}
\newcommand*{\subheadlinecolor}{\color{orange}}
\newcommand*{\simplecolor}{\color{black}}
\newcommand*{\caja}[1]{
	\medskip
	\newline
	\noindent\fbox {\parbox{\textwidth}{\vspace{0.3cm}#1\vspace{0.3cm}}}
	\newline
	\medskip
}

\newminted[cppcode]{cpp} {
	breaklines,
	linenos,
	tabsize = 2
}

\newminted[javacode]{cpp} {
	breaklines
}

\newminted[makecode]{makefile} {
	breaklines,
	linenos
}

\newminted[consolecode]{bash} {
	breaklines
} 

\let\endtitlepage\relax
\newcommand*{\professor}[1]{\gdef\@professor{#1}}
\newcommand*{\@professor}{\texttt{\string\professor} currently not set. Please fix this.}
\newcommand*{\classname}[1]{\gdef\@classname{#1}}
\newcommand*{\@classname}{\texttt{\string\classname} not set yet}

\renewcommand{\maketitle}{
\begin{titlepage}
	{\raggedright\includegraphics[width=4cm]{./resources/logos-UNAH-11}\par}
	\raggedleft
	\fontsize{8}{60}\fontfamily{phv}\color{gray}\fontseries{ul}{\large\@classname\unskip\strut\par}
	\fontsize{8}{60}\fontfamily{roboto}\titlecolor\fontseries{b}{\Huge\bfseries\@title\unskip\strut\par}%
	\fontsize{8}{60}\fontfamily{phv}\color{gray}\fontseries{b}{\large\@professor\unskip\strut\par}
	\fontseries{m}{\large \@date\par}
	\vspace{1.5cm}
\end{titlepage}
}

\renewcommand{\section}{%
	\@startsection
	{section}{1}{0pt}{-1.5ex plus -1ex minus -.2ex}{1ex plus .2ex}
	{\large\fontfamily{phv}\headlinecolor}%
}

\renewcommand{\subsection}{%
	\@startsection
	{subsection}{2}{0pt}{-1.5ex plus -1ex minus -.2ex}{1ex plus .2ex}
	{\small\fontfamily{phv}\subheadlinecolor}%
}

\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
\setlength{\textwidth}{17.5cm}
\setlength{\textheight}{22cm}
\setcounter{secnumdepth}{0}