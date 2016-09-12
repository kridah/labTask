% Guide for that I used for writing this class -> https://no.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-class-file-and-design-your-own-cv.html
% http://tutex.tug.org/pracjourn/2005-4/hefferon/hefferon.pdf
% http://ctan.uib.no/macros/latex/contrib/geometry/geometry.pdf
% https://www.overleaf.com/5745074yzckyd#/18782292/
% http://ctan.uib.no/macros/latex/contrib/biblatex/doc/biblatex.pdf
% https://github.com/gpoore/minted/blob/master/source/minted.pdf
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{labTask}[22/07/2016 Class for lab tasks used in IMT1003]
\LoadClass{article}

% PACKAGES
% Setting up how the pages will be
\RequirePackage[left=1.5cm,right=1.5cm,top=2cm,bottom=1cm,a4paper]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[langlinenos=true]{minted}
\RequirePackage{fancyhdr}
\RequirePackage[svgnames]{xcolor}
\RequirePackage[colorlinks=true, linkcolor=Maroon, urlcolor=Maroon]{hyperref}
\RequirePackage{xifthen}
% DEFINITIONS AND VARIABLES

\def\title{Title for the lab task}
\def\title#1{ \def\title{#1} }
\def\courseId{ Course ID }
\def\courseId#1{\def\courseId{#1}}
\def\courseTitle{ Course Title }
\def\courseTitle#1{\def\courseTitle{#1}}

\global\let\@lecturerName\@empty
\newcommand{\setLecturerName}[1]{\def\@lecturerName{#1}}
\let\lecturerName\setLecturerName %
\newcommand{\show@lecturerName}{\@lecturerName}

\global\let\@studentName\@empty
\newcommand{\setStudentName}[1]{\def\@studentName{#1}}
\let\studentName\setStudentName %
\newcommand{\show@studentName}{\@studentName}
\def\@date{\today}


% PAGE STYLE(footer and header)
\fancypagestyle{normalpage}{%
  \fancyhf{} % clear all six fields
  \fancyhead[RE,LO]{\show@courseInfo, \\\show@date} % Date is placed one line down
  \fancyhead[LE,RO]{page \thepage}
  \renewcommand{\headrulewidth}{0.7pt}
  \renewcommand{\footrulewidth}{0pt}
}
\pagestyle{normalpage}

% COMMADS

\newcommand{\show@courseInfo}{\courseId - \courseTitle}
\newcommand{\show@date}{\@date}

\renewcommand{\maketitle}{%
  {\fontsize{50}{60}\fontfamily{phv}\fontseries{b}%
    {\huge \title \par}% 
    {\ifx\@lecturerName\@empty \relax \else \large Lecturer: \@lecturerName \par \fi}%
    {\ifx\@studentName\@empty \relax \else \large Student: \@studentName \par \fi}}%
}

