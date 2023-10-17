[[ -n "$__DEBUG_EXEC_SH" ]] && return
__DEBUG_EXEC_SH=1


debug_exec() {
  debug_msg "${red}exec${white}: $@"
  "$@"
}
