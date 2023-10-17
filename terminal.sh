[[ -n "$__TERMINAL_SH" ]] && return
__TERMINAL_SH=1

# . ~/etc/scripts/<FOO>.sh || exit 1

for script in ~/etc/scripts/terminal/*.sh ; do
  if [ -r "$script" ]; then
    . "$script"
  fi
done
unset script
