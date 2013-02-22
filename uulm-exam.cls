\ProvidesClass{uulm-exam}[2013/02/21 Klausur LaTeX Klasse der Uni Ulm]

\LoadClass[11pt,a4paper,oneside,titlepage]{article}

\RequirePackage{geometry}
\geometry{top=2.5cm,left=2.3cm,right=2.3cm,bottom=2cm}
% \marginparsep3mm
% packages
\RequirePackage{ngerman}
\RequirePackage[utf8]{inputenc}
\RequirePackage{epsf}
\RequirePackage{array}
\RequirePackage{listings}
\RequirePackage{alltt}
\RequirePackage{amssymb}
\RequirePackage{latexsym}
\RequirePackage{setspace}
\RequirePackage{bold-extra}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{listings}
\RequirePackage{fancyhdr}
\RequirePackage{textcomp}
\RequirePackage{longtable}
\RequirePackage{enumerate}
\RequirePackage{amsmath}
\RequirePackage{totcount}
\RequirePackage{refcount}
\RequirePackage{xargs}
\RequirePackage{enumitem}

\RequirePackage{forloop}
\RequirePackage{ifthen}
\RequirePackage{suffix}
\RequirePackage{totpages}

% sans serif font (computer modern bright)
%\RequirePackage{cmbright}

\definecolor{middlegray}{rgb}{0.5,0.5,0.5}
\definecolor{lightgray}{rgb}{0.8,0.8,0.8}

% settings for code listings
\lstset{
	language=JAVA,
	basicstyle=\tt\small,
	keywordstyle=\bfseries,
	stringstyle=\ttfamily,
	commentstyle=\color{middlegray},
	showstringspaces=false,
	flexiblecolumns=false,
	tabsize=2,
	numbers=left,
	numberstyle=\footnotesize,
	stepnumber=1,
	numbersep=10pt,
	xleftmargin=15pt,
	basewidth=0.205cm,
	frame=none
}

% layout
\setlength{\parindent}{0cm}
\setlength{\parskip}{1ex}
\setlength{\headheight}{14pt}

% labels, enumerations
\renewcommand{\labelenumi}{\alph{enumi})}
% \renewcommand{\labelenumii}{\alph{enumii})}
\renewcommand{\labelenumii}{\arabic{enumii}.}
\renewcommand{\labelenumiii}{\arabic{enumiii})}

% running headers
\pagestyle{fancy}
\fancyhead{\sffamily\fontsize{10pt}{10pt}\selectfont\@title \hfill \@date}% delete the default header
% \fancyfoot{}% delete the default footer
% page numbers
\fancyfoot[C]{\hspace*{1.8cm}\sffamily\fontsize{10pt}{10pt}\selectfont\thepage/\ref{TotPages}}
% header for assignment sheets
%\lhead{NAME, Vorname: \hfill Matrikel-Nr.: \hspace*{5em}}
%\rfoot{}

% define assignment points
\newtotcounter{totalpoints}
\newcommand\gettotalpoints{\total{totalpoints}}
\newcommand\gettotalassignments{\total{assignment}}

% get points of one assignment
\newcommand\getpoints[1]{\number\numexpr\getrefnumber{pointsref@#1}-1\relax}

% define subpoints
\newcommand\subpoints[1]{\hspace*{\fill}\emph{(#1\,P)\hspace*{0.0em}}%
\addtocounter{subpoints}{#1}
\addtocounter{totalpoints}{#1}
\marginpar{~~%
\begin{picture}(30,18)(0,5)%
\framebox(30,18){}%
\end{picture}%
}}

% modify subpoints counter without displaying a box
\WithSuffix\newcommand\subpoints*[1]{\addtocounter{subpoints}{#1}
\addtocounter{totalpoints}{#1}
}

\newlist{hintslist}{itemize}{55}
\setlist[hintslist]{label=--,leftmargin=*,noitemsep,topsep=0pt}

\newsavebox{\hintsbox}
\sbox{\hintsbox}{\null\hspace*{0.45\textwidth}}
\newenvironment{hints}{%
\lrbox\hintsbox
\begin{minipage}[t]{0.475\textwidth}
}{%
\end{minipage}
\endlrbox
}

\newsavebox{\toolsbox}
\sbox{\toolsbox}{}
\newenvironment{tools}{%
\lrbox\toolsbox
\begin{minipage}{\textwidth}
\textbf{Erlaubte Hilfsmittel:}
\par
}{%
\end{minipage}
\endlrbox
}

% Korrekturtabelle
\newcommand\makegradetable{%
	\newcounter{tab}
	\newcounter{nums}
	\setcounter{nums}{\totvalue{assignment}}\addtocounter{nums}{1}
	\begin{center}
		\begin{tabular}{|l *{\thenums}{|c}|}
			\hline
			\small Aufgabe & \forloop{tab}{1}{\value{tab} < \thenums}{{\thetab} &}
			\hspace*{-0.1cm}$\sum$\\
			\hline
			\small Punkte & \forloop{tab}{1}{\value{tab} < \thenums}{{\small\getpoints{\thetab}} &}{\small\gettotalpoints}\\
			\hline
			\small Erreicht & \forloop{tab}{1}{\value{tab} < \thenums}{\hspace*{0.55cm} &} \hspace*{0.8cm}\parbox[0pt][2em][c]{0cm}{} \\
			\hline
			\small Zeichen & \forloop{tab}{1}{\value{tab} < \thenums}{&} \parbox[0pt][2em][c]{0cm}{}\\
			\noalign{\hrule height 1pt}
			& \forloop{tab}{1}{\value{tab} < \thenums}{&} \parbox[0pt][2em][c]{0cm}{}\\
			\hline
			& \forloop{tab}{1}{\value{tab} < \thenums}{&} \parbox[0pt][2em][c]{0cm}{}\\
			\hline
		\end{tabular}
	\end{center}
}

% title page
\xdef\@institute{}
\xdef\@examiner{}
\xdef\@duration{}
\newcommand\institute[1]{\xdef\@institute{#1}}
\newcommand\examiner[1]{\xdef\@examiner{#1}}
\newcommand\duration[1]{\xdef\@duration{#1}}
\newcommand\advices[1]{#1}
%booleans to alter title page
\newboolean{showcodeword}
\newboolean{showbonus}

\renewcommand\maketitle{%
\begin{titlepage}
	\thispagestyle{empty}
	% \addtolength{\voffset}{-15mm}

	\definecolor{dunkelgrau}{rgb}{0.7,0.7,0.7}
	\definecolor{hellgrau}{rgb}{0.85,0.85,0.85}
	\definecolor{rahmengrau}{rgb}{0.8,0.8,0.8}

	\vspace*{-1.5cm}
	\includegraphics[height=1.5cm]{uulmlogo-coa}
	\hfill%\hspace*{1em}
	\includegraphics[height=1.5cm]{uulmlogo-text}

% 	\vspace{-1.0cm}
	\small
	\begin{center}
		\Large{Klausur \textbf{\@title}}
	\end{center}

	\colorbox{hellgrau}{
		\begin{minipage}{\textwidth-1em}
			\begin{tabular}{llll}
				Datum und Uhrzeit: & \@date & Bearbeitungszeit: & \@duration \\
				Institut: & \@institute & Prüfer: & \@examiner \\
			\end{tabular}
		\end{minipage}
	}

	\colorbox{hellgrau}{
		\begin{minipage}{\textwidth-1em}
			\vspace*{0.1cm}
			\textbf{Vom Prüfungsteilnehmer auszufüllen:}
			\vspace*{0.2cm}

			\renewcommand{\arraystretch}{2.2}
			\setlength{\aboverulesep}{-7pt}
			\setlength{\belowrulesep}{0pt}

			{\setlength{\tabcolsep}{0pt}
			\begin{tabular}{lp{5.2cm}p{1ex}lp{4.2cm}p{1ex}l}
				Name: &   & & Vorname: &  & & \cellcolor{dunkelgrau} Matrikelnummer:~ \\
				\cmidrule(l){2-2}\cmidrule(l){5-5}
				Studiengang: & &  & Abschluss: & & & \cellcolor{dunkelgrau} \\
				\cmidrule(l){2-2}\cmidrule(l){5-5}\cmidrule(lr){7-7}
			\end{tabular}
			}%tabcolsep

			\vspace*{1.5em}
			Hiermit erkläre ich, dass ich prüfungsfähig bin. Sollte ich nicht
			auf der Liste der angemeldeten Studierenden aufgeführt sein, dann 
			nehme ich hiermit zur Kenntnis, dass diese Prüfung nicht gewertet
			werden wird.

			\vspace{2.5em}
			\renewcommand{\arraystretch}{1}
			\ifthenelse{\boolean{showcodeword}}%
			{\begin{tabular*}{.9\textwidth}{lll}
				\hspace{.4\textwidth}& \hspace{.1\textwidth} & \hspace{.4\textwidth} \\
				\cmidrule{1-1} \cmidrule(l){3-3}
				\footnotesize{Unterschrift des Prüfungsteilnehmers}  & & \footnotesize{Optionales Codewort für den Aushang} \\
			\end{tabular*}			
			}{%
			\begin{tabular*}{.9\textwidth}{l}
				\hspace{.4\textwidth}\\
				\cmidrule{1-1} %\cmidrule(l){3-3}
				\footnotesize{Unterschrift des Prüfungsteilnehmers} \\
			\end{tabular*}
			}
		\end{minipage}
	}
	\vfill
	\normalsize\textbf{Hinweise zur Prüfung:}
	\par
	\usebox{\hintsbox}
	\hfill
	\setlength{\fboxrule}{0.5pt}
	\setlength{\fboxsep}{7pt}
	\fcolorbox{rahmengrau}{white}{
	\begin{minipage}[t]{75mm}
		\centering
		Barcode
		\vspace*{45mm}
	\end{minipage}}
	\vfill
	\usebox{\toolsbox}
	\vfill
	\colorbox{hellgrau}{
		\begin{minipage}{\textwidth-2em}
			\textbf{Vom Prüfer auszufüllen:}

			\ifthenelse{\totvalue{totalpoints} > 0}{
			\makegradetable
			}{
			\vspace{1ex}
			\colorbox{red}{\textbf{Neu kompilieren, um Korrekturtabelle anzuzeigen!}}
			\vspace{1ex}
			}

			\vspace*{0.4cm}
			\renewcommand{\arraystretch}{0.5}
			%Make whole table conditional as cmidrule and the colum definition dont handle ifthenelse properly
			\ifthenelse{\boolean{showbonus}}%
			{ \begin{tabular}{l l p{.15\textwidth} p{.1\textwidth} p{.30\textwidth}}
				\textbf {Bonus: $\square$ ja / $\square$ nein} & \textbf{Note:} & & & \\
				\cmidrule(l){3-3} \cmidrule(lr){5-5}
				& & & & \footnotesize Unterschrift \@examiner \\
			\end{tabular} 
			}{%
			\begin{tabular}{l p{.1\textwidth} p{.4\textwidth} p{.3\textwidth}}
				\textbf{Note:} & & &  \\
				\cmidrule(l){2-2}\cmidrule(lr){4-4}
				& & & \footnotesize Unterschrift \@examiner \\
			\end{tabular}
			}
		\end{minipage}
	}
\end{titlepage}
	\newpage
}

% \newcommand\setpoints[2]{%
% \expandafter\def\csname points@#1 \endcsname{#2}%
% \addtocounter{totalpoints}{#2}
% }
% \newcommand\getpoints[1]{\expandafter\csname points@#1 \endcsname}

%
% \newcommand\setsubpoints[3]{%
% \expandafter\def\csname points@#1@#2 \endcsname{#3}%
% }
% \newcommand\getsubpoints[2]{\expandafter\csname points@#1@#2 \endcsname}

% Assignments
\newtotcounter{assignment}
\newcounter{subpoints}[assignment]

\newcommand{\assignment}[1]{%
\cleardoublepage
% save subpoints of last assignment
\refstepcounter{subpoints}\label{pointsref@\theassignment}%
\refstepcounter{assignment}%
\vspace*{0ex}{\Large\textbf{Aufgabe \arabic{assignment}:}~\textbf{#1}}\hfill\emph{(\getpoints{\theassignment}\,Punkte)}%
\marginpar{~~%
\begin{picture}(30,18)(0,5)%
\framebox(30,18){}%
\end{picture}%
}}

\newenvironment{assignments}{
% ausser Titelseite sind alle Seiten nach links versetzt
\addtolength{\hoffset}{-1cm}
}{
% notwendig, damit die Punkte der letzten Aufgabe korrekt angezeigt werden
\refstepcounter{subpoints}\label{pointsref@\theassignment}%
}

% Solutions
\newboolean{showsolutions}
\setboolean{showsolutions}{false}

% \newcommand{\checksolution}{
% % Include or exclude solutions
% \specialcomment{solution}{\begingroup\color{red}\textbf{Lösung}\ }{\endgroup}%
% \specialcomment{newpagesolution}{\newpage\begingroup\color{red}\textbf{Lösung}\ }{\endgroup}%
% %
% \ifthenelse{\boolean{showsolutions}}{}{\excludecomment{solution}\excludecomment{newpagesolution}}%
% }

\newcounter{solutionlines}
\def\@drawlines{false}
\newsavebox{\solutionbox}
\newenvironmentx{solution}[2][2=true]{
\par%
\setcounter{solutionlines}{#1}
\def\@drawlines{#2}
\begin{lrbox}{\solutionbox}
\begin{minipage}{.9\textwidth}
\color{red}\textbf{Lösung:}
\par
}{
\end{minipage}
\end{lrbox}
\ifthenelse{\boolean{showsolutions}}{%
\fbox{%
\usebox{\solutionbox}
}
}{%showsolutions off
\ifthenelse{\equal{\@drawlines}{true}}{
\insertlines{\thesolutionlines}
}{%else
\answerspace{\thesolutionlines}
}%ifthen
}%ifthen
}%environment


% Zusatzblaetter
\xdef\@identifier{UNI ULM}
\newcommand\identifier[1]{\xdef\@identifier{#1}}

\newcommand\makeemptysheet{%
%\fancyfoot{}
\vspace*{1ex}
\raggedright\textbf{Zusatzblatt zu Aufgabe \rule{2em}{0.5pt}:}
\vfill
\raggedleft\bfseries{\Huge\color{lightgray}\rotatebox{45}{\@identifier}}
\newpage
}

% Antworträume

%% Linien
\newcounter{lines}%

\newcommand{\insertlines}[1]{%
\definecolor{line}{gray}{0.5}
\ \vspace{1em}
\forloop{lines}{0}{\value{lines} < #1}{%
    \ \vspace{.2em}\\%
	\textcolor{line}{\rule{\linewidth}{0.4pt}}%
}
\ \vspace{.3em} \\
}

\newcommand{\answerspace}[1]{%
\ \vspace{1em}
\forloop{lines}{0}{\value{lines} < #1}{%
    \ \vspace{1.2em}\\%
}
\ \vspace{.3em} \\
}
