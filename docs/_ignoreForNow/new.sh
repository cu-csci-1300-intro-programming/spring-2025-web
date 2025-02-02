#!/bin/bash
main() {

    if [[ $# -ne 1 ]] ; then
        echo "USAGE: $0 <number of the week of interest>"
        return 1
    fi

    UI="$1"
    tex_ext=".tex"
    md_ext=".md"

    # Absolute path to the directory this script is in
    self="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

    fn="project${UI}fall2024"
    echo "Processing ${fn}${tex_ext}..."
    src="${self}/../../tex/${fn}${tex_ext}"
    dst="${self}/test_${fn}${md_ext}"
    tmp="${self}/${fn}.tmp"
    cp "${src}" "${dst}"

    # CODE
    sed -E 's/\\end\{minted\}/{% endhighlight %}/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\begin\{minted\}\{(.*)\}/{% highlight \1 %}/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # TITLES
    sed -E 's/\\section\{(.*)\}/\&nbsp;\&nbsp;\&nbsp;\&nbsp;\n\#\# \1/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\subsection\{(.*)\}/\&nbsp;\&nbsp;\&nbsp;\n\#\#\# \1/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\subsubsection\{(.*)\}/\&nbsp;\&nbsp;\n\#\#\#\# \1/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # SAMPLES
    sed -E 's/\\begin\{sample\}/<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\textcolor\{red\}\{(.*)\}/<span style="color:red">\1<\/span>/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\end\{sample\}/<\/div>/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # ITEMIZE
    sed -E 's/\\begin\{itemize\}(\[.*\])?//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\item/1./g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\end\{itemize\}//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # ENUMERATE
    sed -E 's/\\begin\{enumerate\}(\[.*\])?//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\end\{enumerate\}//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # INCLUDEGRAPHICS
    sed -E 's/^[[:space:]]*\\includegraphics.*\{images\/(.*)\}/{% include img.html src='"'"'\1'"'"' alt='"'"'TODO'"'"' caption='"'"''"'"' %}/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # Inline Code (Mintinline)
    sed -E 's/\\mintinline\{c\+\+\}\{(.+?)\}/`\1`/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # TEXTBF -> Bold (**text**)
    sed -E 's/\\textbf\{([^}]*)\}/**\1**/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # TEXTTT -> Monospace (<tt>text</tt>)
    sed -E 's/\\texttt\{(.*)\}/<tt>\1<\/tt>/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # FIGURE
    sed -E 's/\\begin\{figure\}\[.*\]//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\end\{figure\}//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\centering//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # EXTRA TAGS
    sed -E 's/\\caption\{.*\}//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/\\label\{.*\}//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"


    # TITLE
    TODAY=$(date +'%Y-%m-%d')
    sed -E 's/\\chapter\*\{([^}]*)\}/---\nlayout: post\ntitle: "\1"\ndate: '"$TODAY"'\ncategories: jekyll update\n---/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/^\\addcontentsline\{.*\}//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/^\\setcounter\{.*\}//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    
    # MATH
    # sed 's/\\\[\(.*\)\\\]/$$\1$$/' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -z 's/\\\[\(.*\)\\\]/$$\1$$/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"



    # --
    sed -E '/\\begin\{longtable\}/d; /\\end\{longtable\}/d' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E '/\\begin\{sampleProject\}/d; /\\end\{sampleProject\}/d' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E '/\\begin\{table\}/d; /\\end\{table\}/d' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E '/\\begin\{tabular\}/d; /\\end\{tabular\}/d' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # Remove all \hline lines and \hspace
    sed -E 's/^[[:space:]]*[\\]*[[:space:]]*\\hline//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"
    sed -E 's/^[[:space:]]*[\\]*[[:space:]]*\\hspace\{([^}]*)\}//g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # Convert \newline to <br> (for line breaks in Markdown cells)
    sed -E 's/\\newline/<br>/g' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"

    # Process table rows (lines containing &)
    sed -E '/[[:space:]]&/ {
        s/^[[:space:]]*//
        s/[[:space:]]*\\\\[[:space:]]*$//
        s/[[:space:]]*&[[:space:]]*//g
        /^$/d
        s/^/| /
        s/$/ |/
    }' "${dst}" > "${tmp}" && mv "${tmp}" "${dst}"


    perl -pe 's|\\mintinline{c\+\+}{(.*?)}|`\1`|g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    perl -pe 's|\\textit{(.*?)}|*\1*|g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    perl -pe 's|\\textbf{(.*?)}|**\1**|g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";
    perl -pe 's|\\texttt{(.*?)}|<tt>\1</tt>|g' "${dst}" > "${tmp}" ; mv "${tmp}" "${dst}";


    echo 'Processing complete. Your file has been converted.'
}

main "$@"
