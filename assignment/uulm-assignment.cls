\def\@clsname{uulm-assignment}
\ProvidesClass{\@clsname}[2025/03/30 v3.0 Assignment document class]
\LoadClass[11pt]{article}

\def\@clswrn{\ClassWarning{\@clsname}}
\def\@clserr{\ClassError{\@clsname}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Options                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=assignment,prefix=@}

\DeclareBoolOption{nocolor}
\DeclareBoolOption{solution}
\DeclareBoolOption[true]{english}
\DeclareComplementaryOption{german}{english}
\DeclareBoolOption{compat}

\ProcessKeyvalOptions*

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Includes                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[\if@english english\else ngerman\fi]{babel}

\RequirePackage[sfdefault,lining]{FiraSans}
\RequirePackage[scaled=0.9]{FiraMono}
\RequirePackage{fouriernc}

\RequirePackage{tikz}

\RequirePackage{microtype}
\RequirePackage{lastpage}
\RequirePackage{titlesec}
\RequirePackage{comment}
\RequirePackage[normalem]{ulem}

\RequirePackage[inline]{enumitem}

\RequirePackage{hyperref}

\input{config/translations.tex}
\input{config/utils.tex}
\input{config/uulm-logo.tex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Layout                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength{\@xmargin}\setlength{\@xmargin}{2.25cm}
\newlength{\@ymargin}\setlength{\@ymargin}{2cm}
\RequirePackage[hmargin=\@xmargin,vmargin=\@ymargin,a4paper,includeheadfoot,headsep=1.2cm]{geometry}

\renewcommand{\baselinestretch}{1.15}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

\titleformat*{\section}{\normalfont\large\bfseries}
\titlespacing*{\section}{0pt}{2.5ex plus 1ex minus 0.5ex}{0ex plus 0.2ex}
\titleformat*{\paragraph}{\normalfont\itshape\scshape}

\RequirePackage{scrlayer-scrpage}
\KOMAoptions{headsepline=true}
\renewcommand\headfont{\normalfont}
\ihead{\@shortcourse{} \textbar{} \@shortsemester}
\chead{\@title}
\ohead{\@publishdate}
\ifoot{\itshape\@shortsupervisor}
\ofoot{\def\@linkcolor{.}\itshape\translate{page} \thepage{} / \pageref{LastPage}}

\defpairofpagestyles[scrheadings]{title}{
	\KOMAoptions{headsepline=false}
	\ihead{}\chead{}\ohead{}
}

\pagestyle{scrheadings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Class Colors                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{uulm}{RGB}{125,154,170}
\definecolor{uulm-akzent}{rgb}{.663,.635,.553}
\definecolor{uulm-in}{RGB}{163,38,56}

\if@nocolor
	\colorlet{uulm-in-link}{black}
	\colorlet{uulm-akzent-blend}{black}
\else
	\colorlet{uulm-in-link}{uulm-in!30!black}
	\colorlet{uulm-akzent-blend}{black!70!uulm-akzent}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Create info macros                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Required
\ensureinfo{faculty}
\ensureinfo{course}
\ensureinfo{semester}
\ensureinfo{supervisor}
\ensureinfo{assignmenttype}
\ensureinfo{publishdate}

% Optional
\ensureinfo{assignmentno}
\ensureinfo{deadline}
\ensureinfo{duration}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Title page                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{%
	\thispagestyle{title}%
	\vspace*{-\dimexpr\headheight+\headsep+.5\@xmargin\relax}%
	\uulmlogo{uulm-akzent-blend}%
	\\[.5\@ymargin]%
	\noindent\hspace*{-\@xmargin}%
	\begin{tikzpicture}
		\if@nocolor
			\colorlet{b1}{white}
			\colorlet{b2}{white}
			\colorlet{f1}{black}
			\colorlet{f2}{black}
		\else
			\colorlet{b1}{uulm-in}
			\colorlet{b2}{uulm-akzent!50}
			\colorlet{f1}{white}
			\colorlet{f2}{uulm-akzent-blend}
		\fi

		\node[rectangle,draw=b1,fill=b1,minimum width=\paperwidth,minimum height=1.2cm](B1){};
		\node[anchor=east,xshift=-\@xmargin,align=right,text width=\dimexpr\paperwidth-2\@xmargin\relax,
		font=\Large,f1,inner sep=0] at (B1.east){\@course};

		\node[anchor=north,rectangle,draw=b2,fill=b2,minimum width=\paperwidth,minimum height=2.4cm] at (B1.south) (B2){};
		\node[anchor=east,xshift=-\@xmargin,align=right,text width=\dimexpr\paperwidth-2\@xmargin\relax,
		font=\normalsize,f2,inner sep=0] at (B2.east){\@faculty{}\par\@supervisor\\[1ex]\@semester};
	\end{tikzpicture}%
	\\[.5\@ymargin]%
	{\large\bfseries\@assignmenttype\if@assignmentno~\@assignmentno\fi: \@title}%
	\if@deadline\if@duration% deadline & duration
		\hfill\small\translate{discussion-on}: \@deadline%
		\break\hfill\null\hfill\small\translate{duration}: \@duration%
	\else% deadline & !duration
		\hfill\small\translate{discussion-on}: \@deadline%
	\fi\else\if@duration% !deadline & duration
		\hfill\small\translate{duration}: \@duration%
	\else\fi\fi%
	\par\vskip0.5em minus 0.5em\relax%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Tasks and subtasks                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter{task}
\newcommand\task{\@ifstar{\@tasks}{\@task}}
\newcommand\@task[2][]{
	\refstepcounter{task}%
	\def\intocline{}%
	\addcontentsline{toc}{section}{\arabic{task} - #2}%
	\let\intocline\undefined%
	\section*{\translate{task}~\arabic{task}\quad\normalfont\normalsize#2%
	\if\relax\detokenize{#1}\relax\else%
		\hfill\textit{(#1P)}%
	\fi}
}
\def\@tasks#1{\section*{#1}}

\newcommand\opttask{\@ifstar{\@otasks}{\@otask}}
\def\@otask#1{\@task{\bgroup\normalsize\normalfont\makeopt\egroup#1}}
\def\@otasks#1{\@tasks{\bgroup\normalsize\normalfont\makeopt\egroup#1}}

\newlist{subtasks}{enumerate}{1}
\setlist[subtasks,1]{label=\itshape\alph*)~,beginpenalty=-1000,midpenalty=-100,endpenalty=100,topsep=0pt}
\setlist[itemize,1]{label=$\bullet$}

\newcounter{optitem}
\def\makeopt{\@ifundefined{intocline}{\stepcounter{optitem}\m{opt\arabic{optitem}}%
	\begin{tikzpicture}[o]%
		\coordinate (helper) at (pic cs:opt\arabic{optitem});%
		\node[anchor=west,shift={(1em,1.1mm)}] at (helper-|current page.west) {\color{gray}Optional};%
	\end{tikzpicture}%
}{}}

\def\optitem{\item\makeopt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Solution                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\onsolution#1{\if@solution#1\fi}
\def\inlinesolution#1{\onsolution{%
	\rotatebox[origin=c]{0}{\@pen}~#1~\rotatebox[origin=c]{180}{\@pen}%
}}

\def\changemargin{\list{}{\leftmargin\sol@leftmargin}\item[]}
\let\endchangemargin=\endlist
\newsavebox{\@solutioncontent}
\if@solution\def\sol@leftmargin{1em}
	\newenvironment{solution}{\setlist{leftmargin=\sol@leftmargin}%
		\setlength{\parskip}{1em}%
		\hfill\break\@ifundefined{beforesolution}{}{\beforesolution}%
		\begin{samepage}\\[\dimexpr-\baselineskip+.5em\relax]
		\rotatebox[origin=c]{-45}{\@pen}%
		\begin{changemargin}\vspace{-.8\baselineskip}%
	}{
		\end{changemargin}\vspace{-.8\baselineskip}%
		\rotatebox[origin=c]{225}{\reflectbox{\@pen}}
		\end{samepage}\@ifundefined{aftersolution}{}{\aftersolution}\par%
	}
\else\excludecomment{solution}\fi

\input{config/config.tex}
\if@compat\input{config/compat.tex}\fi