#!/bin/bash

current_sink=`pactl info | grep "Default Sink:" | awk '{print $3}'`
sinks=($(pactl list short sinks | awk '{print $2}'))
current_sink_idx=0

get_def_sink_index() {
  local idx=0
  for s in "${sinks[@]}"; do
    if [[ $current_sink == $s ]]; then
      current_sink_idx=$idx
    fi
    ((idx++))
  done
}

cicle_def_sink() {
  local last_sink=$((${#sinks[@]}- 1))

  if [[ $current_sink_idx -eq $last_sink ]]; then
    $(pactl set-default-sink "${sinks[0]}")
  else
    ((current_sink_idx++))
    $(pactl set-default-sink "${sinks[$current_sink_idx]}")
  fi
}

get_def_sink_index
cicle_def_sink
