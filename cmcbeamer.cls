\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cmcbeamer}[2023/10/25 Beamer class of CMC MSU]

%%% OPTIONS of CMCBEAMER class START:

%%%% ASPECTRATIO: 169 (16:9) and 43 (4:3), default is 169
\newcommand{\ASPECT}{169}
\DeclareOption{169}{
  \renewcommand{\ASPECT}{169}
}
\DeclareOption{43}{
  \renewcommand{\ASPECT}{43}
}
%%%% MINTED option: enable and disable minted package; default is
%%%% disabled
\newcommand{\MINTED}{}
\DeclareOption{minted}{\renewcommand{\MINTED}{
    \RequirePackage{minted}
}}

%%%% NOOUTLINE option: disable outline (for example to use transition
%%%% frames)
\newcommand{\OUTLINE}{
  \AtBeginSection[]{
  \begin{frame}<beamer>
    \frametitle{\translate{Table of contents}}
    \tableofcontents[currentsection,currentsubsection]
  \end{frame}
  }
}

\DeclareOption{nooutline}{%
  \renewcommand{\OUTLINE}{}
}

%%%% PASS other options of beamer package
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

%%% OPTIONS of CMCBEAMER class END.

%%% Loading beamer class document
\LoadClass[%
pdf,
unicode,
aspectratio=\ASPECT,
xcolor={dvipsnames, hyperref, table},
% notheorems,
]{beamer}

%%% Theme
\mode<presentation>
{
  %\usetheme{Warsaw}
  %\usetheme{AnnArbor}
  %\usetheme{Antibes}
  %\usetheme{Bergen}
  %\usetheme{Berkeley}
  %\usetheme{Berlin} %!!!
  %\usetheme{Boadilla}
  \usetheme{boxes} %!!!!!
  % \usetheme{CambridgeUS} %!!!!
  %\usetheme{Copenhagen}
  %\usetheme{Darmstadt}
  %\usetheme{default}
  %\usetheme{Dresden}
  % \usetheme{Frankfurt} %!!!!!!
  %\usetheme{Goettingen}
  %\usetheme{Hannover}
  %\usetheme{Ilmenau}
  %\usetheme{JuanLesPins}
  %\usetheme{Luebeck}
  %\usetheme{Madrid}
  %\usetheme{Malmoe}
  %\usetheme{Marburg}
  %\usetheme{Montpellier}
  %\usetheme{PaloAlto}
  %\usetheme{Pittsburgh}
  %\usetheme{Rochester}
  %\usetheme{Singapore}
  %\usetheme{Szeged}
  % AND YOU CAN CHOOSE CUSTOM COLOR THEME ----->
  % \usecolortheme{albatross}
  %\usecolortheme{beaver}
  %\usecolortheme{beetle}
  %\usecolortheme{crane}
  % \usecolortheme{dolphin}
  %\usecolortheme{dove}
  %\usecolortheme{fly}
  \usecolortheme{lily}
  % \usecolortheme{orchid}
  %\usecolortheme{rose}
  %\usecolortheme{seagull}
  %\usecolortheme{sidebartab}
  %\usecolortheme{whale}
  %\usecolortheme{wolverine}
  % \setbeamercovered{transparent}
  % or whatever (possibly just delete it)
}
%%% DISABLE navigation symbols
\setbeamertemplate{navigation symbols}{}

%%%%%%%%%%%%%%%%%%%Настройка шрифтов%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Поддержка русского языка
\RequirePackage[T1, T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english, russian]{babel}
% \RequirePackage[scaled=.95]{gentium}   %% ОЧЕНЬ красивый шрифт, но есть проблемы с bold, отключаем до обновлений
% \RequirePackage[sups,scaled=.97]{XCharter}  %% неплохой, стильный шрифт
\RequirePackage[default]{lato}
\RequirePackage[cal=boondoxo]{mathalfa}  %% красивые каллиграфические буквы

%%%%%%%%%%%%%%%%%%%Обеспечиваем работу с математикой%%%%%%%%%%%%%%%%%
\RequirePackage{amsthm}
\RequirePackage{amstext}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
%Красивые дроби
\RequirePackage{xfrac}
%Дополнительные математические окружения
\RequirePackage{mathtools}
%Математический шрифт
%\RequirePackage[libertine,bigdelims,vvarbb]{newtxmath}
\RequirePackage[libertine,bigdelims,vvarbb,scaled=1.03]{newtxmath}
%\linespread{1.04}
%Прямые греческие буквы (принято в русской типографии)
\RequirePackage{upgreek}
%Дополнительные символы
\RequirePackage{textcomp}
% \usefonttheme[onlymath]{serif}

%%%%%%%%%%%%%%%%%%%Настраиваем дизайн текста (отступы, интервалы и пр.)&&&&&&
\RequirePackage{hyperref}
%%% Красивые гиперссылки
\hypersetup{
    colorlinks=true,
    linkcolor=structure.fg,
    filecolor=structure.fg,
    runcolor=structure.fg,
    urlcolor=structure.fg,
    citecolor=structure.fg,
    pdfpagemode=FullScreen,
}
\urlstyle{same}
%Тонкое оформление перекрёстных ссылок
% \RequirePackage[russian]{cleveref}  % not supported in beamer
\RequirePackage{xcolor}
\RequirePackage{hyphenat}
% \RequirePackage{titlesec}
%%%%%%%%%%%%%%%%%%%%Обеспечиваем работу с медиа-контентом (с рисунками)%%%%%%%%%%%%%%%%%%%
% Крутой пакет для рисования
\RequirePackage{tikz}
% Подключаем пакет работы с графикой
\RequirePackage{graphicx}

% Пусть к папке с рисунками по умолчанию
\graphicspath{{images/}}

% Можно указывать имя файлов без расширений
% LaTeX будет последовательно подставлять перечисленные
% пока файл не будет найден
\DeclareGraphicsExtensions{.pdf,.png,.jpg,.jpeg}

%%%%%%%%%%%%%%%%%%%Обеспечиваем работу с таблицами%%%%%%%%%%%%%%%%%%%
%Хорошие таблицы
\RequirePackage{booktabs}
%Длинные таблицы
\RequirePackage{longtable}
%Предоставляет окружение таблицы со столбцами, которые
%позволяют установить их фиксированную ширину в процентах
%и переносить слова в ячейке
\RequirePackage{tabu}
%%% Extended tabular and array blocks
\RequirePackage{blkarray}
%%%%%%%%%%%%%%%%%%%%Обеспечиваем оформление алгоритмов и листингов%%%
%Включение в документ листингов
\RequirePackage{listings}
%решаем проблему с кириллицей в комментариях (в pdflatex) https://tex.stackexchange.com/a/103712
\lstset{extendedchars=true,keepspaces=true,literate={Ö}{{\"O}}1
    {Ä}{{\"A}}1
    {Ü}{{\"U}}1
    {ß}{{\ss}}1
    {ü}{{\"u}}1
    {ä}{{\"a}}1
    {ö}{{\"o}}1
    {~}{{\textasciitilde}}1
    {а}{{\selectfont\char224}}1
    {б}{{\selectfont\char225}}1
    {в}{{\selectfont\char226}}1
    {г}{{\selectfont\char227}}1
    {д}{{\selectfont\char228}}1
    {е}{{\selectfont\char229}}1
    {ё}{{\"e}}1
    {ж}{{\selectfont\char230}}1
    {з}{{\selectfont\char231}}1
    {и}{{\selectfont\char232}}1
    {й}{{\selectfont\char233}}1
    {к}{{\selectfont\char234}}1
    {л}{{\selectfont\char235}}1
    {м}{{\selectfont\char236}}1
    {н}{{\selectfont\char237}}1
    {о}{{\selectfont\char238}}1
    {п}{{\selectfont\char239}}1
    {р}{{\selectfont\char240}}1
    {с}{{\selectfont\char241}}1
    {т}{{\selectfont\char242}}1
    {у}{{\selectfont\char243}}1
    {ф}{{\selectfont\char244}}1
    {х}{{\selectfont\char245}}1
    {ц}{{\selectfont\char246}}1
    {ч}{{\selectfont\char247}}1
    {ш}{{\selectfont\char248}}1
    {щ}{{\selectfont\char249}}1
    {ъ}{{\selectfont\char250}}1
    {ы}{{\selectfont\char251}}1
    {ь}{{\selectfont\char252}}1
    {э}{{\selectfont\char253}}1
    {ю}{{\selectfont\char254}}1
    {я}{{\selectfont\char255}}1
    {А}{{\selectfont\char192}}1
    {Б}{{\selectfont\char193}}1
    {В}{{\selectfont\char194}}1
    {Г}{{\selectfont\char195}}1
    {Д}{{\selectfont\char196}}1
    {Е}{{\selectfont\char197}}1
    {Ё}{{\"E}}1
    {Ж}{{\selectfont\char198}}1
    {З}{{\selectfont\char199}}1
    {И}{{\selectfont\char200}}1
    {Й}{{\selectfont\char201}}1
    {К}{{\selectfont\char202}}1
    {Л}{{\selectfont\char203}}1
    {М}{{\selectfont\char204}}1
    {Н}{{\selectfont\char205}}1
    {О}{{\selectfont\char206}}1
    {П}{{\selectfont\char207}}1
    {Р}{{\selectfont\char208}}1
    {С}{{\selectfont\char209}}1
    {Т}{{\selectfont\char210}}1
    {У}{{\selectfont\char211}}1
    {Ф}{{\selectfont\char212}}1
    {Х}{{\selectfont\char213}}1
    {Ц}{{\selectfont\char214}}1
    {Ч}{{\selectfont\char215}}1
    {Ш}{{\selectfont\char216}}1
    {Щ}{{\selectfont\char217}}1
    {Ъ}{{\selectfont\char218}}1
    {Ы}{{\selectfont\char219}}1
    {Ь}{{\selectfont\char220}}1
    {Э}{{\selectfont\char221}}1
    {Ю}{{\selectfont\char222}}1
    {Я}{{\selectfont\char223}}1
    {і}{{\selectfont\char105}}1
    {ї}{{\selectfont\char168}}1
    {є}{{\selectfont\char185}}1
    {ґ}{{\selectfont\char160}}1
    {І}{{\selectfont\char73}}1
    {Ї}{{\selectfont\char136}}1
    {Є}{{\selectfont\char153}}1
    {Ґ}{{\selectfont\char128}}1
}
% Ширина текста минус ширина надписи 999
\newlength{\twless}
\newlength{\lmarg}
\setlength{\lmarg}{\widthof{999}}   % ширина надписи 999
\setlength{\twless}{\textwidth-\lmarg}
\lstset{ %
%    language=R,                     %  Язык указать здесь, если во всех листингах преимущественно один язык, в результате часть настроек может пойти только для этого языка
    numbers=left,                   % where to put the line-numbers
    numberstyle=\fontsize{12pt}{14pt}\selectfont\color{Gray},  % the style that is used for the line-numbers
    firstnumber=1,                  % в этой и следующей строках задаётся поведение нумерации 5, 10, 15...
    stepnumber=5,                   % the step between two line-numbers. If it's 1, each line will be numbered
    numbersep=5pt,                  % how far the line-numbers are from the code
    backgroundcolor=\color{white},  % choose the background color. You must add \usepackage{color}
    showspaces=false,               % show spaces adding particular underscores
    showstringspaces=false,         % underline spaces within strings
    showtabs=false,                 % show tabs within strings adding particular underscores
    frame=leftline,                 % adds a frame of different types around the code
    rulecolor=\color{black},        % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
    tabsize=2,                      % sets default tabsize to 2 spaces
    captionpos=t,                   % sets the caption-position to top
    breaklines=true,                % sets automatic line breaking
    breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
%    title=\lstname,                 % show the filename of files included with \lstinputlisting;
% also try caption instead of title
    basicstyle=\fontsize{12pt}{14pt}\selectfont\ttfamily,% the size of the fonts that are used for the code
%    keywordstyle=\color{blue},      % keyword style
    commentstyle=\color{ForestGreen}\emph,% comment style
    stringstyle=\color{Mahogany},   % string literal style
    escapeinside={\%*}{*)},         % if you want to add a comment within your code
    morekeywords={*,...},           % if you want to add more keywords to the set
    inputencoding=utf8,             % кодировка кода
    xleftmargin={\lmarg},           % Чтобы весь код и полоска с номерами строк была смещена влево, так чтобы цифры не вылезали за пределы текста слева
}

\renewcommand{\lstlistingname}{Листинг}

%Окружение для написания алгоритмов в псевдокоде
\RequirePackage[%
ruled,
vlined,
algosection,
linesnumbered,
titlenumbered
]{algorithm2e}

%Русификация окружения алгоритмов
\SetKwComment{Comment}{/* }{ */}
\SetKwInput{KwData}{Вход}
\SetKwInput{KwData}{Выход}
\SetAlgorithmName{Алгоритм}{алгоритм}{Список алгоритмов}

%%Предоставляет команды для написания алгоритма
%%в псевдокоде
%\RequirePackage{algorithmic}

% Подстветка синтаксиса
% ВНИМАНИЕ! Требует установки python и пакета pygments
% Поэтому по умолчанию пакет отключён, чтобы не возникало ошибок компиляции
\MINTED

%%%%%%%%%%%%%%%%%%%%Оформление библиографии по ГОСТ
\RequirePackage[%
  backend=biber, %подключение пакета biber
  bibstyle=gost-numeric, %подключение одного из четырех главных стилей biblatex-gost
  citestyle=numeric-comp, %подключение стиля
  language=auto, %указание сортировки языков
  sorting=none, %тип сортировки в библиографии
  doi=true,
  eprint=false,
  isbn=false,
  dashed=true,
  url=true
]{biblatex}


\IfFileExists{refs.bib}{
%%%% true code
\addbibresource{refs.bib}  
}{%%%% false code
}

\RequirePackage[style=american]{csquotes}  %% испольуем американский стиль кавычек

%%%%%%%%%%%%%%%%%%%Полезные команды%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Возможность использовать автонумерацию
\newcounter{index}
\newcommand*{\No}{\noindent\refstepcounter{index}\textnumero~\theindex}
\newcommand*{\Index}{\refstepcounter{index}\theindex}

%%% Русская традиция начертания математических знаков
\renewcommand{\le}{\ensuremath{\leqslant}}
\renewcommand{\leq}{\ensuremath{\leqslant}}
\renewcommand{\ge}{\ensuremath{\geqslant}}
\renewcommand{\geq}{\ensuremath{\geqslant}}
\renewcommand{\emptyset}{\varnothing}

%%% Русская традиция начертания математических функций
\renewcommand{\tan}{\operatorname{tg}}
\renewcommand{\cot}{\operatorname{ctg}}
\renewcommand{\csc}{\operatorname{cosec}}
%%% Русская традиция начертания греческих букв (пакет upgreek)
\renewcommand{\epsilon}{\ensuremath{\upvarepsilon}}   %  русская традиция записи
\renewcommand{\phi}{\ensuremath{\upvarphi}}
\renewcommand{\kappa}{\ensuremath{\varkappa}}
\renewcommand{\alpha}{\ensuremath{\upalpha}}
\renewcommand{\beta}{\ensuremath{\upbeta}}
\renewcommand{\gamma}{\ensuremath{\upgamma}}
\renewcommand{\delta}{\ensuremath{\updelta}}
\renewcommand{\varepsilon}{\ensuremath{\upvarepsilon}}
\renewcommand{\zeta}{\ensuremath{\upzeta}}
\renewcommand{\eta}{\ensuremath{\upeta}}
\renewcommand{\theta}{\ensuremath{\uptheta}}
\renewcommand{\vartheta}{\ensuremath{\upvartheta}}
\renewcommand{\iota}{\ensuremath{\upiota}}
\renewcommand{\kappa}{\ensuremath{\upkappa}}
\renewcommand{\lambda}{\ensuremath{\uplambda}}
\renewcommand{\mu}{\ensuremath{\upmu}}
\renewcommand{\nu}{\ensuremath{\upnu}}
\renewcommand{\xi}{\ensuremath{\upxi}}
\renewcommand{\pi}{\ensuremath{\uppi}}
\renewcommand{\varpi}{\ensuremath{\upvarpi}}
\renewcommand{\rho}{\ensuremath{\uprho}}
\renewcommand{\varrho}{\ensuremath{\upvarrho}}
\renewcommand{\sigma}{\ensuremath{\upsigma}}
\renewcommand{\varsigma}{\ensuremath{\upvarsigma}}
\renewcommand{\tau}{\ensuremath{\uptau}}
\renewcommand{\upsilon}{\ensuremath{\upupsilon}}
\renewcommand{\varphi}{\ensuremath{\upvarphi}}
\renewcommand{\chi}{\ensuremath{\upchi}}
\renewcommand{\psi}{\ensuremath{\uppsi}}
\renewcommand{\omega}{\ensuremath{\upomega}}

%%% operators
\DeclareMathOperator{\supp}{supp}
\DeclareMathOperator{\wt}{wt}
\DeclareMathOperator{\len}{len}
\DeclareMathOperator{\argmin}{argmin}
\DeclareMathOperator{\im}{}
\DeclareMathOperator{\ord}{ord}
\DeclareMathOperator{\rank}{rank}
\newcommand{\getsR}{\mathrel{\overset{\$}{\gets}}}

\newcommand*{\vect}[1]{\boldsymbol{#1}} %% разметка для выделения векторов
\newcommand*{\vectrow}[1]{\overrightarrow{\boldsymbol{#1}}}  %% разметка для векторов-строк
\newcommand*{\vectcol}[1]{\boldsymbol{#1^{\downarrow}}}      %% разметка для векторов-столбцов
\newcommand*{\matr}[1]{\boldsymbol{#1}}     %% разметка для выделения матриц
\newcommand*{\code}[1]{\mathcal{#1}}        %% разметка для выделения линейных кодов

%%%!!! масштабирование формулы
\newcommand\scalemath[2]{\scalebox{#1}{\mbox{\ensuremath{\displaystyle #2}}}}
%%%%

%%%%%%% Frametitle design
% \setbeamercolor{structure}{fg=cyan!90!cyan}
% \setbeamertemplate{frametitle}
% {
%   \setbeamercolor{palette quaternary}{bg=NavyBlue!5}
%   \setbeamercolor{titlelike}{parent=palette quaternary}
%     \nointerlineskip
%     \begin{beamercolorbox}[sep=0.3cm,ht=1.8em,wd=\paperwidth]{frametitle}
%         \vbox{}\vskip-1ex%
%         \strut\insertframetitle\strut
%         % \vskip-0.8ex%
%         \hfill
%         \raisebox{-1ex}{\includegraphics[width=2cm]{images/msu-cmc-logo}}
%     \end{beamercolorbox}
% }

\definecolor{blue}{RGB}{34,185,255}
\definecolor{red}{RGB}{255,34,75}
\definecolor{yellow}{RGB}{255,214,34}
\definecolor{green}{RGB}{34,255,104}
\definecolor{purple}{RGB}{255,34,185}
\definecolor{orange}{RGB}{255,104,34}
\definecolor{background}{RGB}{255,253,218}

%%%%%%% Красивое оформление математических окружений
% \RequirePackage{thmtools}
\setbeamertemplate{theorems}[numbered]  % using theorem numbering
\setbeamertemplate{caption}[numbered]   % numbering captions of tables
                                % and figures
\newtheorem{proposition}{\translate{Proposition}}
\newtheorem*{proposition*}{\translate{Proposition}}
\newtheorem*{theorem*}{\translate{Theorem}}
\newtheorem*{lemma*}{\translate{Lemma}}
\newtheorem*{corollary*}{\translate{Corollary}}
\theoremstyle{definition}
\newtheorem{remark}{\translate{Remark}}
\newtheorem*{example*}{\translate{Example}}
% \useinnertheme{rounded}

\setbeamercolor{structure}{fg=red}

\BeforeBeginEnvironment{definition}{
  \setbeamercolor{block title}{fg=white, bg=orange!70!black}
  \setbeamercolor{block body}{fg=black, bg=orange!5!white}
}

\BeforeBeginEnvironment{theorem}{
  \setbeamercolor{block title}{fg=white, bg=red!70!black}
  \setbeamercolor{block body}{fg=black, bg=red!5!white}
}
\BeforeBeginEnvironment{theorem*}{
  \setbeamercolor{block title}{fg=white, bg=red!70!black}
  \setbeamercolor{block body}{fg=black, bg=red!5!white}
}

\BeforeBeginEnvironment{lemma}{
  \setbeamercolor{block title}{fg=white, bg=red!70!black}
  \setbeamercolor{block body}{fg=black, bg=red!5!white}
}
\BeforeBeginEnvironment{lemma*}{
  \setbeamercolor{block title}{fg=white, bg=red!70!black}
  \setbeamercolor{block body}{fg=black, bg=red!5!white}
}

\BeforeBeginEnvironment{corollary}{
  \setbeamercolor{block title}{fg=white, bg=red!70!black}
  \setbeamercolor{block body}{fg=black, bg=red!5!white}
}
\BeforeBeginEnvironment{corollary*}{
  \setbeamercolor{block title}{fg=white, bg=red!70!black}
  \setbeamercolor{block body}{fg=black, bg=red!5!white}
}

\BeforeBeginEnvironment{proposition}{
    \setbeamercolor{block title}{fg=white, bg=red!70!black}
  \setbeamercolor{block body}{fg=black, bg=red!5!white}
}

\BeforeBeginEnvironment{proposition*}{
  \setbeamercolor{block title}{fg=white, bg=red!70!black}
  \setbeamercolor{block body}{fg=black, bg=red!5!white}
}

\BeforeBeginEnvironment{proof}{
  \setbeamercolor{block title}{fg=structure.fg, bg=red!5!white}
  \setbeamercolor{block body}{fg=black, bg=red!5!white}
}


\BeforeBeginEnvironment{remark}{
  \setbeamercolor{block title}{fg=white, bg=purple!70!black}
  \setbeamercolor{block body}{fg=black, bg=purple!5!white}
}

%%% Example block
\setbeamercolor{block title example}{fg=white, bg=blue!70!black}
\setbeamercolor{block body example}{fg=black, bg=blue!5!white}



\addtobeamertemplate{block example begin}{}{
  \setbeamercolor{itemize item}{fg=blue!70!black}%
  \setbeamercolor{itemize subitem}{fg=blue!70!black}%
  \setbeamercolor{itemize subsubitem}{fg=blue!70!black}%
  \setbeamercolor{enumerate item}{fg=blue!70!black}%
  \setbeamercolor{enumerate subitem}{fg=blue!70!black}%
  \setbeamercolor{enumerate subsubitem}{fg=blue!70!black}%
}

%%% Example without numbering
\BeforeBeginEnvironment{example*}{
  \setbeamercolor{block title}{fg=white, bg=blue!70!black}%
  \setbeamercolor{block body}{fg=black, bg=blue!5!white}%
  \setbeamercolor{itemize item}{fg=blue!70!black}%
  \setbeamercolor{itemize subitem}{fg=blue!70!black}%
  \setbeamercolor{itemize subsubitem}{fg=blue!70!black}%
  \setbeamercolor{enumerate item}{fg=blue!70!black}%
  \setbeamercolor{enumerate subitem}{fg=blue!70!black}%
  \setbeamercolor{enumerate subsubitem}{fg=blue!70!black}%
}

\newenvironment{transitionframe}{
  \setbeamercolor{background canvas}{bg=yellow}
  \begin{frame}}{
    \end{frame}
}


%%%%%%%%%%%%%%%%%%%Содержание%%%%%%%%%%%%%%%%%%%%%%%%%%

\newtranslation[to=Russian]{Outline}{План}

\setbeamertemplate{section in toc}[sections numbered]
\setbeamertemplate{subsection in toc}[subsections numbered]

\AtBeginDocument{%
%%%%  Print title page
{
  \setbeamercolor{author}{fg=blue!50!black}
  \setbeamercolor{institute}{fg=blue!50!black}
  \setbeamercolor{date}{fg=blue!50!black}
  
  \usebackgroundtemplate{%
    \begin{tikzpicture}[remember picture,overlay]
      \node [opacity=0.2, xshift=7cm,yshift=3cm] at (current page.south west){
        \includegraphics[ width=1.3\textwidth, keepaspectratio
        ]{images/msu-cmc-logo.png}};
    \end{tikzpicture}
  } 
  \begin{frame}
    \titlepage
  \end{frame}
}

 \begin{frame}<beamer>
    \frametitle{\translate{Outline}}
    \tableofcontents[currentsection,currentsubsection]
 \end{frame}

 \OUTLINE
}

%%%%%%%%%%%%%%%%%%% Печатаем библиографию%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtEndDocument{%
  \begin{frame}[noframenumbering,plain,allowframebreaks]{Список
      литературы}
    \printbibliography[heading=none]
  \end{frame}
}

%%%%%%%% Logo
% \pgfdeclareimage[height=0.7cm]{university-logo}{images/msu-cmc-logo}
