#!/bin/bash
main() {

    if [[ $# -ne 1 ]] ; then
        echo "USAGE: $0 <number of the week of interest>";
        return 1;
    fi

    UI="$1";

    # absolute path the the directory this script is in
    # should be OS agnostic
    self="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )";

    fn="week${UI}fall.tex";
    src="${self}/../../tex/${fn}";
    dst="${self}/${fn}";
    tmp="${self}/${fn}.tmp";
    cp "${src}" "${dst}"; # https://stackoverflow.com/questions/46082397/insert-newline-n-using-sed
    # -Ei: will be edited in-place without creating a backup: https://www.gnu.org/software/sed/manual/html_node/Command_002dLine-Options.html#Command_002dLine-Options
   
    # CODE
    sed -E 's/\\end{minted}/{% endhighlight %}/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\begin{minted}{(.*)}/{% highlight \1 %}/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";

    # TITLES
    sed -E 's/\\section{(.*)}/\&nbsp;\&nbsp;\&nbsp;\&nbsp;\n\#\# \1/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\subsection{(.*)}/\&nbsp;\&nbsp;\&nbsp;\n\#\#\# \1/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\subsubsection{(.*)}/\&nbsp;\&nbsp;\n\#\#\#\# \1/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";

    # SAMPLES
    sed -E 's/\\begin{sample}/<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\textcolor{red}{(.*)}/<span style="color:red">\1<\/span>/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\end{sample}/<\/div>/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
   
    # ITEMIZE
    sed -E 's/\\begin{itemize}//g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\item/1./g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\end{itemize}//g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    # sed -E 's/\\begin{itemize}/<ol>/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    # sed -E 's/\\item (.*)/<li>\1<\/li>/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    # sed -E 's/\\end{itemize}/<\/ol>/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";

    # INCLUDEGRAPHICS
    sed -E 's/\\includegraphics.*{images\/(.*)}/{% include img.html src='"'"'\1'"'"' alt='"'"'TODO'"'"' caption='"'"''"'"' %}/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";


    # "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    #
    # TODO: Spencer will update in week 5 prep, but you can add more comments for now
    # EXAMPLE comment and move up a highlight
    # TEXTIT *x*
    # TEXTBF **x**
    # TEXTTT <tt>x</tt>
    # TABLE
    # ``



    # .+? is the shortest string to meet the pattern
    ## TODO: explor this futher... not yet working. Do in vim for now
    # sed -E 's/\\mintinline{c\+\+}{(.+?)}/zzz\1zzz/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    
    echo 'using vim run the following from command mode (esc :)';
    echo '%s/\\mintinline{c++}{\(.*\)}/`\1`/g';

}

main "$@";


