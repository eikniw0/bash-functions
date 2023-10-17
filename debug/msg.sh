[[ -n "$__DEBUG_MSG_SH" ]] && return
__DEBUG_MSG_SH=1

debug_msg() {
  case "x$1" in
    'x-n')
      shift 1
      printf "${bold}[${yellow}D${white}] ${}$@${reset}"
      ;;
    *)
      printf "${bold}[${yellow}D${white}] ${}$@${reset}\n"
      ;;
  esac
}

