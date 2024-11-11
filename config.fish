if status is-interactive
  set fish_greeting $USER@$HOSTNAME
  oh-my-posh init fish --config $HOME/.config/ohmyposh/bad.toml | source
  zoxide init fish | source

  alias get='sudo dnf install'
  alias ans-rebuild='ansible-playbook -i ~/ansible/inventory.ini ~/ansible/main.yml'
end
