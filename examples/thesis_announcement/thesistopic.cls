% A4 width:   210mm
% A4 height:  297mm

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cdletter}

\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{lastpage}
\usepackage{printlen}


\newlength{\foldoffone}
\setlength{\foldoffone}{65mm}\addtolength{\foldoffone}{-10pt}
\newlength{\foldofftwo}
\setlength{\foldofftwo}{108mm}\addtolength{\foldofftwo}{-10pt}

\newcommand{\germandescription}{}
\newcommand{\englishdescription}{}
\newcommand{\cdUniversitaet}{Universit\"at Ulm}	%Universitaet Ulm (sprachabhaengig)
\newcommand{\cdFakultaet}{}		%Fakultaet/Einrichtung
\newcommand{\cdInstitut}{}	
\newcommand{\cdGruppe}{}		%Instituts/Abteilungsname
\newcommand{\cdName}{Martin Mustername}	%Titel und Name des Absenders
\newcommand{\cdZusatz}{}	%Namenszusatz, z.B. Leiter, ...
\newcommand{\cdStrasse}{}
\newcommand{\cdOrt}{89069 Ulm} 		%Ort
\newcommand{\cdTelefon}{} 	%Telefonnummer 
\newcommand{\cdFax}{} 		%Faxnummer
\newcommand{\cdEmail}{} 	%email Adresse
\newcommand{\cdUrl}{} 		%url der Homepage
\newcommand{\cdKuerzel}{}


\def\placewindowticks{%
%	\vbox to 0mm{%
%		\rule{0pt}{\foldoffone}%
%		\hbox to 0pt{\hspace*{-19mm}%
%		\vbox{\hrule width 7mm}\hss}%
%		\vss}\nointerlineskip%
%	\vbox to 0mm{%
%		\rule{0pt}{\foldofftwo}%
%		\hbox to 0pt{\hspace*{-19mm}%
%		\vbox{\hrule width 7mm}\hss}%
%		\vss}\nointerlineskip%
}%

\newboolean{@german} 
\setboolean{@german}{false}
\DeclareOption{german}{\setboolean{@german}{true}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\letter}}
\ProcessOptions
\LoadClass[a4paper]{letter}

% \RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

%\newcommand{\printiffilled}[1]{\ifthenelse{\equal{#1}{}}{}{\mbox{#1}\\}}
%\newcommand{\printboldiffilled}[1]{\ifthenelse{\equal{#1}{}}{}{\mbox{\textbf{#1}}\\}}

\newcommand{\printiffilled}[1]{\ifthenelse{\equal{#1}{}}
						  {}	  %then
						  {#1\\}} %else
\newcommand{\printiffilledsep}[2]{\ifthenelse{\equal{#1}{}}
						  {}	  %then
						  {#1 #2}} %else
\newcommand{\printboldiffilled}[1]{\ifthenelse{\equal{#1}{}}{}{\textbf{#1}\\}}


\newcommand{\englishnames}{
	\newcommand{\telephonename}{Phone: }
	\newcommand{\pagen}{Page}
	\newcommand{\faxname}{Fax: }
	\newcommand{\of}{of}
	\newcommand{\roomname}{room: }
  	\englishdescription
}

\newcommand{\germannames}{
	\newcommand{\telephonename}{Tel: }
	\newcommand{\pagen}{Seite}
	\newcommand{\faxname}{Fax: }
	\newcommand{\of}{von}
	\newcommand{\roomname}{Raum: }
 	\germandescription	
}

% Sprachabhaengige Variablen definieren
\ifthenelse{\boolean{@german}}{\RequirePackage{german}\germannames}{\englishnames}

% \ifthenelse{\boolean{@german}}{
%    \newcommand{\cdDatum}{\germandate\today}
% }{
   \newcommand{\cdDatum}{\today}
% }


\newcommand{\mysignature}{%
	\cdName\\\ifthenelse{\equal{\cdZusatz}{}}{}{- \cdZusatz\ -} 
}

% Signatur definieren
\signature{\mysignature}

% Breite und Hoehe der Seite und der Raender definieren
\setlength{\textheight}{226mm}
\setlength{\textwidth}{169mm}
% Raender sind relativ zum default von 1in
\setlength{\oddsidemargin}{-1in}\addtolength{\oddsidemargin}{22mm}
\setlength{\topmargin}{-1in}
\setlength{\evensidemargin}{-1in}\addtolength{\evensidemargin}{22mm}
\setlength{\headheight}{35mm}
\setlength{\headsep}{5mm}
\setlength{\baselineskip}{14pt}
\setlength{\footskip}{10pt}

\newlength{\addrskip}
\setlength{\addrskip}{12mm} \addtolength{\addrskip}{-14pt}

% Definiere die Breiten des linken Textfeldes (Uni Ulm | ... und Absenderadresse) und des rechten
% Textfeldes (Absender) 
\newlength{\leftfield}
\setlength{\leftfield}{122mm}
\newlength{\rightfield}
\setlength{\rightfield}{\textwidth}
\addtolength{\rightfield}{-\leftfield}
\addtolength{\rightfield}{-10mm}
%\setlength{\rightfield}{35mm}
%\raggedright

% Wie weit ist der linke Rand der Boundingbox des Unilogos vom
% linken Blattrand entfernt:
\newlength{\unilogoloffset} \setlength{\unilogoloffset}{19mm}%
% Wie weit ist der linke Rand der Boundingbox des uulm-Schriftzugs vom
% linken Blattrand entfernt?
\newlength{\unilogoroffset} \setlength{\unilogoroffset}{120mm}%

\newlength{\unilogohspaceoffset}
\setlength{\unilogohspaceoffset}{-1in}
\addtolength{\unilogohspaceoffset}{-\oddsidemargin}%
\addtolength{\unilogohspaceoffset}{\unilogoloffset}

\newlength{\unilogolwidth}
\setlength{\unilogolwidth}{\unilogoroffset}
\addtolength{\unilogolwidth}{-\unilogoloffset}

\newlength{\unilogorwidth}
\setlength{\unilogorwidth}{\textwidth}
\addtolength{\unilogorwidth}{1in}
\addtolength{\unilogorwidth}{\oddsidemargin}
\addtolength{\unilogorwidth}{-\unilogoroffset}

\def\unilogohead{%
	\hspace*{-2.2mm}%
    	\parbox[b][35mm][t]{\textwidth}{%
	    \parbox[t][32mm][b]{\textwidth}{%
	       \includegraphics{logo_brief_45_sw}%
	    }%
        }%
}%

\renewcommand{\ps@firstpage}
   {\setlength{\topmargin}{-1in}
    \setlength{\headheight}{35mm}
    \setlength{\headsep}{5mm}
    \renewcommand{\@oddhead}{%
    	\unilogohead%
    }%
    %\renewcommand{\@oddfoot}{}
    \renewcommand{\@evenhead}{\@oddhead}
    \renewcommand{\@evenfoot}{\@oddfoot}
   }

\renewcommand{\ps@headings}
   {\setlength{\topmargin}{-1in}
    \setlength{\headheight}{35mm}
    \setlength{\headsep}{5mm}
    \renewcommand{\@oddhead}{%
   	\unilogohead%
   }
   \renewcommand{\@oddfoot}{\parbox{\textwidth}
      {\rule[3pt]{\textwidth}{1pt}\\
%       \parbox{\textwidth}{
%		\fontsize{10pt}{14pt}
% 		\usefont{T1}{0mt}{m}{n}
%		\hfill \pagen\ \thepage\ \of\ \pageref{LastPage}}
	\parbox{\textwidth}{
	  \hfill  \includegraphics[width=0.4\textwidth]{bilingual-gray-gradient}
	}
      }
    }
   \renewcommand{\@evenhead}{\@oddhead}
   \renewcommand{\@evenfoot}{\@oddhead}
 } 
   
% \newcommand{\subject}[1]{\renewcommand}{\@subject}{#1}

\renewcommand{\opening}[1]{%
		\fontsize{8pt}{10pt}
		\selectfont
	   	\placewindowticks
	   	\thispagestyle{firstpage}
	   	\vspace*{\addrskip}
		  	\parbox[t]{\leftfield}{
			   \parbox[t]{\leftfield}{%
% 				\textbf{\cdUniversitaet} $|$
% 				\printiffilledsep{\cdOrt}{$|$}
% 				Germany
			   }
			   \parbox[t]{\leftfield}{
			        \raggedright
				\vspace{10pt}
				\toname\\ \toaddress
				}
			}\hfill%	
			\parbox[t]{\rightfield}{
				\raggedright
				\printboldiffilled{\protect\cdFakultaet}
				\vspace{3pt}
				\printiffilled{\cdInstitut}
				\printiffilled{\cdGruppe}
				\vspace{10pt}
				\printboldiffilled{\cdName}
				\printiffilled{\cdZusatz}
				\vspace{10pt}
				\printiffilled{\cdStrasse}
			%	\cdOrt, Germany\\
				\ifthenelse{\equal{\cdTelefon}{}}{}
					{\mbox{\telephonename \cdTelefon}\\}
				\ifthenelse{\equal{\cdTelefon}{}}{}{\mbox{\faxname \cdFax}\\}
				\printiffilled{\cdEmail}
				\printiffilled{\cdUrl}
				\vspace{10pt}
				\textbf{\cdDatum \ / \cdKuerzel}
			%\ifthenelse{\equal{\mysign}{}}{\\}{\mbox{\textbf{\mysign}}\\}
	   		}
	   	  	\vspace{6pt}

% 		\end{minipage}
\fontsize{14pt}{18pt}%
\selectfont 
\textbf{#1}%
\vspace{14pt}%
\bigskip
   \fontsize{10pt}{14pt}
   \selectfont
}
% }

\renewcommand{\@texttop}{}

\renewcommand{\closing}[1]{
  \begin{center}
    \fontsize{12pt}{14pt}
    \textbf{#1}
  \end{center}
}

\pagestyle{headings}
\fontsize{10pt}{14pt}
\selectfont

