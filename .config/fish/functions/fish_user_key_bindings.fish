function fish_user_key_bindings
  if type -q fzf
    fzf --fish | source
  end
end
