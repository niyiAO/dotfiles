
#!/bin/bash

notify() {
  VALUE=$(xbacklight | cut -f1 -d.)
  KEY="991050"
  ICON=brightnesssettings

  dunstify -i $ICON	-u low -r $KEY	-h int:value:$VALUE	"Brightness $VALUE%"
}

CURRENT=$(xbacklight | cut -f1 -d.)
DELTA=$(bc -l <<END
  1.01 ^ ($CURRENT - 100) * 10 
END
)

xbacklight -$1 $DELTA
notify