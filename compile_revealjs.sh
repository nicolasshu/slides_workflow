#!/usr/bin/bash
file=$1

# Get the filename
filename=${file%.*}
ext=${file##*.}
outfile="${file%.*}.html"

echo "Reading: $file"
echo "Making:  $outfile"
# /usr/bin/pandoc --standalone qlearning.md --from=markdown --to=revealjs -s -o ./qlearning.html -V revealjs-url=./reveal.js -V center=false -V theme=moon --slide-level=2 --incremental --highlight-style=pygments --mathjax=https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js
pandoc $file \
    --from=markdown \
    --to=revealjs \
    -o $outfile \
    --standalone \
    --template=custom_styles/nicks_template.html \
    -V revealjs-url=./reveal.js \
    --incremental \
    -V center=false \
    -V theme=moon \
    --slide-level=3 \
    --highlight-style=breezedark \
    --mathjax=https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js \
    -V controls=true \
    -V progress=true \
    -V slideNumber=true \
    -V transition=none \

# -s, --standalone
# -f, --from=FORMAT
# -t, --to=FORMAT (e.g. revealjs, beamer)

# -V, --variable=KEY    Set values. E.g.
# -V center=false
# -V history=false
# -V revealjs-url=../reveal.js
# -V theme=moon (for Reveal.js)
# -i, --incremental

# --slide-level=2 makes "#" be the main slide, and "##" be the subslide
# --slide-level=3 makes "##" be the main slide, and "###" be the subslide

# -V controls=BOOLEAN defines whether you show the controls in the bottom 
# -V progress=BOOLEAN shows the progress bar in the bottom 
# -V slideNumber=BOOLEAN shows the slide number
