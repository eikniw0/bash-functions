
[[ -n "$__TERMINAL_COLORS_SH" ]] && return
__TERMINAL_COLORS_SH=1

init_colors() {
  [[ -n "$rst" ]] && return
  local color_term

  case "$TERM" in
    xterm*|*color)
      color_term=1
      ;;
    *)
      if [ -n "${COLORTERM:-}" ]; then
        color_term=1
      elif [ $(_tput colors) -ge 8 ]; then
        color_term=1
      else
        color_term=0
      fi
      ;;
  esac

  if (( color_term )); then
# Total effect reset---our trusted 'tput sgr0'
        rst=$'\e(B\e[m'

# These can change over time so much be run fresh each time
       cols='$(tput cols)'
       rows='$(tput lines)'

# Cursor movements and effects
         sc=$'\e7'     # (s)ave (c)ursor position
         rc=$'\e8'     # (r)estore (c)ursor position
       home=$'\e[H'    # goto col 1, row 1
       down=$'\n'      # down one line
         up=$'\e[A'    # up by one line
      civis=$'\e[?25l'        # (c)ursor (i)n(vis)ibility
      cnorm=$'\e[?12l\e[?25h' # (c)ursor (norm)al

# Save/load the *WHOLE* screen
       sscr='$(tput smcup)'   # (s)ave (scr)een contents
       rscr='$(tput rmcup)'   # (r)estore (scr)een contents

# Clearing the line or the screen.
      lnclr="$(tput el)"   # clear to end of current line
     revclr="$(tput el1)"  # clear back to start of current line
     endclr="$(tput ed)"   # clear the rest of the screen

# Font weights and effects
       bold=$'\e[1m'
         ul=$'\e[4m'
       rmul=$'\e[24m'
         so=$'\e[7m'
       rmso=$'\e[27m'
        rev=$'\e[7m'
      blink=$'\e[5m'
      invis=$'\e[8m'

# Font (a.k.a., foreground) colors
        blk=$'\e[30m'
        red=$'\e[31m'
        grn=$'\e[32m'
        ylw=$'\e[33m'
        blu=$'\e[34m'
        mag=$'\e[35m'
        cyn=$'\e[36m'
        wht=$'\e[37m'

# Background colors
     bg_blk=$'\e[20m'
     bg_red=$'\e[21m'
     bg_grn=$'\e[22m'
     bg_ylw=$'\e[23m'
     bg_blu=$'\e[24m'
     bg_mag=$'\e[25m'
     bg_cyn=$'\e[26m'
     bg_wht=$'\e[27m'
  else
        rst=''

         sc=''
         rc=''
       home=''
       down=''
         up=''
      civis=''
      cnorm=''

        blk=''
        red=''
        grn=''
        ylw=''
        blu=''
        mag=''
        cyn=''
        wht=''
  fi
}

# Now we can actually setup our variables.
init_colors

# And clean up
unset init_colors
