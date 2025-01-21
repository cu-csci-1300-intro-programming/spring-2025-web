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
    cp "${src}" "${dst}";
    # https://stackoverflow.com/questions/46082397/insert-newline-n-using-sed
    # -Ei: will be edited in-place without creating a backup: https://www.gnu.org/software/sed/manual/html_node/Command_002dLine-Options.html#Command_002dLine-Options
   
    sed -E 's/\\end{minted}/{% endhighlight %}/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\begin{minted}{(.*)}/{% highlight \1 %}/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\section{(.*)}/\&nbsp;\&nbsp;\&nbsp;\&nbsp;\n\#\# \1/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\subsection{(.*)}/\&nbsp;\&nbsp;\&nbsp;\n\#\#\# \1/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\subsubsection{(.*)}/\&nbsp;\&nbsp;\n\#\#\#\# \1/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";

    # .+? is the shortest string to meet the pattern
    ## TODO: explor this futher... not yet working. Do in vim for now
    # sed -E 's/\\mintinline{c\+\+}{(.+?)}/zzz\1zzz/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";

    rm "${tmp}";
}

main "$@";


