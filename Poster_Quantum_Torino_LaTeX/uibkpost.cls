\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uibkpost}[2020/02/17 Class for Posters]
% Build on Standard article class
\LoadClass{article}

%%%%%%%%%%%%%%
%% PACKAGES %%
%%%%%%%%%%%%%%
% Require fontspec for fonts
\RequirePackage{fontspec}
% Color package
\RequirePackage[dvipsnames]{xcolor}
% Require Package for custom titling
\RequirePackage{titling}
% Package for key values
\RequirePackage{kvoptions}
% Package for Better environments
\RequirePackage{environ}
% Resize caption width
\RequirePackage[margin=5mm, labelfont=bf]{caption}
% Needs tikz for almost everything
\RequirePackage{tikz}
\usetikzlibrary{positioning}
\usetikzlibrary{calc}
\usetikzlibrary{shapes}
% Needs package graphicx for logos
\RequirePackage{graphicx}
% Package to change background color
\RequirePackage{pagecolor}
% Package Geometry to set size of paper to a0 and get anchors for page
% sides
\RequirePackage[a0paper]{geometry}
% Package for pdf tex commands to compare strings
\RequirePackage{pdftexcmds}
% Package for calculating the widths of the blocks
\RequirePackage{calc}
% Package for testing if funcitons are designed already
\RequirePackage{etoolbox}

%\ProvidesPackage{frutiger}


%%%%%%%%%%%%%
%% OPTIONS %%
%%%%%%%%%%%%%

%newif for qetlabs logo
\newif\ifarticle@qetlabs
\article@qetlabsfalse
% qetlabs option for logo
\DeclareOption{qetlabs}{\article@qetlabstrue}

%newif for cdt logo
\newif\ifarticle@cdt
\article@cdtfalse
% cdt option for logo
\DeclareOption{cdt}{\article@cdttrue}

%newif for quantic logo
\newif\ifarticle@quantic
\article@quanticfalse
% quantic option for logo
\DeclareOption{quantic}{\article@quantictrue}

%newif for dstl logo
\newif\ifarticle@dstl
\article@dstlfalse
% dstl option for logo
\DeclareOption{dstl}{\article@dstltrue}

% newif for UOB logo
\newif\ifarticle@uob
\article@uobfalse
% Option for UOB Logo
\DeclareOption{uob}{\article@uobtrue}

% option for style and color
\SetupKeyvalOptions {family = UIBK, prefix = UIBK@}
\DeclareStringOption{color}
\DeclareStringOption[1]{bottompic}
\ProcessKeyvalOptions*
\ProcessOptions



%%%%%%%%%%%%%%%%%%%%%%%%
% COLOURS CORE PALETTE %
%%%%%%%%%%%%%%%%%%%%%%%%
% (besides black and white)
\definecolor{uibkBlack}{cmyk}{0,0,0,0.9}
\definecolor{uibkGray}{cmyk}{0,0,0,0.6}
\definecolor{uibkOrange}{cmyk}{0,0.5,1,0}
\definecolor{uibkBlue}{cmyk}{1,0.6,0,0.56}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOURS SUPPORTING PALETTE %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{uibkArchitecture}{named}{black}
\definecolor{uibkChemistry}{cmyk}{0,0.7,1,0.1}
\definecolor{uibkPsychology}{cmyk}{1,0,0.5,0}
\definecolor{uibkCultur}{cmyk}{1,0.6,0.52,0.4}
\definecolor{uibkEconomics}{cmyk}{0.8,0,0,0.2}
\definecolor{uibkGeology}{cmyk}{1,0.7,0,0}
\definecolor{uibkTechnology}{cmyk}{0.5,0.65,1,0}
\definecolor{uibkPhil}{cmyk}{0,0.32,1,0.09}
\definecolor{uibkEducation}{cmyk}{0.44,0.78,0.48,0}
\definecolor{uibkPhys}{cmyk}{0.36,0,0.86,0.09}
\definecolor{uibkStatistics}{cmyk}{1,0.8,0,0.35}
\definecolor{uibkLaw}{cmyk}{0.09,1,0.93,0.15}
\definecolor{uibkBio}{cmyk}{0.75,0.05,1,0}
\definecolor{uibkSocial}{cmyk}{0.63,0,0.33,0.45}
\definecolor{uibkTheo}{cmyk}{0.64,0.61,0,0.09}
\definecolor{uibkTeaching}{cmyk}{0,0,1,0.38}
\definecolor{uibkTraining}{cmyk}{0,0,0,0.3}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set different colours for different UIBK styles %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Blue Style
\definecolor{backgroundblue}{named}{white}
\definecolor{titlecolorblue}{named}{uibkBlue}
\definecolor{authorcolorblue}{named}{uibkGray}
\definecolor{hlinecolorblue}{named}{uibkBlue}
\definecolor{blockdrawblue}{named}{uibkBlue}
\definecolor{blocktitletextblue}{named}{white}
\definecolor{blockcontenttextblue}{named}{uibkBlack}
\definecolor{uibkblocktitlefillblue}{named}{uibkBlue}
% Orange Style
\definecolor{backgroundorange}{named}{white}
\definecolor{titlecolororange}{named}{uibkGray}
\definecolor{authorcolororange}{named}{uibkGray}
\definecolor{hlinecolororange}{named}{uibkOrange}
\definecolor{blockdraworange}{named}{uibkOrange}
\definecolor{blocktitletextorange}{named}{white}
\definecolor{blockcontenttextorange}{named}{uibkBlack}
\definecolor{uibkblocktitlefillorange}{named}{uibkOrange}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set the logos for the different styles %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UIBK Style
\def \titlePos {($(current page.north east)-(35cm,4cm)$)}
\def \titleSize {78pt}
\def \titleAnchor {north}
\def \authorSize {48pt}
\def \blocktitleSize {48pt}
\def \blockcontentSize {26pt}
\def \blockcontentFill {white}
\def \backgroundMark {
  \node[anchor=center] (watermark) at ($(current page.west)+(2cm,-2cm)$)
  {\includegraphics[height=0.8\paperheight]{_images/LFUCrest3}};
  \node[anchor=center, minimum height=0.8\paperheight, minimum width=0.8\paperheight,
  fill=white, opacity=.5] at (watermark) {};
}

%University of Innsbruck Logo
\def \logoA {_images/uibkLogo.pdf}
\def \posLogoA {($(current page.north west)+(2cm,-6.5cm)$)}
\def \anchorLogoA {west}
\def \heightLogoA {8cm}

% Command for Bottom line
\def \bottomline {
  % \draw[hlinecolor\UIBK@color, line width=2mm]
  % ($(current page.south west)+(4.2cm, 8cm)$) --
  % ($(current page.south east)+(-4.2cm,8cm)$);
  \node[anchor=center, inner sep=0pt] (bottomline) at
  ($(current page.south)+(0cm,2.43cm)$)
  {\includegraphics[width=\paperwidth]{_images/footer_uib_emql.pdf}};
  %{\includegraphics[width=\paperwidth]{_images/uibk_header\UIBK@bottompic}};
}

% Color to fill the titles of blocks
\def \blocktitleFill {uibkblocktitlefill\UIBK@color}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use above definition to set different colours and fonts %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Declare spacing between left and right and vertical spacing left and
%vertical spacing right
\def \vSpaceLeft {0.25cm}
\def \vSpaceRight {0.25cm}
\def \hSpace {2cm}

% Declare Fonts
%\setmainfont[
%BoldFont=Frutiger-Bold,
%ItalicFont=Frutiger ]{Frutiger}


% set different styles for different nodes
\tikzset{
  title/.style={
    font=\fontsize{\titleSize}{\titleSize}\selectfont,
    color=titlecolor\UIBK@color},
  author/.style={
    font=\fontsize{\authorSize}{\authorSize}\selectfont,
    color=authorcolor\UIBK@color},
  superblock/.style={
    font=\fontsize{\blocktitleSize}{\blocktitleSize}\selectfont,
    text=blocktitletext\UIBK@color,
    draw = blockdraw\UIBK@color,
    line width = 2mm,
    inner sep = \blockcontentSize,
    rounded corners = 40pt,
    align = left,
    rectangle split,
    rectangle split draw splits=false,
    rectangle split parts=2,
    rectangle split part fill = {\blocktitleFill,
      \blockcontentFill}
  },
  abstract/.style={
    superblock,
    minimum width = 0.925\pagewidth,
    text width = 0.925\pagewidth
  },
  block/.style={
    superblock,
    text width = (0.465*\pagewidth-0.5\hSpace-\blockcontentSize),
    minimum width = (0.465*\pagewidth-0.5\hSpace)
  },
  blockcontent/.style={
    font=\fontsize{\blockcontentSize}{\blockcontentSize}\color{blockcontenttext\UIBK@color}\selectfont,
    text=blockcontenttext\UIBK@color}
}

% Set background colour
\pagecolor{background\UIBK@color}

% define logos if they are enabled in UIBK style
% first relax all logos
%\def \logoB {_images/qrcode_arxiv.png}
%\def \posLogoB {($(current page.north east)+(-3.5cm,-7.5cm)$)}
%\def \anchorLogoB {east}
%\def \heightLogoB {6cm}




% Make the page empty
\pagestyle{empty}

\newcommand{\drawlogos}{
  \backgroundMark
  \node[anchor=\anchorLogoA] (logoA) at \posLogoA
  {\includegraphics[height=\heightLogoA]{\logoA}};
  \ifdef{\logoB}{
    \node[anchor=\anchorLogoB] (logoB) at \posLogoB
    {\includegraphics[height=\heightLogoB]{\logoB}};
  }{}
  \ifdef{\logoC}{
    \node[anchor=\anchorLogoC] (logoC) at \posLogoC
    {\includegraphics[height=\heightLogoC]{\logoC}};
  }{}
  \ifdef{\logoD}{
    \node[anchor=\anchorLogoD] (logoD) at \posLogoD
    {\includegraphics[height=\heightLogoD]{\logoD}};
  }{}
  \ifdef{\logoE}{
    \node[anchor=\anchorLogoE] (logoE) at \posLogoE
    {\includegraphics[height=\heightLogoE]{\logoE}};
  }{}
  \ifdef{\logoF}{
    \node[anchor=\anchorLogoF] (logoF) at \posLogoF
    {\includegraphics[height=\heightLogoF]{\logoF}};
  }{}

}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New poster environment for enclosing everyhing in a tikzpicture %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{poster}{
  \begin{tikzpicture}[remember picture, overlay]
    % draw the logos according to the style
    \drawlogos
    \bottomline
  }
  {
  \end{tikzpicture}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New command to make title of poster %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
  \node[anchor=\titleAnchor, title,text width=
  \textwidth, align=center] (title) at \titlePos
  {\textbf{\thetitle}};
  \node[anchor=nort, below=1cm of title, author, text width=
  \textwidth, align=center] (author) {\theauthor};
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New command for abstract of poster %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\abstract}[1]{
  \node[abstract, anchor=north] (abstractblock) at ($(current page.north)-(0cm, 15cm)$){
    Abstract
    \nodepart[blockcontent]{two}
    #1
  };
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New command and counter for the blocks with content of the poster %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{currentBlocksCounterL}
\newcounter{currentBlocksCounterR}

\newcounter{lastBlocksCounterL}
\newcounter{lastBlocksCounterR}

\newcommand{\block}[3]{

  % Relax all the variables in this command to make them clean
  % \relax \side
  % \relax \thisarabic
  % \relax \nodelabel
  % \relax \nodeposition
  % \relax \nodepos
  % \relax \nodeDistance

  % Save the side on which the block is going to go
  \def \side {#1}

  % Save the number of the current and last block on this side
  \ifnum\pdf@strcmp{#1}{r}=0
  \stepcounter{currentBlocksCounterR}
  \def \thisarabic {\arabic{currentBlocksCounterR}}
  \def \lastarabic {\arabic{lastBlocksCounterR}}
  \def \nodeDistance {\vSpaceRight}
  \else
  \stepcounter{currentBlocksCounterL}
  \def \thisarabic {\arabic{currentBlocksCounterL}}
  \def \lastarabic {\arabic{lastBlocksCounterL}}
  \def \nodeDistance {\vSpaceLeft}
  \fi

  % Make a label for this block
  \def \nodelabel {\side \thisarabic}

  % Calculate the position of this block
  \ifnum\pdf@strcmp{\thisarabic}{1}=0
  \ifnum\pdf@strcmp{#1}{r}=0

  % if first and right block
  \def \nodeanchor {north east}
  \coordinate (nodepos) at (abstractblock.south east);
  \else

  % if first and left block
  \def \nodeanchor {north west}
  \coordinate (nodepos) at (abstractblock.south west);

  \fi
  \else
  \ifnum\pdf@strcmp{#1}{r}=0
  % if not first and right block
  \def \nodeanchor {north east}
  \coordinate (nodepos) at (r\lastarabic.south east);
  \else
  % if not first and left block
  \def \nodeanchor {north west}
  \coordinate (nodepos) at (l\lastarabic.south west);
  \fi
  \fi

  \node[block, anchor=\nodeanchor] (\nodelabel) at ($(nodepos)+(0cm,-\nodeDistance)$) {
    #2
    \nodepart[blockcontent]{two}
    #3
  };

  % Increase the counter for the last value
  \ifnum\pdf@strcmp{#1}{r}=0
  \stepcounter{lastBlocksCounterR}
  \else
  \stepcounter{lastBlocksCounterL}
  \fi


}