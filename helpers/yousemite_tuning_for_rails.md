Tuning clean Mac OS X Yosemite for Rails developer
==================================================

* Update OS

* Install applications:
    - XCode
    - iTerm
    - Skype
    - Google Chrome
    - Firefox
    - ImageOptim
    - Sublime Text, RubyMine *as code editor*

* Optional applications:
    - Photoshop
    - TheUnarchiver
    - Sparrow, Airmail *as email client*
    - Cyberduck *as FTP, SFTP client*
    - Marked *as markdown reader*
    - Dash
    - YandexDisk, Dropbox *as cloud storage*
    - Sequel Pro, pgAdmin as *database admin tool*
    - Skitch *as screenshoter*
    - Transmission *as torrent tracker*
    - VLC *as media player*
    - DaisyDisk *as disk space analyzer*
    - Gemini *as duplicate finder*

* Disable automatically spelling correction: Preferences -> Keyboard -> Text -> "Correct spelling automatically"

* Show hidden files in Finder:

    ```
    $ defaults write com.apple.finder AppleShowAllFiles TRUE
    $ killall Finder
    ```

* Show keychain icon in status bar:
    - launch 'Keychain Access' application
    - in the preferences check 'Show keychain status in menu bar'

* Do with XCode:
    - launch and agree with license
    - install Command Line Tools

        ```
        $ xcode-select --install
        ```

* Set iTerm preferences: Preferences -> Profile -> General -> Working directory -> check "Reuse previous session's directory"

* Install Homebrew:

    ```
    $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    $ brew doctor
    ```

* Install RVM:

    ```
    $ \curl -sSL https://get.rvm.io | bash -s stable
    ```

* Install ruby:

    ```
    $ rvm install ruby-head
    ```

* Install git:
    ```
    $ brew install git
    $ git config --global user.name "George Clooney"
    $ git config --global user.email somename@example.com
    $ git config --global pull.rebase true
    $ git config --global color.ui true
    $ git config --global alias.st status
    $ git config --global alias.ci commit
    $ git config --global alias.co checkout
    $ git config --global alias.br branch
    ```

* Install more tools:

    ```
    $ brew install imagemagick
    $ brew install ffmpeg
    ```

* Install PostgreSQL database:

    Use [Postgres.app](http://postgresapp.com/) instead postgresql from homebrew.
    For correct work of `pg` gem add lines to `~/.bash_profile`:

    ```
    # Postgres.app path
    export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
    ```

* Add to `~/.bash_profile`:

    ```
    # git completion and prompt (can find files at [git repository](https://github.com/git/git/tree/master/contrib/completion))
    source ~/.bash_extentions/git-completion.bash
    source ~/.bash_extentions/git-prompt.sh
    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

    # rvm completion and prompt
    [[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
    PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"

    # rails aliases
    alias berk='bundle exec rake'
    alias bers='bundle exec rails'
    alias bereset='bundle exec rake db:drop db:create db:migrate db:seed && bundle exec rails server'
    alias bespec='bundle exec rspec spec'
    alias becp='bundle exec cap'
    alias bemm='bundle exec middleman'
    alias behk='bundle exec heroku'

    # other aliases
    alias rubyserver='ruby -run -e httpd . -p 9090'
    alias subl="/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2"
    alias redis='redis-server /usr/local/etc/redis.conf'
    ```

* Setup SublimeText:
    - Register :)
    - Install [package manager](https://sublime.wbond.net/installation)
    - Install Slim with package manager
    - Install CoffeeScript with package manager
    - Install Sass with package manager
    - Install [Polarise color scheme](https://github.com/dymio/polarise_color_scheme)
    - Update preferences:

        ```
        {
          "auto_complete": false,
          "auto_match_enabled": false,
          "color_scheme": "Packages/Color Scheme - Default/Polarise.tmTheme",
          "fallback_encoding": "Cyrillic (Windows 1251)",
          "font_size": 12.0,
          "ignored_packages":
          [
            "Vintage"
          ],
          "open_files_in_new_window": false,
          "rulers":
          [
            80,
            140
          ],
          "tab_size": 2,
          "translate_tabs_to_spaces": true,
          "word_wrap": true
        }
        ```

* SSH:

    ```
    $ ssh-keygen -t rsa -C "somename@example.com"
    ```

* Add new ssh public key to Github, Beanstalk, Bitbucket
