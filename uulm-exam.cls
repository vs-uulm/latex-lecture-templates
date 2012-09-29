\ProvidesClass{uulm-exam}[2012/07/16 Klausur LaTeX Klasse der Uni Ulm]

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

\newsavebox{\hintsbox}
\sbox{\hintsbox}{\null\hspace*{0.45\textwidth}}
\newenvironment{hints}{%
\lrbox\hintsbox
\begin{minipage}{0.45\textwidth}
\vspace*{0.3cm}
\textbf{Hinweise zur Prüfung:}
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

	\ifthenelse{\totvalue{assignment} < 10}{% normal size table
		\begin{center}
			\begin{tabular}{|c *{\thenums}{|c}|}
				\hline
				\small Aufg. & \forloop{tab}{1}{\value{tab} < \thenums}{{\thetab} &}
				\hspace*{-0.1cm}$\sum$\\
				\hline
				\small Punkte & \forloop{tab}{1}{\value{tab} < \thenums}{{\small\getpoints{\thetab}} &}{\small\gettotalpoints}\\
				\hline
				\small Punkte & \forloop{tab}{1}{\value{tab} < \thenums}{\hspace*{0.8cm} &} \hspace*{0.8cm}\parbox[0pt][2em][c]{0cm}{} \\
				\hline
				\small Zeichen & \forloop{tab}{1}{\value{tab} < \thenums}{&} \parbox[0pt][2em][c]{0cm}{}\\
				\hline
				& \forloop{tab}{1}{\value{tab} < \thenums}{&} \parbox[0pt][2em][c]{0cm}{}\\
				\hline
				& \forloop{tab}{1}{\value{tab} < \thenums}{&} \parbox[0pt][2em][c]{0cm}{}\\
				\hline
			\end{tabular}
		\end{center}
	}{ % compact size table
		\begin{center}
			\begin{tabular}{|c *{\thenums}{|c}|}
				\hline
				Aufg. & \forloop{tab}{1}{\value{tab} < \thenums}{{\small \thetab} &}
				\small \hspace*{-0.1cm}$\sum$\\
				\hline
				Pkte & \forloop{tab}{1}{\value{tab} < \thenums}{{\small\getpoints{\thetab}} &}{\small\gettotalpoints}\\
				\hline
				Pkte & \forloop{tab}{1}{\value{tab} < \thenums}{\hspace*{0.5cm} &} \hspace*{0.5cm}\parbox[0pt][2em][c]{0cm}{} \\
				\hline
				\small Zeichen & \forloop{tab}{1}{\value{tab} < \thenums}{&} \parbox[0pt][2em][c]{0cm}{}\\
				\hline
				& \forloop{tab}{1}{\value{tab} < \thenums}{&} \parbox[0pt][2em][c]{0cm}{}\\
				\hline
				& \forloop{tab}{1}{\value{tab} < \thenums}{&}
				\parbox[0pt][2em][c]{0cm}{}\\
				\hline
			\end{tabular}
		\end{center}
	}
% \renewcommand{\arraystretch}{\old@arraystretch}
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
% 			\begin{center}
% 				Name der Prüfung: \textbf{\@title}
% 			\end{center}
% 
% 			\renewcommand{\arraystretch}{1.5}
			%\setlength{\tabcolsep}{10pt}

			\begin{tabular}{llll}
				Datum und Uhrzeit: & \@date & Bearbeitungszeit: & \@duration \\
				Institut: & \@institute & Prüfer: & \@examiner \\
			\end{tabular}
		\end{minipage}
	}

	\colorbox{hellgrau}{
		\begin{minipage}{\textwidth-1em}
			\textbf{Vom Prüfungsteilnehmer auszufüllen:}
			\vspace*{0.2cm}

			\renewcommand{\arraystretch}{2.2}
			\setlength{\aboverulesep}{-7pt}
			\setlength{\belowrulesep}{0pt}

			\begin{tabular}{lp{.2\textwidth}lp{.2\textwidth}p{.05\textwidth}l}
				Name: &  & Vorname: &  & & \cellcolor{dunkelgrau} Matrikelnummer: \\
				\cmidrule(l){2-2}\cmidrule(l){4-4}
				Studiengang: &  & Abschluss: & & & \cellcolor{dunkelgrau} \\
				\cmidrule(l){2-2}\cmidrule(l){4-4}\cmidrule(lr){6-6}
			\end{tabular}

% 			\begin{minipage}{.5\textwidth}
% 				\vspace*{1.0cm}
% 				\hrule
% 				\vspace*{0.1cm}
% 				\tiny Datum, Unterschrift des Prüfungsteilnehmers
% 			\end{minipage}
			
			\vspace{1em}
			\ifthenelse{\boolean{showcodeword}}%
			{\begin{tabular*}{.9\textwidth}{lll}
				\hspace{.4\textwidth}& \hspace{.1\textwidth} & \hspace{.4\textwidth} \\
				\cmidrule(l){1-1} \cmidrule(l){3-3}
				\footnotesize{Datum, Unterschrift des Prüfungsteilnehmers}  & & \footnotesize{Optionales Codewort für den Aushang} \\
			\end{tabular*}			
			}{%
			\begin{tabular*}{.9\textwidth}{l}
				\hspace{.4\textwidth}\\
				\cmidrule(l){1-1} %\cmidrule(l){3-3}
				\footnotesize{Datum, Unterschrift des Prüfungsteilnehmers} \\
			\end{tabular*}
			}

			\vspace*{0.3cm}
			Hiermit erkläre ich, dass ich prüfungsfähig bin. Sollte ich nicht auf der Liste
			der angemeldeten Studierenden aufgeführt sein, dann nehme ich hiermit zur
			Kenntnis, dass diese Prüfung nicht gewertet werden wird.

		\end{minipage}
	}

	\usebox{\hintsbox}
	\hspace*{0.53cm}
	\setlength{\fboxrule}{0.5pt}
	\setlength{\fboxsep}{7pt}
	\fcolorbox{rahmengrau}{white}{
	\begin{minipage}[c]{0.47\textwidth}
		\centering
		Barcode
		\vspace*{6cm}
	\end{minipage}}

	\vspace*{0.3cm}

	\textbf{Erlaubte Hilfsmittel:}

	\begin{itemize}
		\item Ein beidseitig handbeschriebenes DIN-A4-Blatt \hspace*{5cm} \textbf{Viel
		Erfolg!}
	\end{itemize}

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
			{ \begin{tabular}{l p{.1\textwidth} l  p{.15\textwidth} p{.30\textwidth}}
				\textbf{Note:} & & \textbf {Bonus: ja / nein}  & &  \\
				\cmidrule(l){2-2} \cmidrule(lr){5-5}
				& & & & \tiny Unterschrift \@examiner \\
			\end{tabular} 
			}{%
			\begin{tabular}{l p{.1\textwidth} p{.1\textwidth} p{.2\textwidth}}
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
\vspace*{0ex}\textbf{Aufgabe \arabic{assignment}:}~\textbf{#1}\hfill\emph{(\getpoints{\theassignment}\,Punkte)}%
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
% \definecolor{line}{gray}{0.5}
\ \vspace{1em}
\forloop{lines}{0}{\value{lines} < #1}{%
    \ \vspace{1.2em}\\%
}
\ \vspace{.3em} \\
}

% \newcommand\answerspace[1]{%
% \ifthenelse{\boolean{showsolutions}}{}{%
% \par\nobreak\vspace{1em}
% \begin{minipage}{0.9\textwidth}
% \null\hfill\vspace*{#1\baselineskip}
% \end{minipage}%
% \par\vspace{1em}%
% }% end else
% }
