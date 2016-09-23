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

% if the user selects draft, then this class AND any packages will go into draft mode.
\newif\ifFS@draftversion\FS@draftversionfalse

% define superclass
\def\FS@scr@class{scrreprt}

% process the options
\DeclareOptionX<\@currname>{draft}{%
	\FS@draftversiontrue}

%\DeclareOptionX*{%
%	\ClassInfo{\@currname}{Unknown option '\CurrentOption`. Pass to scrrprt class.}
%	\PassOptionsToClass{\CurrentOption}{\FS@scr@class}}

\ProcessOptionsX<\@currname>
%\let\@classoptionslist\relax

% load the KOMA class
\PassOptionsToClass{\FS@scr@options}{\FS@scr@class}
\LoadClass{\FS@scr@class}

\ifFS@draftversion
	% if in draft mode then set debugging commands
	\overfullrule=2cm % add black bar where paragraph is too wide
	\tracinggroups=1
\fi

% set left margin to 5cm and right margin to 1cm
\ifFS@draftversion
	% if in draft mode then set option showframe
	\RequirePackage[a4paper,left=5cm,right=1cm,showframe]{geometry}
\else
	\RequirePackage[a4paper,left=5cm,right=1cm]{geometry}
\fi

% put notes on the left and set the margin to the 5cm given above as argument to geometry
\reversemarginpar
\setlength\marginparwidth{4cm}

\def\FS@thesis@type{Master's Thesis}
\RequirePackage{fsthesis_title}

% use Times New Roman as font
\RequirePackage{mathptmx}
\RequirePackage[scaled=.90]{helvet}
\RequirePackage{courier}
\DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n}

% no indentation in first line of paragraph
\setlength{\parindent}{0cm} 

% set depth of TOC to three levels
\setcounter{tocdepth}{2}

% add penalties for widows and orphans
\clubpenalty = 10000
\widowpenalty = 10000
\displaywidowpenalty = 10000

\newcommand*{\signaturedate}[2]{%
		\par\noindent\makebox[\columnwidth]{ \rule{\columnwidth}{1pt} }
		\par\noindent\makebox[\columnwidth]{ \makebox[.5\columnwidth][l]{ #1 } \makebox[.5\columnwidth][l]{ #2 } }
}%

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
			{\textbf{Statement of Certification}}%
		}\par
		\raggedright
		\vspace*{3cm}%
		I hereby confirm that this thesis constitutes my own work, produced without aid and support from persons and/or materials other than the ones listed. Quotation marks indicate direct language from another author. Appropriate credit is given where I have used ideas, expressions or text from another public or non-public source.\par%
		The paper in this or similar form has never been submitted as an assessed piece of work in or outside of Germany. It also has not yet been published.\par%
		\vspace*{4cm}%
		\signaturedate{City, Date}{Author's Signature}%
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