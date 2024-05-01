%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% phi201.cls                           %
% Connor Frank                         %
% Princeton University                 %
% Spring 2024                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phi201}

\PassOptionsToClass{reqno}{article}
\PassOptionsToClass{reqno}{amsmath}
\ExecuteOptions{reqno}
\ProcessOptions\relax
\LoadClass{article}

\makeatletter

%%%%%%%%%%
% Packages

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath, amssymb}
\RequirePackage{fullpage}
\RequirePackage{array,etoolbox}
\RequirePackage{multicol}

%%%%%%%%%%%%%%%%%
% Set the margins

\setlength{\textheight}{8.5in}
\setlength{\headheight}{.25in}
\setlength{\headsep}{.25in}
\setlength{\topmargin}{0in}
\setlength{\textwidth}{6.5in}
\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}

%%%%%%%%%%%%
% Formatting

\def\pp{\par\noindent}

%%%%%%%%%%%%
% Helper functions

\newcommand{\makeheader}[4]
{
    \noindent
    {#1} \hfill {#2}

    \noindent
    {#3} \hfill {#4}\\
    \vspace*{-0.15in}
}

\newcommand{\myheader}[3]
{\makeheader{\textbf{PHI 201}}{\textbf{#1}}{#2}{#3}}

%%%%%%%%%%%%
% HW-specific

\newcommand{\myhwtitle}[3]
{\begin{center}
        \vspace*{0.25in}
        {\large {\bf PSET {#1}}}\\
        \bigskip
        {#2\\ \medskip {\it{Due {#3}}}}\\
        \vspace{0.25in}
\end{center}\bigskip\rule[6pt]{\textwidth}{1pt}}

\newcommand{\hw}[3]{
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead{\myheader{Problem Set #1}{#2}{\it{Due #3}}}
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{0pt}
    \myhwtitle{#1}{#2}{#3}
}

%%%%%%%%%%%%
% Notes-specific

\newcommand{\mynotestitle}[3]
{\begin{center}
        \vspace*{0.25in}
        {\large {\bf {#1}}}\\
        \bigskip
        {#2}\\
        \vspace{0.25in}
\end{center}\bigskip\rule[6pt]{\textwidth}{1pt}}

\newcommand{\notes}[3]{
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead{\myheader{#1}{#2}{#3}}
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{0pt}
    \mynotestitle{#1}{#2}
}

%%%%%%%%%%%%
% Formatting Utilities

\newcommand{\mytitle}[1]
{\begin{center}
        {\large {\bf {#1}}}
\end{center}}

\newcommand{\mysection}[1]
{{\large \noindent {\bf{#1:}}\\ \\}
\medskip}

\newcommand{\myproblem}[2]
{\noindent{\bf{[#1]} \indent {Problem #2:}}
\medskip}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOGIC-SPECIFIC MACROS                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define the logicproof environment
\newcounter{lineNo}
\newenvironment{logicproof}{
    \begin{tabular}{l l l l}
        \setcounter{lineNo}{1}
    }{
    \end{tabular}
}

% Define the makepl command for formatting a proof line
\newcommand{\makepl}[3]{
    $#1$ & ($\thelineNo$) & $#2$ & #3 \\
}

% Define a command to split the input line into arguments for \makepl
\newcommand{\pl}[1]{
    \plaux#1;\relax
}
\def\plaux#1;#2;#3;\relax{
    \makepl{#1}{#2}{#3}
    \stepcounter{lineNo}
}

%%%%%

\newcolumntype{B}{>{$\bfseries}c<$}

\newenvironment{logictable}[3]{
    \renewcommand{\arraystretch}{1.2}
    \noindent
    \(
        \begin{array}{ *{#2}{c} | *{#3}{c} B c c c c c c c c c }
        }{
        \end{array} \\
    \)
}

\newcommand{\tl}[1]{%
    \def\tempa{}% Initialize tempa
    \def\do##1{%
        \ifx\tempa\empty
            \def\tempa{##1}% First item
        \else
            \appto\tempa{& ##1}% Subsequent items
        \fi
    }
    \docsvlist{#1}% Process the CSV list
    \tempa \\% Output the result
}

\newcommand{\thmake}[1]{%
    \def\tempa{}% Initialize tempa
    \def\do##1{%
        \ifx\tempa\empty
            \def\tempa{\ensuremath{##1}}% First item
        \else
            \appto\tempa{& \ensuremath{##1}}% Subsequent items
        \fi
    }
    \docsvlist{#1}% Process the CSV list
    \tempa \\% Output the result
}

\newcommand{\theader}[1]{%
    \thmake{#1} \hline
}
