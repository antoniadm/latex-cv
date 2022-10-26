%% Start of file `cv_class.cls'.
% CV Class File
%
% This class has been downloaded from:
% https://github.com/antoniadm/latex-cv
%
% Author:
% Antoniadis Moschos <antoniadis.mos@gmail.com>
%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{cv_class}[CV Class]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Class options
%-------------------------------------------------------------------------------
\LoadClass[11pt]{article}

% Needed to use icons from font-awesome
\RequirePackage{fontawesome}
% Needed to configure bulletpoints------
\RequirePackage{enumitem}
\RequirePackage{pifont}
\RequirePackage{bbding}
\RequirePackage{multicol}
%----------------------------------------
% Needed to configure page margins
\RequirePackage[left=2cm, right=2cm, top=2cm, bottom=2cm]{geometry}
\RequirePackage{changepage}
% Needed to manage hyperlinks
\RequirePackage{hyperref}
% Needed to manage fonts
\RequirePackage{fontspec}
% Needed to manage fonts
\RequirePackage{titlesec}
% Needed for example's dummy text
\RequirePackage{lipsum}
% Needed to display date
\RequirePackage{datetime}
% Needed to manage colors
\RequirePackage[dvipsnames]{xcolor}
% Needed to configure lines in sections
\RequirePackage{xhfill}

\RequirePackage{tikz}
\usetikzlibrary{fadings}
\newcommand\fadingtext[3][]{%
  \begin{tikzfadingfrompicture}[name=fading letter]
    \node[text=transparent!0,inner xsep=0pt,outer xsep=0pt,#1] {#3};
  \end{tikzfadingfrompicture}%
  
  \begin{tikzpicture}[baseline=(textnode.base)]
    \node[inner sep=0pt,outer sep=0pt,#1](textnode){\phantom{#3}}; 
    \shade[path fading=fading letter,#2,fit fading=false]
    (textnode.south west) rectangle (textnode.north east);% 
  \end{tikzpicture}% 
}

% Define the color of the hyperlinks-----
\definecolor{linkColor}{RGB}{0, 0, 10}
\hypersetup{
  colorlinks=true,
  urlcolor=linkColor}
%----------------------------------------

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setprofession}[1]{\def\@profession{#1}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}
\newcommand*{\setmaincolor}[1]{\def\@maincolor{#1}}
\newcommand*{\setlinkedinaccount}[1]{\def\@linkedinaccount{#1}}
\newcommand*{\setgithubaccount}[1]{\def\@githubaccount{#1}}

% Configure the size of icons
\renewcommand*{\faicon}[1]{\makebox[1.2em][c]{\csname faicon@#1\endcsname}}

% Configure the date format
\newdateformat{monthyeardate}{%
  \monthname[\THEMONTH], \THEYEAR}
  
% Set up Linkedin link
\newcommand{\linkedin}{\href{https://www.linkedin.com/in/\@linkedinaccount}{\color{blue}\faLinkedin\ \color{black} \small linkedin/in/\@linkedinaccount}}

% Set up Github link
\newcommand{\github}{\href{https://www.github.com/\@githubaccount}{\faGithub\ \small github/\@githubaccount}}

%\fadingtext[scale=1]{top color=\@maincolor!22, bottom %color=\@maincolor!22}

% Set up Name
\newcommand{\name}{%
  \color{\@maincolor!80}{\colorbox{black!98!\@maincolor}{\huge{\@firstname}} \\[-0.1\baselineskip]
  \color{\@maincolor!80}\colorbox{black!98!\@maincolor}{\Huge{\@lastname}}}%
    }

% Set up Profession
\newcommand{\profession}{%
\color{black}{\colorbox{\@maincolor!22}{\textbf{\small\@profession}}
}}

% Set up Contact Info
\newcommand{\contact}{%
\centering
{\small \color{\@maincolor}{\faMapMarker} \color{black} \@address \hspace{0.1cm} \color{\@maincolor} \faMobile\ \color{black} \oldstylenums{\@mobile} \\  {\href{mailto:{\@mail}}{\color{\@maincolor}\faEnvelopeO \ \color{black} \@mail}}%
\\ \linkedin \\[-0.1\baselineskip] \github
} %
}

% Set up All Personal Info Header
\newcommand\infoHeader{
 \centerline{\small{\color{black!90}{\textbf{C} u r r i c u l u m \hspace{0.2cm} \textbf{V} i t a e}}}
  \begin{minipage}[t]{.5\textwidth}
      \vspace{0.05cm}
    \name \\[-0.06\baselineskip]
    \profession \\[0.05cm]
  \end{minipage}
  \begin{minipage}[t]{.5\textwidth}
    \vspace{0.55cm}
    \contact % address \ mobile \\ mail \\ linkedin \\ github
  \end{minipage}
}

% Configure the colored line used at Sections
\newcommand\ruleafter[1]{#1~\xrfill[-0.1pt]{0.6pt}[\@maincolor]}

% Create a colored pipe--------
\newcommand{\vpipe}{\rule[-0.4ex]{0.42pt}{2.3ex}}
\newcommand{\colorPipe}{{\color{\@maincolor} \hspace{4pt}\vpipe\hspace{4pt}}}
%------------------------------

\titleformat{\section} % Customise the \section command
{\large\bfseries\raggedright\color{\@maincolor}}{}{0em} % Make the section headers large, small capitals and left aligned
{\ruleafter} % Can be used to insert code before the heading
\titlespacing*{\section}{-1pt}{0pt}{0pt} % Set title spacing

% Adds a section with Summary or Objective
\newcommand{\addSummary}[2]{%
  \section*{#1}
  \vspace{0.1cm}
\begin{adjustwidth}{0.6cm}{0cm} \indent {\hspace{3.5ex} #2}
\end{adjustwidth}
}

% Adds education or experience with Date, Place and details if you want
%\uniOrJob{1}{2}{3}{4} -- #1:Main header, #2:Date, #3:Place, #4:Details (can be blank)
\newcommand{\uniOrJob}[4]{%
  \setlength\parindent{0pt}
  \begin{minipage}[t]{.8\textwidth}
    \indent \hspace{2.5ex} \textbf{\large{\color{black}{#1}}}
  \end{minipage}
  \begin{minipage}[b]{.2\textwidth}
    \raggedleft\color{\@maincolor!70}
    \textit{#2}
  \end{minipage}
  \indent \hspace{5ex}
  \textit{\color{black}{#3}}
  \vspace{-3mm}

  \def\temp{#4}\ifx\temp\empty %Check if #4 is empty
    \vspace{7mm}
  \else
    \begin{itemize}[itemindent=4.5ex]%details
      \vspace{0.2mm}
      \small{\item[\color{\@maincolor!20}{\ding{117}}] \color{black}{#4}}
            \vspace{0.4mm}
    \end{itemize}
  \fi
}

% Adds Skills, \addSkill{1}{2} -- #1:Skills header, #2:Skills
\newcommand{\addSkill}[2]{%
  \begin{minipage}[t]{.3\textwidth}
    \raggedleft \textbf{#1}
  \end{minipage}
  \begin{minipage}[t]{.7\textwidth}
    \hspace{7pt}#2
  \end{minipage}
}

% Adds bulletpoints with date and details
% \bulletAndDate{1}{2}{3} -- #1:bulletpoint, #2:date, #3:details
\newcommand{\bulletAndDate}[3]{%
  \noindent
  \setlist{nolistsep}
  \begin{minipage}[t]{.85\textwidth}
    \begin{itemize}[label=\color{\@maincolor!20}{\ding{117}}]
      \item \textbf{#1}
            \vspace{1mm}
    \end{itemize}
  \end{minipage}
  \begin{minipage}[b]{.15\textwidth}
    \raggedleft\color{\@maincolor!70}
    \textit{#2}
  \end{minipage}
  \indent \hspace{4ex}
  \textit{\color{black}{#3}}
}

% Adds two bulletpoints side by side
% \twoBulletPoints{1}{2} -- #1:1st, #2:2nd
\newcommand{\twoBulletPoints}[2]{%
  \setlength{\columnsep}{50pt}
  \setlist{nolistsep}
  \begin{itemize}[label=\color{\@maincolor!20}{\ding{117}}]
    \vspace{-3mm}
    \begin{multicols}{2}
      \item #1
      \item #2
    \end{multicols}
    \vspace{-3mm}
  \end{itemize}
}

% Footnote with date and source code link
\newcommand\daySource{%
  \vspace*{\fill}
  \centering
  \rule[0.02cm]{15cm}{0.02cm}\\
  \small{ \monthyeardate\today \hspace{5pt}\vpipe\hspace{4pt} {\href{https://github.com/antoniadm/latex-cv}{\color{blue}{source code}}}}}
