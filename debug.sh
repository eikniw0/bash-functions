[[ -n "$__DEBUG_SH" ]] && return
__DEBUG_SH=1

. ~/etc/scripts/terminal.sh || exit 1

for script in ~/etc/scripts/debug/*.sh ; do
  if [ -r "$script" ]; then
    . "$script"
  fi
done
unset script
