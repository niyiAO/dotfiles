#!/bin/bash

notify() {
  VOLUME=$(pulseaudio-ctl full-status | cut -d" " -f 1)
  MUTED=$(pulseaudio-ctl full-status | cut -d" " -f 2)
  KEY="991049"
  ICON=audio-volume-muted

  if [[ $MUTED == "yes" ]]; then
    dunstify -i $ICON -u low -r $KEYMuted
    exit
  fi

  if [[ $VOLUME -gt 0 ]]; then
    ICON=audio-volume-low
  fi

  if [[ $VOLUME -gt 30 ]]; then
    ICON=audio-volume-medium
  fi

  if [[ $VOLUME -gt 60 ]]; then
    ICON=audio-volume-high
  fi

  dunstify -i $ICON	-u low -r $KEY	-h int:value:$VOLUME	"Volume $VOLUME%"
}

pulseaudio-ctl $1
notify
