%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para os cursos de Física da Universidade Federal de Pelotas
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Alexandre Diehl, diehl@ufpel.edu.br
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fisufpel-abntex2}[24/10/2019 v1.1 Modelo dos cursos de Fisica da UFPel, baseado em abnTeX2]

%==============================================================================
%
% Tipos de documentos suportados por este modelo
%
%==============================================================================

\newcommand{\titulacao}{Bacharel em F{\'\i}sica}

\DeclareOption{tccProposta}{ % Proposta de TCC
  \typeout{--------------> Opcao: Redação de Proposta de TCC}
  \newcommand{\intencao}{apresentada}
  \newcommand{\resultado}{aprovada}
  \gdef\@tcc{true}
  \gdef\@notincludeorientadorbanca{true}  % true se o orientador NÃO estiver na banca
  \gdef\@includeorientadorbanca{false}    % true se o orientador estiver na banca
}
\DeclareOption{tccRedacao}{ % TCC
  \typeout{--------------> Opcao: Redação do TCC}
  \newcommand{\intencao}{apresentado}
  \newcommand{\resultado}{aprovado}
  \newcommand{\product}{Monography}
  \newcommand{\program}{Bachelor in Physics}
  \gdef\@tcc{true}
  \gdef\@notincludeorientadorbanca{true}  % true se o orientador NÃO estiver na banca
  \gdef\@includeorientadorbanca{false}    % true se o orientador estiver na banca
}
\DeclareOption{relatorioEstagio}{ % Relatorio de Estágio
  \typeout{--------------> Opcao: Redação do Relatório de Estágio Supervisionado}
  \newcommand{\intencao}{apresentado}
  \newcommand{\cosupervisor}[1]{\gdef\@cosupervisor{#1}}
  \newcommand{\supervisor}[2]{\gdef\@supervisorgenero{#1} \gdef\@supervisornome{#2}}
  \gdef\@tcc{false}
}
%
% Repassa todos os parametros a classe abntex2
%
\DeclareOption*{   
  \PassOptionsToClass{\CurrentOption}{abntex2}   
}
\ProcessOptions\relax
\LoadClass{abntex2}

%\let\newfloat\undefined
%\usepackage{floatrow}

\usepackage[utf8]{inputenc}   % usa padrão unicode. Permite escrever palavras acentuadas e cedilha diretamente (padrão no abntex2)
\usepackage[T1]{fontenc}      % permite copiar textos com acentos (do PDF, por exemplo)

%\usepackage[showframe,pass]{geometry}   % Habilitar para ver as margens

\setlrmarginsandblock{3cm}{2cm}{*}   % margem esquerda e direita
\setulmarginsandblock{3cm}{2cm}{*}   % margem superior e inferior
\checkandfixthelayout                % garante que a mudança das margens foi feita

\usepackage{tocloft}    % change table of contents
\usepackage{lastpage}   % necessário para que o Resumo, Abstract e Ficha Catalográfica contenham o número da última página do documento
\usepackage{lscape}     % virar página para tabelas
\usepackage{longtable}  % tabelas com mais de 1 página
\usepackage{afterpage}  % para movimentação da pagina landscape
\usepackage{mathptmx}        % Usar fonte Adobe Times Roman (texto e equações) como padrão (substitui pacote times) 
\usepackage{pdfpages}        % Usar quando for adicionar a folha de aprovação assinada
\usepackage{graphicx}        % Usar para incluir figuras
%\usepackage{float}          % Permite travar as figuras usando o parametro [H]
\usepackage{makeidx}         % Usar para criar indexação no texto
\usepackage{lipsum}          % Cria um texto padrão para teste
\usepackage{microtype} 	     % para melhorias de justificação
\usepackage{icomma}          % para colocar espaços em números decimais com vírgula
\usepackage{units}           % para o uso de frações
%\usepackage{boxhandler}

%\usepackage{showframe}   % colocar moldura nas páginas

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  importar fonte Helvética (mais próxima da fonte Arial, exigido pela UFPel)
%
%     usamos opção [scaled=0.86] if you wish to load an Helvetica clone
%                        for the sans-serif font (Helvetica ou Avant Garde), scaled to match the x-height of Adobe Times Roman
%
\usepackage[scaled=0.86]{helvet}  % importa pacote Helvética (não muda a fonte automaticamente)
%
%     mudar o modo texto para fonte sans serif (Helvetica ou Avant Garde) como padrão
%               --- não muda a fonte usada nas equações.
%
\renewcommand*\familydefault{\sfdefault}

%%
%% pacotes exigidos para inserir Código Fonte de Programas (Fortran, C, C++, Pascal, tcl, phyton, etc)
%% 
\usepackage{verbatim}
\usepackage{xcolor}
\usepackage{color}
\usepackage{listings}   % pacote de codigos de linguagens

%
% Fonte usada no texto do conteúdo das tabelas (o padrão abntex2 é footnotesize)
%
\renewcommand{\IBGEtabfontsize}{\normalsize}   % troca para 12pt 
%

%
% redefine o comando \fonte para colocar Fonte : , ao invés do travessão que é padrão na abntex2, Fonte --
%
\renewcommand{\fonte}[2][\fontename]{ %
  \M@gettitle{#2}%
  \memlegendinfo{#2}%
  \par
  \begingroup
  \@parboxrestore
  \if@minipage
  \@setminipage
  \fi
  \ABNTEXfontereduzida
  \configureseparator      % isto está comentado no abntex2.cls
  % \captiondelim{\ABNTEXcaptionfontedelim}   % esta é a opção do abntex2.cls
  \@makecaption{\ABNTEXfontereduzida #1}{\ignorespaces\ABNTEXfontereduzida #2}\par
  \endgroup}
%
%  modificações na classe abntex2 para retirar os espaços no sumário, entre referências e para apêndices e anexos
% 
\renewcommand{\tocpartapendices}{%
  \addtocontents{toc}{\protect\vspace{-15pt}}   % para retirar o espaço vertical antes de APÊNDICES
  \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
  \cftinserthook{toc}{A}}

\renewcommand{\tocpartanexos}{%
  \addtocontents{toc}{\protect\vspace{-15pt}}    % para retirar o espaço vertical antes de ANEXOS
  \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
  \cftinserthook{toc}{A}}
% 
% Formatação de código-fonte
% 
\renewcommand{\lstlistingname}{C\'odigo}              % Altera o nome padrão do rótulo usado no comando \autoref{}
\renewcommand{\lstlistlistingname}{Lista de Códigos}  % Altera o rótulo a ser usando no bookmark do PDF
%
% Configura a ``Lista de Códigos'' conforme as regras da ABNT (para abnTeX2)
%
\begingroup\makeatletter
\let\newcounter\@gobble\let\setcounter\@gobbletwo
  \globaldefs\@ne \let\c@loldepth\@ne
  \newlistof{listings}{lol}{\lstlistlistingname}
  \newlistentry{lstlisting}{lol}{0}
\endgroup

\renewcommand{\cftlstlistingaftersnum}{\hfill--\hfill}

\let\oldlstlistoflistings\lstlistoflistings
\renewcommand{\lstlistoflistings}{%
    \begin{center}
    \vspace*{\stretch{0}}\textbf{\MakeUppercase{\lstlistlistingname}}  
  \end{center}
   \begingroup%
   \let\oldnumberline\numberline%
   \renewcommand{\numberline}{\lstlistingname\space\oldnumberline}%
   \@starttoc{lol}
   %\oldlstlistoflistings%
   \endgroup
}
%
% configuração para a Listagem de Códigos Fonte (usando pacote listings)
%
\lstset{
  language=fortran,        % tipos de linguagem::: tcl,fortran,C,Pascal,tex 
  basicstyle=\ttfamily,    % \tiny, \small (outras opções)
  %keywordstyle=\color{jpurple}\bfseries,
  %stringstyle=\color{red},
  %commentstyle=\color{verde},
  %morecomment=[s][\color{blue}]{/**}{*/},
  extendedchars=true, 
  %showspaces=false, 
  %showstringspaces=false,
%  linewidth=13cm,        % largura do ambiente do código
  numbers=left,           % posição para a numeração das linhas
  numberstyle=\tiny,      % estivo para os números
  frame=leftline,         % moldura para a lista
  breaklines=true,        % quebra automática para linhas longas
  backgroundcolor=\color{yellow!25}, 
  breakautoindent=true,   % indentação automática para linhas quebradas
  abovecaptionskip=10pt,  % espaço vertical acima da legenda 
  belowcaptionskip=10pt,  % espaço vertical abaixo da legenda
  captionpos=t,           % posição para a legenda (t ou b)
  xleftmargin=15pt,        % margem extra do lado esquerdo
  resetmargins=true,      % indentação para o ambiente da lista
  tabsize=3
}

%\usepackage[debug,pagebackref=true,breaklinks,bookmarksopen=true,colorlinks=true,linkcolor=bblue,citecolor=bblue,urlcolor=bblue,bookmarksnumbered=true,hyperindex=true,verbose=true]{hyperref} %% essential %% gera pdf/dvi com links
\usepackage{hyperref}      % construir remissões internas e hyper documento 
\usepackage{caption}  
\captionsetup{   % setup para figuras, códigos e tabelas
  position=top,               % coloca a legenda acima da Figura
  format=hang,                % indentação da legenda: segunda linha começa abaixo do início do texto da primeira linha
  font=footnotesize,          % tamanho da fonte para toda a legenda
  labelfont=sf,               % (sf: sans serif) afeta apenas o label e o separador da legenda
  labelsep=endash,            % endash: coloca -- antes do texto da legenda
  justification=justified,    % raggedright (left alingned), justified (legenda como um parágrafo normal, default)  
  figurewithin=chapter,       % coloca o número do capítulo na numeração das figuras
  tablewithin=chapter,        % coloca o número do capítulo na numeração das tabelas
  singlelinecheck=off         % off: não centraliza legendas curtas. on: centraliza
}

\usepackage[
  alf-fisufpel,                  % tipo de citação (alf-fisufpel -> (NOME, ano)  num -> numérico 
  abnt-emphasize=bf,             % seleciona o estilo de fonte no grifo: em (padrão) e bf
  abnt-full-initials=yes,        % prenomes por extenso (quando disponível na base): padrão é no
  abnt-etal-cite=3,              % controla o uso de et al. na citação dentro do texto
  abnt-etal-list=3,              % controla o uso de et al. na lista de referências
  abnt-etal-text=it,             % texto a ser usado quando a lista de autores é abreviada
  abnt-repeated-title-omit=no,   % permite suprimir o título que aparece repetidas vezes (opção no para ajustar com NBR 6023 de 2018)
  abnt-show-options=warn,        % controla como são mostradas as opções: no, warn, list
  abnt-verbatim-entry=no,        % permite mostrar na lista de referências toda a entrada no modo verbatim
  abnt-repeated-author-omit=no,  % permite suprimir o título que aparece repetidas vezes (opção no para ajustar com NBR 6023 de 2018)
  abnt-thesis-year=both          % controla a posição do ano numa entrada do tipo mastersthesis, phdthesis e monography
]{abntex2cite-fisufpel}

\renewcommand{\bibsection}{  %  para inserir Referências em CAIXA ALTA no Sumário
    \chapter*{\bibname}
    \bibmark
    \ifnobibintoc\else
    \phantomsection
    \addcontentsline{toc}{chapter}{\uppercase{\bibname}}
    \fi
    \prebibhook
}

%   para colocar (???) na referência à equações, através do comando \autoref
\newcommand*{\myeqref}[2][Eq.~]{%
  \hyperref[{#2}]{#1(\ref*{#2})}%
}
\def\equationautorefname#1#2\null{%
  equação#1(#2\null)%
}

\newcommand{\autorefanexo}[1]{\hyperref[#1]{anexo~\ref{#1}}}

% Executa o comando #2 se o argumento #1 não estiver vazio, senão executa #3
\newcommand{\UFPelifnotempty}[3]{\ifthenelse{\not\equal{#1}{}}{#2}{#3}}

%
% Edicao dos capitulos ========================================
%
\renewcommand{\ABNTEXchapterfont}{\fontseries{b}}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}

%\renewcommand{\ABNTEXsectionfont}{\fontseries{m}}  
\renewcommand{\ABNTEXsectionfont}{\fontseries{b}}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsectionfont}{\fontseries{m}}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsectionfont}{\fontseries{m}}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\fontseries{m}}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

\renewcommand{\tocheadstart}{\ABNTEXchapterfont}       % mesma fonte do capítulo no sumário 
\renewcommand{\tocheadstart}{\ABNTEXsectionfont}       % mesma fonte da seção no sumário
\renewcommand{\tocheadstart}{\ABNTEXsubsectionfont}    % mesma fonte da subseção no sumário
\renewcommand{\tocheadstart}{\ABNTEXsubsubsectionfont}

\setlength{\ABNTEXsignwidth}{12cm}  % comprimento da linha de assinatura para a folha de aprovação (o padrão do abntex2 é 8cm)

\AtBeginDocument{
  \renewcommand{\apendicesname}{AP\^ENDICES} % modifica nome do ínicio da parte de apêndices
}
\renewcommand{\apendicename}{AP\^ENDICE}  % modifica o conteúdo da macro que precede o nome dado ao capítulo de apêndice

\AtBeginDocument{
  \renewcommand{\anexosname}{ANEXOS}  % modifica nome do ínicio da parte de anexos
}
\renewcommand{\anexoname}{ANEXO}  % modifica o conteúdo da macro que precede o nome dado ao capítulo de apêndice

%\renewcommand {\chaptername}{\appendixname}

\addto\captionsbrazil{ % alterações no pacote babel
  \renewcommand{\listfigurename}{Lista de Figuras}  % altera o nome padronizado por babel no bookmark do PDF
  \renewcommand{\listtablename}{Lista de Tabelas}   % altera o nome padronizado por babel no bookmark do PDF
  \renewcommand{\contentsname}{Sum\'ario}
  \renewcommand{\pageautorefname}{p\'agina}    % redefine a forma de uso do comando \autoref
  \renewcommand{\figureautorefname}{figura}
  % \renewcommand{\listingautorefname}{c\'odigo}
  \renewcommand{\tableautorefname}{tabela}
   \renewcommand{\chapterautorefname}{cap{\'\i}tulo}
  \renewcommand{\sectionautorefname}{se{\c c}\~ao}
  \renewcommand{\subsectionautorefname}{subse{\c c}\~ao}
  \renewcommand{\subsubsectionautorefname}{subse{\c c}\~ao}
  \renewcommand{\paragraphautorefname}{par\'agrafo}
  \renewcommand{\appendixautorefname}{ap\^endice}
%  \renewcommand{\anexautorefname}{anexo}
}

\setlength\afterchapskip{\baselineskip}  % insere espaço de 1,5 entre o título da seção primária e o texto

\setlength{\parskip}{0.0cm}       %  espaçamento entre parágrafos (ABNT não sugere espaços entre parágrafos)
%\setlength{\onelineskip}{0.2cm}

\setlength{\parindent}{1.25cm}    %  espaço entre a margem esquerda e o início da frase de cada parágrafo

\usepackage{indentfirst}   % indenta o primeiro parágrafo de cada seção

%\makeatletter
\hypersetup{  %  informações do PDF
  pdfcreator={LaTeX with abnTeX2},
  pdfkeywords={abnt}{latex}{abntex}{abntex2}{trabalho acadêmico}, 
  colorlinks=false,       % false: boxed links; true: colored links
  linkcolor=blue,        % color of internal links
  citecolor=blue,        % color of links to bibliography
  filecolor=magenta,     % color of file links
  urlcolor=blue,
  pdfborder={0 0 0},
  bookmarksdepth=4
}  
%\makeatother
% =================================================================================

% novos comandos para o título e subtítulo
\newcommand*{\subtitulo}[1]{\gdef\@subtitulo{#1}}
\newcommand*{\subtitleA}[1]{\gdef\@subtitleA{#1}}
%
% novos comando para o preambulo
% \autortrabalho{Sobrenome}{Nome}
\newcommand{\autortrabalho}[2]{\gdef\@autorlast{#1} \gdef\@autorname{#2}}

\newcommand{\nomeorientador}[2]{\gdef\@orientadorlast{#1} \gdef\@orientadorname{#2}}

\newcommand{\nomecoorientador}[2]{\gdef\@coorientadorlast{#1} \gdef\@coorientadorname{#2}}

\newcommand{\bibliotecario}[2]{\gdef\@CRB{#1} \gdef\@biblioname{#2}}

\newcommand*{\titleA}[1]{\gdef\@titleA{#1}}

\newcommand{\curso}[1]{\gdef\@curso{#1}}       % Curso
\newcommand{\imprimircurso}{\@curso} 
\newcommand*{\unidade}[1]{\gdef\@unidade{#1}}  % Unidade
\newcommand*{\disciplina}[1]{\gdef\@disciplina{#1}}  % Disciplina

\newcommand{\cutter}[1]{\gdef\@cutter{#1}}     % Cutter
\newcommand{\CDD}[1]{\gdef\@CDD{#1}}     % CDD

\newcommand{\areadeconcentracao}[1]{\gdef\@areadeconcentracao{#1}}
\newcommand{\datadefesa}[1]{\gdef\@datadefesa{#1}}

\newcommand{\nomeresumo}{Resumo}%
\newcommand{\nomeabstract}{Abstract}%

\newcommand*{\autorUltimoNome}[1]{\gdef\@autorUltimoNome{#1}}
\newcommand*{\autorPrimeiroNome}[1]{\gdef\@autorPrimeiroNome{#1}}

\newcommand{\oautor}{o autor (\the\year).}
%
% Criação de variaveis
% ======================================================================================

% Palavras chaves (portugues)
\newcommand{\chaveA}[1]{\gdef\@chaveA{#1}} \chaveA{}
\newcommand{\chaveB}[1]{\gdef\@chaveB{#1}} \chaveB{}
\newcommand{\chaveC}[1]{\gdef\@chaveC{#1}} \chaveC{}
\newcommand{\chaveD}[1]{\gdef\@chaveD{#1}} \chaveD{}
\newcommand{\chaveE}[1]{\gdef\@chaveE{#1}} \chaveE{}
\newcommand{\chaveF}[1]{\gdef\@chaveF{#1}} \chaveF{}
\newcommand{\chaveG}[1]{\gdef\@chaveG{#1}} \chaveG{}
\newcommand{\chaveH}[1]{\gdef\@chaveH{#1}} \chaveH{}
\newcommand{\chaveI}[1]{\gdef\@chaveI{#1}} \chaveI{}
\newcommand{\chaveJ}[1]{\gdef\@chaveJ{#1}} \chaveJ{}

% Imprime as palavras chaves
\newcommand{\imprimirpalavraschaves}{%
        \abntex@ifnotempty{\@chaveA}{1. \@chaveA. }%
        \abntex@ifnotempty{\@chaveB}{2. \@chaveB. }%
        \abntex@ifnotempty{\@chaveC}{3. \@chaveC. }
        \abntex@ifnotempty{\@chaveD}{4. \@chaveD. }%
        \abntex@ifnotempty{\@chaveE}{5. \@chaveE. }%
        \abntex@ifnotempty{\@chaveF}{6. \@chaveF. }%
        \abntex@ifnotempty{\@chaveG}{7. \@chaveG. }%
        \abntex@ifnotempty{\@chaveH}{8. \@chaveH. }%
        \abntex@ifnotempty{\@chaveI}{9. \@chaveI. }%
        \abntex@ifnotempty{\@chaveJ}{10. \@chaveJ. }}

% Imprime as palavras chaves
\newcommand{\imprimirpalavraschavesR}{%
        \abntex@ifnotempty{\@chaveA}{\@chaveA. }%
        \abntex@ifnotempty{\@chaveB}{\@chaveB. }%
        \abntex@ifnotempty{\@chaveC}{\@chaveC. }
        \abntex@ifnotempty{\@chaveD}{\@chaveD. }%
        \abntex@ifnotempty{\@chaveE}{\@chaveE. }%
        \abntex@ifnotempty{\@chaveF}{\@chaveF. }%
        \abntex@ifnotempty{\@chaveG}{\@chaveG. }%
        \abntex@ifnotempty{\@chaveH}{\@chaveH. }%
        \abntex@ifnotempty{\@chaveI}{\@chaveI. }%
        \abntex@ifnotempty{\@chaveJ}{\@chaveJ. }}

% Palavras chaves (portugues)
\newcommand{\keywordA}[1]{\gdef\@keywordA{#1}} \keywordA{}
\newcommand{\keywordB}[1]{\gdef\@keywordB{#1}} \keywordB{}
\newcommand{\keywordC}[1]{\gdef\@keywordC{#1}} \keywordC{}
\newcommand{\keywordD}[1]{\gdef\@keywordD{#1}} \keywordD{}
\newcommand{\keywordE}[1]{\gdef\@keywordE{#1}} \keywordE{}
\newcommand{\keywordF}[1]{\gdef\@keywordF{#1}} \keywordF{}
\newcommand{\keywordG}[1]{\gdef\@keywordG{#1}} \keywordG{}
\newcommand{\keywordH}[1]{\gdef\@keywordH{#1}} \keywordH{}
\newcommand{\keywordI}[1]{\gdef\@keywordI{#1}} \keywordI{}
\newcommand{\keywordJ}[1]{\gdef\@keywordJ{#1}} \keywordJ{}

\newcommand{\imprimirpalavraschavesA}{%
        \abntex@ifnotempty{\@keywordA}{\@keywordA. }%
        \abntex@ifnotempty{\@keywordB}{\@keywordB. }%
        \abntex@ifnotempty{\@keywordC}{\@keywordC. }
        \abntex@ifnotempty{\@keywordD}{\@keywordD. }%
        \abntex@ifnotempty{\@keywordE}{\@keywordE. }%
        \abntex@ifnotempty{\@keywordF}{\@keywordF. }%
        \abntex@ifnotempty{\@keywordG}{\@keywordG. }%
        \abntex@ifnotempty{\@keywordH}{\@keywordH. }%
        \abntex@ifnotempty{\@keywordI}{\@keywordI. }%
        \abntex@ifnotempty{\@keywordJ}{\@keywordJ. }}      
% ========================================================================================       
%        
% Banca
\newcommand{\titulacaoorientador}[1]{\gdef\@titulacaoorientador{#1}}
\titulacaoorientador{}
\newcommand{\membroA}[3]{\gdef\@tituloA{#1} \gdef\@nomeA{#2} \gdef\@instituicaoA{#3}}
\membroA{}{}{}
\newcommand{\membroB}[3]{\gdef\@tituloB{#1} \gdef\@nomeB{#2} \gdef\@instituicaoB{#3}}
\membroB{}{}{}
\newcommand{\membroC}[3]{\gdef\@tituloC{#1} \gdef\@nomeC{#2} \gdef\@instituicaoC{#3}}
\membroC{}{}{}
% ========================================================================================
% Configuração da Capa
% ======================================================================
\renewcommand{\imprimircapa}{  % para gerar uma capa no padrão da UFPel, diferente do padrão da abntex2
  \begin{capa}
    \pdfbookmark[0]{Capa}{}    % inclui o termo CAPA apenas no PDF (não entra no Sumário)
                {\vspace*{\stretch{0}}{\centering\normalfont\normalsize\bfseries\MakeUppercase \imprimirinstituicao  \\
                    \@unidade \\ \@curso \par }}{}
                {\vspace*{\stretch{0.5}}\centering{\includegraphics[width=2cm]{logoUFPel}}\par}
                {\vspace*{\stretch{1}}{\centering\normalfont\normalsize\bfseries \imprimirtipotrabalho \par }}{}
                {\vspace*{\stretch{3}}{\centering\bfseries\normalsize \imprimirtitulo \abntex@ifnotempty{\@subtitulo}{: \@subtitulo}\par}}
                {\vspace*{2cm}{\centering\normalfont\normalsize\bfseries\@author\par}}
                {\vspace*{\stretch{5}}{\centering\normalfont\normalsize\bfseries\imprimirlocal{,}{ } \@date\par}}
                \vspace*{1cm}
  \end{capa}
} 
% ======================================================================
% Configuração folha de rosto
% ======================================================================
\renewcommand{\folhaderostocontent}{ % para gerar uma folha de rosto no padrão da UFPel, diferente do padrão da abntex2
  \begin{center}
        \vspace*{\stretch{0}}\textbf{{\@author}}  % Imprime o nome do autor
        \\
        \vspace*{4cm}                            % Distancia entre o nome e o titulo       
        \textbf{{\imprimirtitulo}\abntex@ifnotempty{\@subtitulo}{: \@subtitulo}}   % Imprime o titulo
        \vspace*{2cm}                            % Distancia entre o titulo e o preambulo
        \\
        \ifthenelse{\equal{\@tcc}{true}}{ 
          {\hspace{.45\textwidth}                  % Tamanho do preambulo em porcentagem
            \begin{minipage}{.50\textwidth}        %        ____________________________________________________
                                                   %  margem|<------------------45%----------------->|preambulo| |margem
                                                   %  margem|         |preambulo <--50%--> do tamanho da pagina| |margem
              \begin{SingleSpace}
                \imprimirtipotrabalho{} {\intencao} ao {\@unidade} da {\imprimirinstituicao}, como requisito parcial \`a obten{\c c}\~ao do t{\'\i}tulo de {\titulacao}.
              \end{SingleSpace}
            \end{minipage}}
          \vspace*{2cm}
          
          \imprimirorientadorRotulo: \imprimirorientador % Imprime o orientador
          \vspace*{1cm}
         
          \abntex@ifnotempty{\imprimircoorientadorRotulo}{\imprimircoorientadorRotulo: \imprimircoorientador} % Coorientador (se houver)
       }{
         {\hspace{.45\textwidth}              % Tamanho do preambulo em porcentagem
           \begin{minipage}{.50\textwidth}    %        ____________________________________________________
                                              % margem|<------------------45%----------------->|preambulo| |margem
                                              % margem|         |preambulo <--50%--> do tamanho da pagina| |margem
             \begin{SingleSpace}
               Relatório de \imprimirtipotrabalho{} {\intencao} ao {\@curso} do {\@unidade} da {\imprimirinstituicao}, sob a supervisão \UFPelifnotempty{\@cosupervisor}{dos docentes {\@supervisornome} e {\@cosupervisor}}{\UFPelifnotempty{\@supervisorgenero}{da}{do} docente {\@supervisornome}}, como requisito parcial para aprovação na disciplina de {\@disciplina}.
             \end{SingleSpace}
           \end{minipage}}
       }
       \vfill
       
        {\imprimirlocal{,}{ }\imprimirdata}    % LOCAL, ano
        \vspace*{1cm}                       % Distancia entre o ano e a margem inferior
      \end{center}
 
} 
%============================================================================================
% Ficha Catalografica
%============================================================================================
\newcommand{\imprimirfichacatalografica}{      % para gerar uma Ficha Catalográfica no padrão da UFPel
  \begin{fichacatalografica}                   % ambiente do abntex2
%    \pdfbookmark[0]{Ficha Catalográfica}{}    % inclui o termo Ficha Catalográfia apenas no PDF (não entra no Sumário)
%    \begin{center}
      \vspace*{\stretch{1}}
      % \vspace*{16cm}             % Distancia da ficha catolografica e a margem superior
      \centerline{Universidade Federal de Pelotas / Sistema de Bibliotecas}
      \centerline{Cataloga\c c\~ao na Publica\c c\~ao}
      \medskip
      
      \framebox[12.5cm]{\begin{minipage}[c]{12.5cm}
          \begin{tabular}{p{0.8cm}p{10.5cm}}
            &                                                         \\
            \@cutter & \@autorlast, \@autorname                                \\
            & \qquad \imprimirtitulo{}\abntex@ifnotempty{\@subtitulo}{: \@subtitulo} / {\imprimirautor}; {\imprimirorientador}, orientador\abntex@ifnotempty{\imprimircoorientador}{{; }{\imprimircoorientador}, coorientador}. -- \imprimirlocal, \imprimirdata.\\
            & \qquad \pageref{LastPage}~f.: il.                       \\
            &                                                         \\
            & \qquad \imprimirtipotrabalho{} (\@curso) -- {\@unidade}, {\imprimirinstituicao}, {\the\year}.   \\
            &                                                         \\
            & \qquad \imprimirpalavraschaves I. \@orientadorlast, \@orientadorname, orient. \UFPelifnotempty{\imprimircoorientador}{{II.} {\@coorientadorlast, \@coorientadorname}, coorient. III. T{\'\i}tulo.}{II. T{\'\i}tulo.}               \\
            & \hfill CDD: {\@CDD} \\
          \end{tabular}              
        \end{minipage}}
      \medskip

      \centerline{Elaborada por {\@biblioname} CRB: \@CRB}
      \vspace*{1cm}
%    \end{center}
  \end{fichacatalografica}
\newpage
} 
% ================================================================================================
% Folha de Aprovação
% ================================================================================================
\newcommand{\imprimirfolhadeaprovacao}{  % para gerar uma Folha de Aprovação no padrão da UFPel
  \begin{folhadeaprovacao}    % ambiente do abntex2
    \begin{center}
      \OnehalfSpacing
      \vspace*{\stretch{0}}\centering\@author \par       % Imprime o Nome do Autor
       \vspace{\onelineskip}
       \vspace{\onelineskip}
      
      {\imprimirtitulo}\abntex@ifnotempty{\@subtitulo}{: \@subtitulo}\par  % Imprime o titulo
    \end{center}
      \vspace{\onelineskip}
      \vspace{\onelineskip}
      
      \begin{SingleSpace}
        \noindent { }{\imprimirtipotrabalho} \resultado, como requisito parcial para obten{\c c}\~ao do grau de \titulacao, {\@unidade}, {\imprimirinstituicao}.
      \end{SingleSpace}
      %            {\hspace{.45\textwidth}                             % Tamanho do prembulo
      %            \begin{minipage}{.50\textwidth}                     %
      %                \imprimirpreambulo
      %                \SingleSpacing
      %                Área de concentração: \@areadeconcentracao
      %            \end{minipage}}
       \vspace{\onelineskip}
       \vspace{\onelineskip}
       
      \noindent Data da defesa: \@datadefesa \par
      \vspace{\onelineskip}
      \vspace{\onelineskip}
      
      \noindent Banca Examinadora:\par
        \vspace{\onelineskip}

%       \OnehalfSpacing

        \ifthenelse{\equal{\@includeorientadorbanca}{true}}{ 
          \assinatura{\imprimirorientador{} (\imprimirorientadorRotulo)\\
            {\@titulacaoorientador} -- {\imprimirinstituicao} }
        }
        
        \vspace*{0.8cm}
     
        \assinatura{\@nomeA{} \\
          {\@tituloA} -- \@instituicaoA} 
       \vspace*{0.8cm}
       
       \assinatura{\@nomeB{} \\
       {\@tituloB} -- \@instituicaoB} 
       \vspace*{0.8cm}
       
       \ifthenelse{\equal{\@notincludeorientadorbanca}{true}}{
         \assinatura{\@nomeC{} \\
       {\@tituloC} -- \@instituicaoC}
   }
   
 \end{folhadeaprovacao}
} 
% ================================================================================================
% Dedicatoria 
% ===============================================================================================
\renewenvironment{dedicatoria}{   %
  \cleardoublepage
%  \pdfbookmark[0]{Dedicatória}{}
  \begin{flushright}\ \vfill\begin{minipage}{.6\textwidth}}
    {\end{minipage}\vfill\end{flushright} \vspace*{2cm}\cleardoublepage
}
                 
% ===============================================================================================    
% Agradecimentos
% ===============================================================================================
\renewenvironment{agradecimentos}{%
  \newpage
%  \pdfbookmark[0]{Agradecimentos}{}
    \begin{center}
        \vspace*{\stretch{0}}\textbf{\MakeUppercase{Agradecimentos}}
        \SingleSpacing
    \end{center}
}{\cleardoublepage}
% ===============================================================================================
% Epigrafe
% ===============================================================================================
\renewenvironment{epigrafe}{%
%  \pdfbookmark[0]{Epígrafe}{}
    \begin{flushright}\ \vfill\begin{minipage}{.6\textwidth}}
    {\end{minipage}\vfill\end{flushright} \vspace*{2cm}\cleardoublepage
  }
% 
% ===============================================================================================
% Resumo Portugues
% ===============================================================================================
    \renewenvironment{resumo}{%
      \newpage
      \pdfbookmark[0]{\nomeresumo}{nomeresumo} % nome na lista de tópicos do PDF
  \begin{center}
    \vspace*{\stretch{0}}\textbf{\MakeUppercase{Resumo}}  
  \end{center} 
  
  \begin{SingleSpace}
    \begin{flushleft}
    \noindent {{\MakeUppercase\@autorlast}, \@autorname. {\bfseries  \imprimirtitulo}\abntex@ifnotempty{\@subtitulo}{: \@subtitulo}. \ \imprimirorientadorRotulo: \imprimirorientador.
      \abntex@ifnotempty{\imprimircoorientadorRotulo}{\imprimircoorientadorRotulo: \imprimircoorientador.}\ \@date. \pageref{LastPage}~f. {\imprimirtipotrabalho} (\@curso) -- Instituto de Física e Matemática, Universidade Federal de Pelotas, Pelotas, \ \@date .}
    \end{flushleft}
  \end{SingleSpace}
    }{
  \noindent Palavras-chave: \imprimirpalavraschavesR
  \cleardoublepage  % ends the current page. In a two-sided printing style, it also makes the next page a right-hand (odd-numbered) page,
                    %     producing a blank page if necessary. 
} 

% Resumo Ingles
% ===============================================================================================
\renewenvironment{abstract}{%
\newpage 
     \pdfbookmark[0]{\nomeabstract}{nomeabstract} % nome na lista de tópicos do PDF
  \begin{center}
    \vspace*{\stretch{0}}\textbf{\MakeUppercase{Abstract}}
  \end{center}
  
  \begin{SingleSpace}%
    \begin{flushleft}
    \noindent {{\MakeUppercase\@autorlast}, \@autorname. {\bfseries  \@titleA}\abntex@ifnotempty{\@subtitleA}{: \@subtitleA}. Advisor: \imprimirorientador.
      \abntex@ifnotempty{\imprimircoorientadorRotulo}{Coadvisor: \imprimircoorientador.}\ \@date. \pageref{LastPage}~p. {\product} ({\program}) -- Instituto de Física e Matemática, Universidade Federal de Pelotas, \ \@date .}
    \end{flushleft}
  \end{SingleSpace}
                    
}{%
  \noindent Keywords: \imprimirpalavraschavesA
  \cleardoublepage
} 

% Lista de Figuras ==============================================================================

\renewcommand{\listoffigures}{%
    \cleardoublepage
    %%    \chapter*{\MakeUppercase{\listfigurename}}
    \pdfbookmark[0]{\listfigurename}{lof}
      \begin{center}
    \vspace*{\stretch{0}}\textbf{\MakeUppercase{\listfigurename}}
  \end{center}
%%    \chapter*{{\listfigurename}}
%%    \SingleSpacing
    \@starttoc{lof}
%%      \newpage\ %\clearpage %\setlinespacing
%%  \pdfbookmark[0]{\listfigurename}{lof}
%%      \listoffigures*
      \cleardoublepage
}

\renewcommand{\listoftables}{%
    \cleardoublepage
   %%    \chapter*{\MakeUppercase{\listtablename}}
    \pdfbookmark[0]{\listtablename}{lot}
        \begin{center}
    \vspace*{\stretch{0}}\textbf{\MakeUppercase{\listtablename}}
  \end{center}
%%    \chapter*{{\listtablename}}
%%    \SingleSpacing
    \@starttoc{lot}
    % \newpage\ %\clearpage %\setlinespacing
    \cleardoublepage
}

% Lista de Abreviaturas e Siglas ================================================================
\renewenvironment{siglas}{%
    \cleardoublepage
    \begin{center}
     \vspace*{\stretch{0}}\textbf{\MakeUppercase{Lista de Abreviaturas e Siglas}}
     
%     \DoubleSpacing
    \end{center}
%    \SingleSpacing
    \begin{description}[font=\textnormal]
}{\end{description} \cleardoublepage} 
% ===============================================================================================

\newcommand{\simbol}[2]{#1 & -- & #2 \\}
% Lista de Simbolos ================================================================
\renewenvironment{simbolos}{%
    \cleardoublepage
    \begin{center}
     \vspace*{\stretch{0}}\textbf{\MakeUppercase{Lista de Símbolos}}  
%     \DoubleSpacing
    \end{center}
%    \SingleSpacing
    \begin{enumerate}[labelsep=1cm]  %[font=\textnormal]
}{\end{enumerate}\cleardoublepage}   %FIM LISTA DE Simbolos
% ===============================================================================================

% SUMARIO ==========================================

\newcommand\samepagechapter{
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}%

\setcounter{tocdepth}{3}
\newif\if@aftertoc
\@aftertocfalse

%\renewcommand{\tableofcontents}{%
%  \pdfbookmark[0]{\contentsname}{toc}
%      \begin{center}
%     \vspace*{\stretch{0}}\textbf{\contentsname}  
%    \end{center}
%%  \chapter*{\contentsname}
%  \thispagestyle{empty}
%  \vspace{0.4\baselineskip}
%  \@starttoc{toc}\@aftertoctrue%
 %% \newpage\
%  \cleardoublepage
%  \thispagestyle{empty}
%}
%
%   redefinições da classe abntex2 para a produção do Sumário da UFPel
%
\renewcommand{\cftdot}{.}
\renewcommand{\cftchapterfont}{\bfseries} % negrito
\renewcommand*{\cftchapterleader}{\fontseries{m}\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftchapterformatpnum}{\fontseries{m}}
\renewcommand{\cftsectionfont}{\bfseries}  % negrito
\renewcommand*{\cftsectionleader}{\fontseries{m}\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftsectionformatpnum}{\fontseries{m}}
\renewcommand{\cftsubsectionfont}{\fontseries{m}}
\renewcommand*{\cftsubsectionleader}{\fontseries{m}\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftsubsectionformatpnum}{\fontseries{m}}
\renewcommand{\cftsubsubsectionfont}{\fontseries{m}}
\renewcommand*{\cftsubsubsectionleader}{\fontseries{m}\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftsubsubsectionformatpnum}{\fontseries{m}}
%\renewcommand{\cftsubsubsubsectionfont}{\fontseries{m}}
%\newcommand*{\cftsubsubsubsectionleader}{\fontseries{m}\cftdotfill{\cftsubsubsectiondotsep}}
\renewcommand*{\cftpartdotsep}{cftdotfill{\cftdotsep}}
\renewcommand{\cftpartfont}{\bfseries}      
%\renewcommand{\cftpartpagefont}{\normalsize\fontseries{m}\cftchapterfont}
\renewcommand{\cftpartpagefont}{\normalsize\fontseries{m}}
\renewcommand*{\cftpartleader}{\fontseries{m}\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftparagraphfont}{\normalsize}   % redefine a fonte da subsubsubsection no sumário (o padrão é footnotesize)
%\renewcommand{\cftparagraphdotsep}{\cftdotsep}
%\renewcommand*{\cftparagraphleader}{\fontseries{m}\cftdotfill{\cftchapterdotsep}}

%\setlength{\cftchapternumwidth}{1cm}
%\setlength{\cftsectionnumwidth}{1cm}
%\setlength{\cftsubsectionnumwidth}{1cm}
%\setlength{\cftsubsubsectionnumwidth}{1cm}

%\setlength{\cftchapterindent}{0cm}
%\setlength{\cftsectionindent}{0cm}
%\setlength{\cftsubsectionindent}{0cm}
%\setlength{\cftsubsubsectionindent}{0cm}
%
% número de página no sumário em negrito
%
%\renewcommand{\cftsectionformatpnum}[1]{\textbf{#1}}  
%\renewcommand{\cftsubsectionformatpnum}[1]{\textbf{#1}}
%\renewcommand{\cftsubsubsectionformatpnum}[1]{\textbf{#1}}

% FIM SUMARIO ================================================================================


% AJUSTE DE REFERENCIAS ======================================================================
\renewenvironment{quote}{%
\SingleSpacing
\hspace{.2\textwidth}\begin{minipage}{.7\textwidth}
\footnotesize
}{%
\end{minipage}
\\}
% ============================================================================================ 
