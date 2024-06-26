% University of Alabama MS/PhD thesis/dissertation LaTeX Class File
%
% Copyright (c) 2012 Paul Kilgo
% The latest version of this file may be obtained from
%   https://github.com/OEP/uathesis
%
% License: LaTeX Project Public License (www.latex-project.org/lppl.txt)
%   Executive summary:
%       This software is copyright but you are granted a license which gives
%       you, the "user" of the software, legal permission to copy, distribute,
%       and/or modify the software. However, if you modify the software and
%       then distribute it (even just locally) you must change the name of the
%       software to avoid confusion.
%
% OR (dual-licensed)
%
% License: GNU Lesser General Public License (www.gnu.org/licenses/lgpl.html)
%
% Author Information:
%   Paul Kilgo
%   The University of Alabama
%   paulkilgo@gmail.com
%
% Any change requests are appreciated if proposed through Github. Any bug
% reporting should also be done through Github as well.
%
% Happy writing!

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{uathesis}

\RequirePackage{ifthen}

\newif\ifthesis
\DeclareOption{thesis}{\thesistrue}
\DeclareOption{dissertation}{\thesisfalse}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions\relax
\LoadClass[letter,12pt]{report}

% margins
\usepackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}
\usepackage{titlesec}
\usepackage{setspace}
\usepackage{textcase}
\usepackage{tocloft}
\usepackage{flushend} % To avoid references from splitting pages 
\usepackage[nonumberlist,xindy,toc,nopostdot,nogroupskip]{glossaries}
\usepackage{glossary-longragged}
\setlength{\glsdescwidth}{1.25\textwidth}%
\setglossarystyle{longragged}

\renewcommand{\glossaryname}{LIST OF ABBREVIATIONS AND SYMBOLS}

\renewcommand{\cfttoctitlefont}{\pagebreak\vspace*{1.2in}\hspace{.43\linewidth}\MakeTextUppercase}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftchapfont}{ }
\renewcommand{\cftdot}{.}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchappagefont}{}
\renewcommand\cftchappresnum{CHAPTER }
\cftsetindents{chapter}{0em}{6.5em}
\setlength{\cftbeforechapskip}{0pt}

\renewcommand{\contentsname}{CONTENTS}

\renewcommand{\cftloftitlefont}{\pagebreak\hfill\MakeTextUppercase}
\renewcommand{\cftafterloftitle}{\hfill}

\renewcommand{\cftlottitlefont}{\pagebreak\hfill\MakeTextUppercase}
\renewcommand{\cftafterlottitle}{\hfill}

%% Title spacings.
% \titlespacing{\chapter}{0pt}{2in}{1in}

% \titlespacing{\chapter}{0pt}{\baselineskip}{\baselineskip}
% \titlespacing{\section}{0pt}{\baselineskip}{\baselineskip}
% \titlespacing{\subsection}{0pt}{\baselineskip}{\baselineskip}

% margins
% \usepackage[top=2in,bottom=1in,left=1in,right=1in]{geometry}
\titlespacing{\chapter}{0pt}{2in}{1in}
\titlespacing{\section}{0pt}{\baselineskip}{\baselineskip}
\titlespacing{\subsection}{0pt}{\baselineskip}{\baselineskip}

%% Thesis committee
\newcommand\committee[1]{\renewcommand\@committee{#1}}
\newcommand\@committee{Committee undefined}

%% Adviser
\newcommand\adviser[1]{\renewcommand\@adviser{#1}}
\newcommand\@adviser{Adviser undefined}

%% Candidate degree
\newcommand\degree[1]{\renewcommand\@degree{#1}}
\newcommand\@degree{Undefined Degree}

%% University (if not UA)
\newcommand\university[1]{\renewcommand\@university{#1}}
\newcommand\@university{The University of Alabama}

%% Department
\newcommand\department[1]{\renewcommand\@department{#1}}
\newcommand\@department{Undefined Department}

%% School (in case of undergrad thesis or something)
\newcommand\school[1]{\renewcommand\@school{#1}}
\newcommand\@school{Graduate School}

%% Year of graduation
\newcommand\gradyear[1]{\renewcommand\@gradyear{#1}}
\newcommand\@gradyear{\the\year}

%% Place
\newcommand\place[1]{\renewcommand\@place{#1}}
\newcommand\@place{Tuscaloosa, Alabama}

%% Abstract body text
\renewcommand\abstract[1]{\renewcommand\@abstract{#1}}
\newcommand\@abstract{No abstract body text.}

%% Dedication body text
\newcommand\dedication[1]{\renewcommand\@dedication{#1}}
\newcommand\@dedication{No dedication body text.}

%% Acknowledgments body text
\newcommand\acknowledgments[1]{\renewcommand\@acknowledgments{#1}}
\newcommand\@acknowledgments{No acknowledgments body text.}


%% Rename bibliography
\renewcommand{\bibname}{References}

%% Do not add vspace between chapters
%% Hack taken from:
%% http://tex.stackexchange.com
%% /questions/784/how-to-change-the-line-spacing-in-my-list-of-figures
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

% Make the front matter...
\newcommand{\makefrontmatter}{
  \thispagestyle{empty}
  \vspace*{50\p@}
  \begin{center}
    \begin{doublespace}
    \renewcommand{\and}{\NoCaseChange{\\}}
    \MakeTextUppercase{\@title} \linebreak \linebreak 
    by \linebreak 
    \MakeTextUppercase{\@author}
    \begin{singlespace}
      \MakeTextUppercase{\@adviser, Committee Chair \and \@committee}
    \end{singlespace}
    
    \hfill \linebreak
    \ifthesis
      A THESIS
    \else
      A DISSERTATION
    \fi
    \hfill \linebreak
    \begin{singlespace}
	  Submitted in partial fulfillment of the requirements \\
      for the degree of \@degree \\
      in the Department of \@department \\
      in the \@school\,of \\
      \@university
    \end{singlespace}
	\hfill \linebreak
	\hfill \linebreak
    \hfill \linebreak
    \hfill \linebreak
	\MakeTextUppercase{\@place}
	\hfill \linebreak
	\hfill \linebreak
	\@gradyear
  \end{doublespace}
  \end{center}
  \pagebreak


       \begin{frontmatter}
        \topskip=1.3in
            \chapter*{ABSTRACT}
            \addcontentsline{toc}{chapter}{ABSTRACT}
        \topskip=-1in
            \@abstract
    
        \topskip=1.3in
            \chapter*{DEDICATION}
            \addcontentsline{toc}{chapter}{DEDICATION} 
            \topskip=-1in
            \@dedication

        \topskip=1.3in
            \chapter*{ACKNOWLEDGEMENTS}
            \addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}
        \topskip=-1in
             \@acknowledgments

        % \topskip=1.3in
        % \chapter*{Acknowledgments}
        % \topskip=1in
        % \addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}
        % \@acknowledgments
        % \topskip=1in
        
        
    %% ToC entries have double spaced but only longer-than-1-lines have single space.
    \renewcommand\cftchapafterpnum{\vskip12pt}
    \renewcommand\cftsecafterpnum{\vskip12pt}
    \renewcommand\cftsubsecafterpnum{\vskip12pt}
    \begin{spacing}{1}
      \tableofcontents
    \end{spacing}

% 

    % \begin{singlespace}
    % \listoftables
    % \end{singlespace}
 
    % \pagebreak
    % \begin{singlespace}
    % \listoffigures
    % \end{singlespace}

       \renewcommand{\listtablename}{\textnormal{LIST OF TABLES}}
        \begin{spacing}{1}
        \renewcommand{\cftlottitlefont}{\vspace*{0.5in}\hspace{.40\linewidth}\MakeTextUppercase}  
        \pagebreak
        % \addcontentsline{toc}{chapter}{LIST OF TABLES}
        \renewcommand{\cftafterlottitleskip}{0.3in} %added to adjust the spacing 11/17/2021
        \renewcommand\cfttabafterpnum{\vskip10pt\par}
        %\begin{doublespacing}
        \listoftables 
        %\end{doublespacing}
    \end{spacing}

    
     \renewcommand{\listfigurename}{\textnormal{LIST OF FIGURES}}
        \begin{spacing}{1}
        \renewcommand{\cftloftitlefont}{\vspace*{0.5in}\hspace{.40\linewidth}\MakeTextUppercase}  
        \pagebreak
        % \addcontentsline{toc}{chapter}{LIST OF TABLES}
        \renewcommand{\cftafterloftitleskip}{0.3in} %added to adjust the spacing 11/17/2021
        \renewcommand\cftfigafterpnum{\vskip10pt\par}
        %\begin{doublespacing}
        \listoffigures
        %\end{doublespacing}
    \end{spacing}
		
    \end{frontmatter}

}
  
\newcommand{\makecopyright}{
  \thispagestyle{empty}
  \singlespacing
  \null \vfill
  \begin{center}
    Copyright \@author\,\@gradyear \\
    ALL RIGHTS RESERVED
  \end{center}
}


\newenvironment{frontmatter}{
  \makecopyright
  \pagebreak
  \pagenumbering{roman}
  \setcounter{page}{2}
  \setcounter{chapter}{0}
  \begin{doublespace}
  \renewcommand{\@makechapterhead}[1]
  {
    \begin{center}
      \MakeTextUppercase{ ##1 }
    \end{center}
  }
  \renewcommand{\@makeschapterhead}[1]
  {
    \begin{center}
      \MakeTextUppercase{ ##1 }
    \end{center}
  }
}
{
    \end{doublespace}
}
\newenvironment{body}
{
  \pagebreak
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \setcounter{chapter}{0}
  \begin{doublespace}
  \renewcommand{\@makechapterhead}[2]
  {
    \vspace*{50\p@}%
    \begin{center}
      \MakeTextUppercase{ \@chapapp\space \thechapter }
        % \MakeTextUppercase{ \textbf{ \@chapapp\space \thechapter } }
      \linebreak
      \begin{spacing}{1}
      % \MakeTextUppercase{ \textbf{ ##1 } }
      \MakeTextUppercase{ ##1 }
      \end{spacing}
    \end{center}
  }
  
  \renewcommand{\@makeschapterhead}[1]
  {
    \begin{center}
      \MakeTextUppercase{ \textbf{ ##1 } }
    \end{center}
  }
  
  \renewcommand{\section}
  {
    \@startsection{section}{1}{0mm}{4ex}{2ex}{\normalsize\bfseries}
  }
  
  \renewcommand{\subsection}
  {
    \@startsection{subsection}{1}{0mm}{1mm}{1mm}{\normalsize\bfseries}
  }
}
{
  \end{doublespace}
}
% 
% \makeatletter
% \renewcommand{\chapter}{%
%   \clearpage
%   \if@openright
%     \cleardoublepage
%   \else
%     \clearpage
%   \fi
%   \thispagestyle{plain}%
%   \global\@topnum\z@
%   \@afterindenttrue
%   \secdef\@chapter\@schapter
% }

% \renewcommand\@chapter[2]{
%   \ifnum \c@secnumdepth >\m@ne
%     \if@mainmatter
%       \refstepcounter{chapter}%
%       \typeout{\@chapapp\space\thechapter.}%
%       \addtocontents{toc}{\protect\addvspace{12\p@}}%
%     \else
%       \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
%     \fi
%   \else
%     \addcontentsline{toc}{chapter}{#1}%
%   \fi
%   \chaptermark{#1}%
%   \addtocontents{lof}{\protect\addvspace{10\p@}}%
%   \addtocontents{lot}{\protect\addvspace{10\p@}}%
%   \@makechapterhead{#2}%
%   \if@twocolumn
%     \@topnewpage[\@makechapterhead{#2}]%
%   \else
%     \@makechapterhead{#2}%
%     \@afterheading
%   \fi
% }

% \renewcommand\section{\@startsection{section}{1}{0mm}%
%   {4ex}%  % <-- Space before section title
%   {2ex}%  % <-- Space after section title
%   {\normalsize\bfseries}}

% \renewcommand\subsection{\@startsection{subsection}{1}{0mm}%
%   {1mm}%  % <-- Space before subsection title
%   {1mm}%  % <-- Space after subsection title
%   {\normalsize\bfseries}}
% \makeatother


\makeglossaries

