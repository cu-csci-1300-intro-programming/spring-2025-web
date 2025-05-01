# spring-2025-web
CSCI 1300 webpage hosting the "course workbook". A one stop shop of the course material. This was set up initially due to issue with mass access on overleaf, but also due to accessibility concerns of PDFs.

## Running locally
`bundle exec jekyll serve --livereload`
*  read result for server location

## How To: prep a new week
- launch it locally so you can watch it update: 
    - `cd <root/docs>;`
    - `bundle install && bundle update && bundle exec jekyll serve --livereload;`
        - if an error occurs on bundle update try:
            - `gem clean`
            - move the `Gemfile.lock` somewhere else and restart. This shouldn't be in the version control but have had issues removing it.
- create a new file in `_posts` with form `2025-<MM>-<DDSaturday>-Week-<n>-<title-parts>.markdown`
- transpose the `tex/week<n>fall.tex` file to this new file. Use any previous week as a sample
    - PROTIP: Keep the tex info in separate doc. cut and paste as you go. If the markdown doc has tex in it that fails, then jekyll will fail out and you won't see any updates. The errors are hard to read. They're on the terminal running the webpage locally.
    - `cd <root>/docs/_ignoreForNow/;`
    - `./runMe.sh <n>;` where `<n>` is the week of interest
    - BONUS: if you can get the below to work in the runMe.sh script. currently fails and is commented out. but works on vim
        - e.g. close, but not quite for inline mints `:%s/\\mintinline{c++}{\(.*\)}/`\1`/g` (NOTE doesn't format correctly in MD)
        - supposedly in sed `.+?` will get the shortest first match for you...
    - BONUS: if you can make any further updates to the runMe script like inputing the required Jeckyll front info or table translations, or examples/sample translations.
- confirm that the Table of contents near the top of the page is ordering things as expected. if not, you're missing a `#` in the relevant title. This effects the read order.
- NOTE: that mathjax doesn't always reder the same on the GitHub deployment as it does locally. Use a specific format or load in a screenshot and add alt text...
    - some notes about things we have tried which work locally but fail on GitHub's deployment
    - `<div>$$<mathjax>$$</div>` to obfuscate doesn't work on githubs deployment
    - `\\[ <mathjax> \\]`  to obfuscate doesn't work on githubs deployment
    - resource: https://stackoverflow.com/questions/77794919/load-mathjax-on-github-page-using-jekyll-without-overwriting-layout
        - need to explore this further. Due to time we'll use a screen shot
        



## How To: soft deploy
- time restrictions? TBA
- github
- PR the branch into main
- settings
- Pages
- change the page pointed to
    - if it fails, revert to main immediately before you go to fix the code (so the page works for students) ???doesn't it just keep the most recent successful build deployed? i'm unsure...
- merge, then change to main (to lessen the number of redeploys that occur)


## Editing
- basically only write the _posts.
- _config.yaml is the settings of the webpage and you should be careful when changing this as it may have unexpected consequences
- Anything file directly in the `docs` folder beyond a few prespecified files is automatically  put on the top navigation. If something is WIP or to be used later, please put it in the `_ignoreForNow` folder (e.g. if preping a few things early and not ready to publish them)


## VSCode recommended plugins
- Liquid Language Support


## Install
- Google Jekyll for your machine and update these docs with the tutorial that worked well for you. note relevant speck and any hacks to be aware of
- some older videos: https://jekyllrb.com/docs/installation/
    - doesn't work for a modern mac

### Install MacOS M1 chip
- tutorial: https://www.youtube.com/watch?v=UKB9ylw0G4U 
    - export SDKROOT=$(xcrun --show-sdk-path)
        - should run wihtout any output
    - brew install ruby@3.0
    - echo 'export PATH="/opt/homebrew/opt/ruby@3.0/bin:$PATH"' >> ~/.zshrc
        - if `echo $SHELL` isn't zsh thenput it to .bash_profile...
    - source ~/.zshrc
    - gem install --user-install bundler jekyll
    - from there you shouldn't need to follow the tutorial further. for the sake of using this tool locally (to the best of my knowledge, but if I'm wrong, please update the readme)

### Install Windows
- tutorial: https://www.geeksforgeeks.org/how-to-install-jekyll-on-windows/
    - Note: the tutorial is dated, I just installed the recommended version of Ruby.
    - Make sure to read ahead in instructions to save yourself time.
    - Look at images as there is a step where a needed instruction is only in the image and not the written portion.


## Tutorials
- https://jekyllrb.com/tutorials/video-walkthroughs/ these are a bit dated, but mostly acceptable

