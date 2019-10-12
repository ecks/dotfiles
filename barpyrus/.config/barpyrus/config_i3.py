from barpyrus import widgets as W
from barpyrus.core import Theme
from barpyrus import lemonbar

from barpyrus import modules as M


# Copy this config to ~/.config/barpyrus/config.py

# you can define custom themes
grey_frame = Theme(bg = '#303030', fg = '#EFEFEF', padding = (3,3))

# Widget configuration:
bar = lemonbar.Lemonbar(args = ["-b"])
bar.widget = W.ListLayout([
    W.RawLabel('%{l}'),
    grey_frame(M.TimeIn(["America/Denver", "America/New_York", "Europe/London"])),
    W.RawLabel('%{c}'),
    grey_frame(M.Kbd()),
    W.RawLabel('%{r}'),
    grey_frame(M.Mpd()),
])
