[[ -n "$__DEBUG_STRICT_SH" ]] && return
__DEBUG_STRICT_SH=1

strict_mode() {
  case "${1:-}" in
    on)
      set -e -u -o pipefail
      ;;
    off)
      set +e +u +o pipefail
      ;;
    *)
      ;;
  esac
}
