#!/Users/mbloch/opt/anaconda3/bin/python
import argparse
import os

parser = argparse.ArgumentParser()
parser.add_argument("slidename", type=str, help="Base name of md file for slides")
parser.add_argument("--website", action="store_true", help="Uses links to reveal.js and Mathjax.js on website")
parser.add_argument("--board", action="store_true", help="Loads a board slidename.json")
args = parser.parse_args()

slidesmd= args.slidename + ".md"
slideshtml= args.slidename + ".html"

my_command = "pandoc -s "

if args.website:
    my_command = my_command + "--mathjax=../../assets/mathjax/MathJax.js -i -t revealjs " + slidesmd + " --include-in-header=leftalign.md --template=template.md -V center=false -V history=false -V revealjs-url=../../assets/reveal.js "
else:
    my_command = my_command + "--mathjax=../mathjax/MathJax.js -i -t revealjs " + slidesmd + " --include-in-header=leftalign.md --template=template.md -V center=false -V history=false -V revealjs-url=../reveal.js "

if args.board:
    slidesjson= args.slidename + ".json"
    my_command = my_command + "-V loadchalkboard=" + slidesjson + " "

my_command = my_command + "-o " + slideshtml    

#if args.website:
#    my_command = "pandoc -s --mathjax=../../assets/mathjax/MathJax.js -i -t revealjs " + slidesmd + " -V center=false -V history=false -V  -V loadchalkboard=" + slidesjson + " -V revealjs-url=../../assets/reveal.js --include-in-header=leftalign.md --template=template.md -o" + slideshtml
#else:
#    my_command = "pandoc -s --mathjax=../mathjax/MathJax.js -i -t revealjs " + slidesmd + " -V center=false -V loadchalkboard=" + slidesjson + " -V revealjs-url=../reveal.js --include-in-header=leftalign.md --template=template.md -o" + slideshtml
print(my_command)    
os.system(my_command)  
