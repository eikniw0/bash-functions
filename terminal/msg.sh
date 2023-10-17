
[[ -n "$__TERMINAL_MSG_SH" ]] && return
__TERMINAL_MSG_SH=1

# colors.sh *must* come first for $rst
. ~/etc/scripts/terminal/colors.sh || exit 1

##
## msg [-n] "<message>"
##
msg() {
  case "x$1" in
    'x-n')
      shift 1
      printf "$rst$@$rst"
      ;;
    *)
      printf "$rst$@$rst\n"
      ;;
  esac
}

