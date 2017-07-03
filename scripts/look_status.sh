#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

look_string_setting_string="@screentime_look_string"
nolook_string_setting_string="@screentime_nolook_string"
interval_setting_string="@screentime_interval"
show_clock_setting_string="@screentime_show_clock"

default_interval=20
default_show_clock=0
look_msg_osx="👀 "
look_msg="look up!"
nolook_msg_osx=""
nolook_msg_cygwin=""
nolook_msg=""

source $CURRENT_DIR/shared.sh

is_osx() {
  [ $(uname) == "Darwin" ]
}

is_cygwin() {
  [[ $(uname) =~ CYGWIN ]]
}

default_look_string() {
  if is_osx; then
    echo "$look_msg_osx"
  else
    echo "$look_msg"
  fi
}

default_nolook_string() {
  if is_osx; then
    echo "$nolook_msg_osx"
  elif is_cygwin; then
    echo "$nolook_msg_cygwin"
  else
    echo "$nolook_msg"
  fi
}

get_second() {
  echo $(date | cut -d ':' -f3 | cut -d ' ' -f1)
}

is_time_to_look() {
  # is the current minute on an interval?
  # is it in the first half of the minute?
  if is_osx; then
    local minute="$(date | cut -d ':' -f2)"
    second=$(get_second)
    local max_num_minutes=$(get_tmux_option "$interval_setting_string" $[default_interval])
    if [ $max_num_minutes -lt 1 ]; then
      return 1
    fi

    local modulo=$(($minute % $max_num_minutes))
    if [ $modulo = 0 ] && [ $second -lt 20 ]; then
      return 0  
    else
      return 1 
    fi
  fi

  return 1 
}

is_first_update_this_minute() {
  if is_osx; then
    local second=$(get_second)  
    local refresh_time=$(get_tmux_option "status-interval")
    if [ $second -lt $refresh_time ]; then
      return 0
    fi
  fi

  return 1
}

is_time_to_show_clock() {
  if $(get_tmux_option "$show_clock_setting_string" "$default_show_clock_option"); then
    if is_first_update_this_minute; then
      return 0
    fi
  fi

  return 1
}

print_look_status() {
  if is_time_to_look; then
    printf "$(get_tmux_option "$look_string_setting_string" "$(default_look_string)")"
    if is_time_to_show_clock; then
      $(tmux clock)
    fi 
  else
    printf "$(get_tmux_option "$nolook_string_setting_string" "$(default_nolook_string)")"
  fi
}

main() {
 print_look_status
}
main
