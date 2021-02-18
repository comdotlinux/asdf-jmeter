function absolute_dir_path {
    local absolute_path
    absolute_path="$( cd -P "$( dirname "$1" )" && pwd )"
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

prompt_command() {
  if [[ "${PWD}" == "${LAST_PWD}" ]]; then
    return
  fi
  LAST_PWD="${PWD}"
  asdf_update_jmeter_home
}

export PROMPT_COMMAND="${PROMPT_COMMAND:+${PROMPT_COMMAND}; prompt_command}"
export PROMPT_COMMAND="${PROMPT_COMMAND:-prompt_command}"