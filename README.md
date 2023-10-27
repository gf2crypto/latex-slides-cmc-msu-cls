# latex-slides-cmc-msu-cls
Latex beamer class of Faculty of Computation Mathematics and Cybernetics Lomonosov Moscow State University (CMC MSU).

## Installing

Suppose `slides` is your folder with files of slides.
There are two ways to install this document class;

1. (Copy and paste) Copy the content of this repo to the directory `slides/latex-slides-cmc-msu-cls/`

2. (Git submodule) If you use git you can connect this repo as git submodule, just run in terminal:

```bash
    cd slides
    git submodule add https://github.com/gf2crypto/latex-slides-cmc-msu-cls.git
```

## Using document class.

Add `latex-slides-cmc-msu-cls/cmcbeamer` as documentclass:

```latex
    \documentclass{latex-slides-cmc-msu-cls/cmcbeamer}
```

The follow is small working example:

```latex
    % Preamble
    \documentclass{latex-slides-cmc-msu-cls/cmcbeamer}

    \title{Title}

    \subtitle{Subtitle}

    \author{Author}

    \institute[UNI]{University}

    % \date{\today}

    % Document
    \begin{document}
	\begin{frame}
	   \frametitle{Frame title}

       	   Frame body.
	\end{frame}
    \end{document}
```

## Contributing

Yes, please do!

## License

MIT. Created by Ivan Chizhov (c) 2023.

