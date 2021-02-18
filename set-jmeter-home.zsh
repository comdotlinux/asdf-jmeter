function absolute_dir_path {
  local absolute_path
  absolute_path="$(cd -P "$(dirname "$1")" && pwd)"
  echo "$absolute_path"
}

asdf_update_jmeter_home() {
  local jmeter_path
  jmeter_path="$(asdf which jmeter)"
  if [[ -n "${jmeter_path}" ]]; then
    export JMETER_HOME
    JMETER_HOME="$(dirname "$(absolute_dir_path "${jmeter_path}")")"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_jmeter_home
