#!/bin/bash
set -e

run_lilypond-book () {

    for file in ${@:-lilypond/*.tex}
    do       
        lilypond-book \
        --pdf \
        --output lilypond-tex \
        --lily-output-dir lilypond-tex/out \
        --left-padding 0 \
        --use-source-file-names \
        $file
    done
}

run_pdflatex () {
    for file in ${@:-mappe[0-9]*.tex}
    do
        pdflatex \
        -interaction=nonstopmode \
        -shell-escape \
        -halt-on-error \
        $file 
    done
}

action=$1
shift

case $action in

    lilypond-book)
        run_lilypond-book $@
        ;;

    pdflatex)
        run_pdflatex $@
        ;;

    *)
        echo provide mode: \'lilypond-book\' or \'pdflatex\'
        ;;


esac
