#[ -t 1 ] && [ -x "$(command -v zsh)" ] && exec zsh
alias ls='lsd'
. "$HOME/.cargo/env"

setsecret() {
  local varname=$1
  read -s "$varname?Enter value for $varname: "
  echo
  export $varname
}
