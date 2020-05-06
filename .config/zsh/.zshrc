# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

plugins=(
	git
	docker
	docker-compose
	)

source "$ZSH/oh-my-zsh.sh"

PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Configs
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias zshconfig="$EDITOR ~/.config/zsh/.zshrc"

# COMPOSER
composer () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $(pwd):/app \
        composer "$@"
}

# DOCKER
alias dockeron="sudo systemctl start docker"
alias dockeroff="sudo systemctl stop docker"
alias dc="docker-compose"
d-exec () {
    # Used for entering docker image bash
    docker exec -it "$1" sh
}
alias docker-bench-security="docker run -it --net host --pid host --userns host --cap-add audit_control \
    -e DOCKER_CONTENT_TRUST=$DOCKER_CONTENT_TRUST \
    -v /var/lib:/var/lib \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/lib/systemd:/usr/lib/systemd \
    -v /etc:/etc --label docker_bench_security \
    docker/docker-bench-security"

#GIT
alias commit="git commit -am"
alias pushu="git push -u origin"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

#MONGOSHELL
mongorestore() {
  docker run \
    --rm \
    -v $PWD:/app \
    -w /app \
    -u mongodb \
    mongo \
    mongorestore "$@"
}
mongodump() {
  docker run \
    --rm \
    -v $PWD:/app \
    -w /app \
    -u mongodb \
    mongo \
    mongodump "$@"
}

#NGROK es. ngrok web_service_container
ngrok() {
  docker run --rm -it --link "$1":http wernight/ngrok ngrok http http:80
}

# Download .m3u8 video streams
# https://stackoverflow.com/questions/32528595/ffmpeg-mp4-from-http-live-streaming-m3u8-file
streamDownload() {
    ffmpeg -i "$1" -c copy -bsf:a aac_adtstoasc movie.mp4
}

# NeoVim alias
alias vim="nvim"

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * / =
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"
bindkey -s "^[OX" "="
