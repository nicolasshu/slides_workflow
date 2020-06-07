# Test to see if no arguments were passed
if [[ $# -eq 0 ]] ; then
    echo "You need to pass a location to create a presentation folder"
    exit 0
fi

# Obtain the project name
projname=$1

# Create the project
mkdir $projname


cp compile_beamer.sh $projname
cp compile_revealjs.sh $projname
cp example.md $projname/slides.md
cp -r reveal.js $projname
cp -r custom_styles $projname
cp -r assets $projname
