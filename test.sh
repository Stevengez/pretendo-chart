for pid in /proc/[0-9]*; do
  c=$(grep -l inotify "$pid"/fdinfo/* 2>/dev/null | wc -l)
  if [ "$c" -gt 0 ]; then
    printf "%5d %6s %s\n" "$c" "${pid##*/}" "$(ps -p ${pid##*/} -o comm=)"
  fi
done | sort -nr | head -20
