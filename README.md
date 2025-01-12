# spring-2025-web
Our webpage and workbook for the course

## Running locally
bundle exec jekyll serve --livereload # read result for server location

## Editing
- basically only write the _posts.
- _config.yaml is the settings of the webpage.

## VSCode recommended plugins
- Liquid Language Support
- ???

## Install
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
    - from there you shouldn't need to follow the tutorial further. for the sake of using this tool locally
    - ???

## Tutorial
- https://jekyllrb.com/tutorials/video-walkthroughs/

