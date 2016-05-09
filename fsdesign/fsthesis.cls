\def\classversion{1.0}
\def\classdate{2016/04/30}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fsthesis}
 [\classdate\space\classversion\space Frankfurt School of Finance and Management design]

\RequirePackage{xkeyval}
\RequirePackage{ifthen}

\let\FS@scr@options\@empty
\newcommand{\FS@scr@addoptions}[1]{%
	\ifx\FS@scr@options\@empty\edef\FS@scr@options{#1}\else\edef\FS@scr@options{\FS@scr@options,#1}\fi%
}

% define superclass
\def\FS@scr@class{scrreprt}

% process the options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\FS@scr@class}}
\ProcessOptions \relax

% load the KOMA class
\LoadClass{\FS@scr@class}

% set left margin to 5cm and right margin to 1cm
\RequirePackage[a4paper,left=5cm,right=1cm,showframe]{geometry}

\def\FS@thesis@type{Master's Thesis}
\RequirePackage{fsthesis_title}

% no indentation in first line of paragraph
\setlength{\parindent}{0cm} 

% set depth of TOC to three levels
\setcounter{tocdepth}{2}

\newcommand{\makestatementofclarification}{%
	\newlength{\@FS@tmp@baselineskip}%
	\setlength{\@FS@tmp@baselineskip}{\the\baselineskip}%
	\setlength{\baselineskip}{0.0pt}%
	\begingroup%
		\parskip=8pt%
		\thispagestyle{empty}%
		%
		\noindent%
		\raggedright%
		%
		\sffamily%
		\center{
			{\textbf Statement of Certification}%
		}\par
		\raggedright
		\vspace*{3cm}%
		I hereby confirm that this thesis constitutes my own work, produced without aid and support from persons and/or materials other than the ones listed. Quotation marks indicate direct language from another author. Appropriate credit is given where I have used ideas, expressions or text from another public or non-public source.\par%		The paper in this or similar form has never been submitted as an assessed piece of work in or outside of Germany. It also has not yet been published.\par%
		\vspace*{4cm}%
		City, Date Author's Signature%
	\setcounter{page}{-1}%
	\thispagestyle{empty}%
	\clearpage
	\endgroup
	\setlength{\baselineskip}{\@FS@tmp@baselineskip}%
	%
	\global\let\@FS@tmp@baselineskip\relax
	\global\let\@FS@tmp@baselineskip\@undefined
	%
	\@ifundefined{chapter}{\clearpage}{}
}	