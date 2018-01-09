############################################################################### 
# Pandoc Docker originally based off: 
#     https://github.com/jagregory/pandoc-docker/blob/master/Dockerfile
############################################################################### 

FROM haskell:8.0

LABEL maintainer="jbn@abreka.com"

ARG PANDOC_VERSION="2.0.6"

############################################################################### 
# Setup build environment.
# 
# This is all a but heavy. But, I'll trade off disk-space for painless pdf
# generation every time.
############################################################################### 

RUN apt-get update -y && \
    apt-get install -y python-pip librsvg2-bin git && \
    apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
        texlive-latex-base \
        texlive-xetex latex-xcolor \
        texlive-math-extra \
        texlive-latex-extra \
        texlive-fonts-extra \
        texlive-bibtex-extra \
        texlive-generic-recommended \
        fontconfig \
        lmodern

RUN cabal update && \
    cabal install pandoc-${PANDOC_VERSION} pandoc-citeproc && \
    pip install pandocfilters
