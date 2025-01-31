#!/bin/bash
main() {

    if [[ $# -ne 1 ]] ; then
        echo "USAGE: $0 <appendix file of interest>";
        return 1;
    fi


    # absolute path the the directory this script is in
    # should be OS agnostic
    self="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )";

    fn="$1";
    src="${self}/../../tex/${fn}";
    dst="${self}/${fn}";
    tmp="${self}/${fn}.tmp";
    cp "${src}" "${dst}";
   
    # HEADER INFO
    sed -E 's/\\chapter\*{(.*)}/---\nlayout: post\ntitle: "\1"\ndate: 2025-01-01 09:00:00 -0700\ncategories: jekyll update\n---/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\addcontentsline.*//g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\setcounter.*//g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";

    # CODE
    sed -E 's/\\end{minted}/{% endhighlight %}/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\begin{minted}{(.*)}/{% highlight \1 %}/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    sed -E 's/\\begin{minted}[breaklines=true]{(.*)}/{% highlight \1 %}/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";

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

    # HREF
    # target="_blank" means open it in a new tab
    sed -E 's/\\textcolor{cyan}{\\href{(.*)}{(.*)}}/<a href="\1" target="_blank">\2<\/a>/g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";

    # "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    # TEXTIT *x*
    # TEXTBF **x**
    # TEXTTT <tt>x</tt>
    # \\mintinline{c\+\+}{x} `x`
    perl -pe 's|\\mintinline{c\+\+}{(.*?)}|`\1`|g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    perl -pe 's|\\textit{(.*?)}|*\1*|g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    perl -pe 's|\\textbf{(.*?)}|**\1**|g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    perl -pe 's|\\texttt{(.*?)}|<tt>\1</tt>|g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";

    # TABLE?
}

main "$@";


