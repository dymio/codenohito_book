macOS Sierra installation for Rails development
===============================================

* Update software

* Disable automatically spelling correction: System Preferences -> Keyboard ->
    "Text" tab -> uncheck "Correct spelling automatically"

* Show keychain icon in status bar: in the preferences of 'Keychain Access'
    application check 'Show keychain status in menu bar'

* Install Xcode Command Line Tools:

        xcode-select --install

* Install [Homebrew](https://brew.sh):

        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

* Install Git (you already have Git installed with Xcode Command Line Tools
    but we need newer version) and configure it:

        brew install git
        # restart session
        git config --global user.name "George Clooney"
        git config --global user.email somename@example.com
        git config --global alias.co checkout
        git config --global alias.br branch
        git config --global alias.ci commit
        git config --global alias.st status
        git config --global color.ui true

    Several files will be added in directory `/usr/local/etc/bash_completion.d`.
    They will be usefull later, when tuning '.bash_profile'.

* Install [ImageMagick](http://www.imagemagick.org) for image processing
    and [FFmpeg](https://ffmpeg.org) for video processing:

        brew install imagemagick
        brew install ffmpeg

* Install PostgreSQL DBMS, using [Postgres.app](https://postgresapp.com).
    Do not forget to make all the installation process described on website.
    Configuring $PATH is important for correct 'pg' gem work:

        sudo mkdir -p /etc/paths.d && echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp

* Install GPG:

        brew install gpg
        command curl -sSL https://rvm.io/mpapis.asc | gpg --import -

* Install [RVM](https://rvm.io):

        \curl -sSL https://get.rvm.io | bash -s stable

* Configure gem environment to avoid downloading documentation during install:

        echo "gem: --no-document" >> ~/.gemrc

* Add to `~/.bash_profile`:

        # Git terminal extentions
        source /usr/local/etc/bash_completion.d/git-completion.bash
        source /usr/local/etc/bash_completion.d/git-prompt.sh

        # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
        export PATH="$PATH:$HOME/.rvm/bin"
        # Load RVM into a shell session *as a function*
        [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

        # Terminal prompt (with RVM and Git additionals)
        export PS1='$(~/.rvm/bin/rvm-prompt v p g) \u:\w$(__git_ps1 " (%s)")\$ '


        ## Aliases

        alias rubyserver='ruby -run -e httpd . -p 9090'
        alias lastmodifiedfiles='find . -type f -print0 | xargs -0 stat -f "%m %Sm %N" -t "%Y.%m.%d %H:%M" | sort -rn | head -3'

        # rails aliases
        alias berk='bundle exec rake'
        alias bereset='bundle exec rake db:drop db:create db:migrate db:seed && bundle exec rails server'
        alias bers='bundle exec rails'
        alias bespec='bundle exec rspec spec'
        alias becp='bundle exec cap'

* Setup SSH:

        $ ssh-keygen -t rsa -C "somename@example.com"

    Add new ssh public key to Github, Beanstalk, Bitbucket and other services.


Software recomendations
-----------------------

* [iTerm](https://www.iterm2.com/)

    Recommend to check "Reuse previous session's directory" in 'Profiles' tab
    in the application preferences.

* [Sublime Text](http://www.sublimetext.com/) _as code editor_

    Recommend to set this settings:

        {
            "font_size": 12,
            "rulers": [80, 140],
            "tab_size": 2,
            "translate_tabs_to_spaces": false,
            "detect_indentation": false,
            "auto_match_enabled": false,
            "draw_white_space": "selection",
            "trim_trailing_white_space_on_save": true,
            "fallback_encoding": "Cyrillic (Windows 1251)",
            "default_encoding": "UTF-8",
            "auto_complete": false,
            "drag_text": false,
            "open_files_in_new_window": false
        }

    Use [Package Control](https://packagecontrol.io) for extending redactor.

* [Cyberduck](https://cyberduck.io) _as FTP, SFTP client_
* [Marked 2](http://marked2app.com) _as markdown reader_
* [Transmission](https://transmissionbt.com) _as torrent tracker_
* [VLC](http://www.videolan.org) _as media player_
* [DaisyDisk](https://daisydiskapp.com) _as disk space analyzer_
* [Gemini](https://macpaw.com/gemini) _as duplicate finder_
* [TunnelBear](https://www.tunnelbear.com/) _as easy VPN tunelling tool_
* [Parallels Desktop](http://www.parallels.com/ru/products/desktop/) _as virtualization tool_
* TheUnarchiver _as richer data decompressor then macOS default_


Used materials
--------------

* [Installation guide](http://railsapps.github.io/installrubyonrails-mac.html)
  by Daniel Kehoe (updates frequently)
