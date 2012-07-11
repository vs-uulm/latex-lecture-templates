\ProvidesClass{klausur}[2009/12/04 Klausur LaTeX Klasse der Uni Ulm]

\LoadClass[11pt,a4paper,oneside,titlepage]{article}

\RequirePackage{geometry}
\geometry{top=2.5cm,left=2.5cm,right=2.5cm,bottom=2cm}
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

\RequirePackage{forloop}
\RequirePackage{ifthen}
\RequirePackage{suffix}

% sans serif font (computer modern bright)
\RequirePackage{cmbright}

\definecolor{middlegray}{rgb}{0.5,0.5,0.5}
\definecolor{lightgray}{rgb}{0.8,0.8,0.8}

% settings for code listings
\lstset{
	language=JAVA,
	basicstyle=\ttfamily,
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
\fancyhead{}% delete the default header
% \fancyfoot{}% delete the default footer
% page numbers
\fancyfoot[C]{\hspace*{1.8cm}\sffamily\fontsize{10pt}{10pt}\selectfont\thepage}
% header for assignment sheets
\lhead{NAME, Vorname: \hfill Matrikel-Nr.: \hspace*{5em}}
\rfoot{}

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
\WithSuffix\newcommand\subpoints*[1]{
\addtocounter{subpoints}{#1}
\addtocounter{totalpoints}{#1}
}

% Korrekturtabelle
\newcommand\makegradetable{%
	\newcounter{tab}
	\newcounter{nums}
	\setcounter{nums}{\totvalue{assignment}}\addtocounter{nums}{1}

	\ifthenelse{\totvalue{assignment} < 10}{% normal size table
		\begin{center}
			\begin{tabular}{*{\thenums}{|c}|}
				\hline
				\forloop{tab}{1}{\value{tab} < \thenums}{{\small Aufg. \thetab} &}
				\small \hspace*{-0.1cm}$\sum$\\
				\hline
				\forloop{tab}{1}{\value{tab} < \thenums}{{\small\getpoints{\thetab}} &}{\small\gettotalpoints}\\
				\hline
				\forloop{tab}{1}{\value{tab} < \thenums}{\hspace*{0.8cm} &} \hspace*{0.8cm}\parbox[0pt][2em][c]{0cm}{} \\
				\hline
				\forloop{tab}{1}{\value{tab} < \thenums}{&} \parbox[0pt][2em][c]{0cm}{}\\
				\hline
			\end{tabular}
		\end{center}
	}{ % compact size table
		\begin{center}
			\begin{tabular}{*{\thenums}{|c}|}
				\hline
				\forloop{tab}{1}{\value{tab} < \thenums}{{\small \thetab} &}
				\small \hspace*{-0.1cm}$\sum$\\
				\hline
				\forloop{tab}{1}{\value{tab} < \thenums}{{\small\getpoints{\thetab}} &}{\small\gettotalpoints}\\
				\hline
				\forloop{tab}{1}{\value{tab} < \thenums}{\hspace*{0.5cm} &} \hspace*{0.5cm}\parbox[0pt][2em][c]{0cm}{} \\
				\hline
				\forloop{tab}{1}{\value{tab} < \thenums}{&} \parbox[0pt][2em][c]{0cm}{}\\
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

\renewcommand\maketitle{%
	\thispagestyle{empty}
	% \addtolength{\voffset}{-15mm}

	\definecolor{dunkelgrau}{rgb}{0.8,0.8,0.8}
	\definecolor{hellgrau}{rgb}{0.95,0.95,0.95}
	\definecolor{rahmengrau}{rgb}{0.9,0.9,0.9}

	\vspace*{-1.5cm}
	\includegraphics[height=1.5cm]{uulmlogo}
	\hfill
	\includegraphics[height=1.5cm]{uulmlogo2}

% 	\vspace{-1.0cm}
	\small
	\begin{center}
		\textbf{KLAUSURDECKBLATT}
	\end{center}

	\colorbox{hellgrau}{
		\begin{minipage}{\textwidth}
			\begin{center}
				Name der Prüfung: \textbf{\@title}
			\end{center}

			\renewcommand{\arraystretch}{1.5}
			%\setlength{\tabcolsep}{10pt}

			\begin{tabular}{llll}
				Datum und Uhrzeit: & \@date & Bearbeitungszeit: & \@duration \\
				Institut: & \@institute & Prüfer: & \@examiner \\
			\end{tabular}
		\end{minipage}
	}

	\colorbox{hellgrau}{
		\begin{minipage}{\textwidth}
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

			\begin{minipage}{.5\textwidth}
				\vspace*{1.0cm}
				\hrule
				\vspace*{0.1cm}
				\tiny Datum, Unterschrift des Prüfungsteilnehmers
			\end{minipage}

			\vspace*{0.3cm}
			Hiermit erkläre ich, dass ich prüfungsfähig bin. Sollte ich nicht auf der Liste
			der angemeldeten Studierenden aufgeführt sein, dann nehme ich hiermit zur
			Kenntnis, dass diese Prüfung nicht gewertet werden wird.

		\end{minipage}
	}

	\begin{minipage}{0.56\textwidth}
		\vspace*{0.3cm}

		\textbf{Hinweise zur Prüfung:}

		\begin{itemize}
			\item Schreiben Sie auf jedes Blatt \textbf{Name} und \textbf{Matrikelnummer}.
			Bitte halten Sie Ihren Studentenausweis zur Teilnahmekontrolle bereit.
			\item Verwenden Sie nur dokumentenechte Stifte \textbf{(kein Bleistift!)}.
			Schreiben Sie bitte leserlich und in kurzen, verständlichen Sätzen.
			\item Die erreichbare Punktzahl ist neben jeder Teilaufgabe angegeben, insgesamt
			können \textbf{\gettotalpoints\ Punkte} erreicht werden. Bitte beachten Sie dies bei Ihren
			Antworten.
			\item Falls Ihnen der Platz auf einem Aufgabenblatt (inkl. Rückseite) nicht
			ausreicht, verwenden Sie bitte die hinten angehängten Extrablätter und
			kennzeichnen Sie diese entsprechend. \textbf{Antworten auf Blättern anderer Aufgaben
			oder auf eigenen Blättern werden nicht gewertet!} Zusätzliche Blätter erhalten
			Sie auf Anfrage von den Betreuern.
		\end{itemize}
	\end{minipage}\hspace*{0.53cm}
	\setlength{\fboxrule}{0.5pt}
	\setlength{\fboxsep}{7pt}
	\fcolorbox{rahmengrau}{white}{
	\begin{minipage}[c]{0.38\textwidth}
		\centering
		Barcode
		\vspace*{6cm}
	\end{minipage}}

	\vspace*{0.3cm}

	\textbf{Erlaubt Hilfsmittel:}

	\begin{itemize}
		\item Keine Hilfsmittel erlaubt \hspace*{7.2cm} \textbf{Viel Erfolg!}
	\end{itemize}

	\colorbox{hellgrau}{
		\begin{minipage}{0.98\textwidth}
			\textbf{Vom Prüfer auszufüllen:}

			\makegradetable

			\vspace*{0.4cm}
			\renewcommand{\arraystretch}{0.5}
			\begin{tabular}{lp{.2\textwidth}p{.1\textwidth}p{.35\textwidth}}
				\textbf{Gesamtnote:} &  &   \\
				\cmidrule(l){2-2}\cmidrule(lr){4-4}
				& & & \tiny Unterschrift Prüfer\\
			\end{tabular}

		\end{minipage}
	}

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
% save subpoints of last assignment
\refstepcounter{subpoints}\label{pointsref@\theassignment}%
\refstepcounter{assignment}%
\vspace*{0ex}\textbf{Aufgabe \arabic{assignment}:}~\textbf{#1}\hfill\emph{(\getpoints{\theassignment}\,Punkte)}%
\marginpar{~~%
\begin{picture}(30,18)(0,5)%
\framebox(30,18){}%
\end{picture}%
}}

% unfortunaltely doesn't work
% \AtEndDocument{\refstepcounter{subpoints}\label{pointsref@\theassignment}}

% Solutions
\newboolean{showsolutions}
\setboolean{showsolutions}{false}
\newcommand{\solution}[1]{{\Large\color{red}\textbf{Lösung Aufgabe
\theassignment:}~\textbf{#1}}}

% Includes
\newcommand\inputassignment[2]{%
\input{#1}
\cleardoublepage
\ifthenelse{\boolean{showsolutions}}{%
\input{#2}
\cleardoublepage
}{}
}

% Zusatzblaetter
\xdef\@identifier{UNI ULM}
\newcommand\identifier[1]{\xdef\@identifier{#1}}

\newcommand\makeemptysheet{%
\fancyfoot{}
\vspace*{1ex}
\raggedright\textbf{Zusatzblatt zu Aufgabe \rule{2em}{0.5pt}:}
\vfill
\raggedleft\bfseries{\Huge\color{lightgray}\rotatebox{45}{\@identifier}}
\newpage
}

\newcommand\answerspace[1]{%
\par\nobreak\vspace{1em}
%\fbox{
\begin{minipage}{0.9\textwidth}
\null\hfill\vspace*{#1\baselineskip}
% \ifthenelse{#1 > 5}{
% \par
% \null\hfill{\small\color{middlegray} Weiter auf~
% \begin{picture}(10,10)(0,0)%
% \framebox(10,10){}%
% \end{picture}%
% ~Zusatzblatt~
% \begin{picture}(10,10)(0,0)%
% \framebox(10,10){}%
% \end{picture}%
% ~Rückseite}
% }{}
\end{minipage}%}
\par\vspace{1em}
}