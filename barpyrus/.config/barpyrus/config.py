import sys
import contextlib
import multiprocessing
import collections

from barpyrus import lemonbar, conky, trayer, widgets, hlwm, core

class Gruv:

    # https://github.com/morhetz/gruvbox

    BG0_H = '#1d2021'
    BG0_S = '#32302f'
    BG0 = '#282828'
    BG1 = '#3c3836'
    BG2 = '#504945'
    BG3 = '#665c54'
    BG4 = '#7c6f64'
    FG0 = '#fbf1c7'
    FG1 = '#ebdbb2'
    FG2 = '#d5c4a1'
    FG3 = '#bdae93'
    FG4 = '#a89984'
    FG = FG1
    BG = BG0_H
    RED_DARK = '#cc241d'
    GREEN_DARK = '#98971a'
    YELLOW_DARK = '#d79921'
    BLUE_DARK = '#458588'
    PURPLE_DARK = '#b16286'
    AQUA_DARK = '#689d6a'
    GRAY_DARK = '#a89984'
    ORANGE_DARK = '#d65d0e'
    RED_LIGHT = '#fb4934'
    GREEN_LIGHT = '#b8bb26'
    YELLOW_LIGHT = '#fabd2f'
    BLUE_LIGHT = '#83a598'
    PURPLE_LIGHT = '#d3869b'
    AQUA_LIGHT = '#8ec07c'
    GRAY_LIGHT = '#928374'
    ORANGE_LIGHT = '#fe8019'


ACCENT_COLOR = Gruv.ORANGE_DARK

@contextlib.contextmanager
def highlight_critical(cg, match, predicate='> 90'):
    with cg.if_('match ${%s} %s' % (match, predicate)):
        cg.fg(Gruv.RED_LIGHT)
    yield
    cg.fg(None)

xkblayouts = [
    'us us 0'.split(' '),
    'dv dv 1'.split(' '),
    'ru ru 2'.split(' '),
]

setxkbmap = 'xkblayout-state set'

def zip_renderer(self, painter):
    painter.fg(ACCENT_COLOR)
    if self.label == '0':
        painter.symbol(0xe26f)
        painter.space(2)
    else:
        painter.bg('#303030')
        painter.fg('#86AB5F')
        painter.space(2)
        painter.symbol(0xe26f)
        painter.space(2)
    #painter.space(3)

def cg_battery(cg):
    # first icon: 0 percent
    # last icon: 100 percent
    bat_icons = [
        0xe242, 0xe243, 0xe244, 0xe245, 0xe246,
        0xe247, 0xe248, 0xe249, 0xe24a, 0xe24b,
    ]
    bat_delta = 100 / len(bat_icons)

    with cg.if_('existing /sys/class/power_supply/BAT0'), cg.if_('match "$battery" != ""'):
        cg.fg(ACCENT_COLOR)

        with cg.if_('match "$battery" != "discharging $battery_percent%"'):
            cg.symbol(0xe0db)

        with cg.cases():
            for i, icon in enumerate(bat_icons[:-1]):
                cg.case('match $battery_percent < %d' % ((i+1)*bat_delta))
                cg.symbol(icon)

            cg.else_()
            cg.symbol(bat_icons[-1])  # icon for 100 percent

        cg.fg(None)
        cg.space(5)

        with highlight_critical(cg, 'battery_percent', '< 10'):
            cg.var('battery_percent')
            cg.text('% ')
            cg.var('battery_time')
            cg.space(5)

    with cg.if_('existing /run/tlp/manual_mode'):
        cg.fg(ACCENT_COLOR)
        cg.symbol(0xe1d8)
        cg.fg(None)
        with cg.cases():
            cg.case('match ${cat /run/tlp/manual_mode} == 0')
            cg.symbol(0xe0db)
            cg.case('match ${cat /run/tlp/manual_mode} == 1')
            cg.space(2)
            cg.symbol(0xe03b)
            cg.else_()
            cg.text("unknown")

        cg.fg(None)
        cg.space(2)

def cg_time(cg):
    with cg.temp_fg('#d65d0e'):
        cg.symbol(0xe015)
    cg.space(5)
    cg.var('time %d. %B, %H:%M')

Geometry = collections.namedtuple('Geometry', ['x', 'y', 'width', 'height'])

def main():
    hc = hlwm.connect()
    monitor = int(sys.argv[1]) if len(sys.argv) >= 2 else 0

    x, y, monitor_w, _monitor_h = hc.monitor_rect(monitor)
    geom = Geometry(x, y, width=monitor_w, height=16)
    hc(['pad', str(monitor), str(geom.height)])

    cg = conky.ConkyGenerator(lemonbar.textpainter())
    cg_battery(cg)
    cg_time(cg)


    conky_config = {
        'update_interval': '1',
        'update_interval_on_battery': '10',
    }

    trayer_config = {
        'tint': Gruv.BG.replace('#', '0x'),
        'iconspacing': '5',
        'padding': '5'
    }

    bar = lemonbar.Lemonbar(geometry=geom)

    left_widgets = [
        hlwm.HLWMTags(hc, monitor),
        hlwm.HLWMWindowTitle(hc),
    ]

    right_widgets = [
        widgets.TabbedLayout([
            ('0', widgets.RawLabel('')),
            ('1', hlwm.HLWMLayoutSwitcher(hc, xkblayouts, command = setxkbmap.split(' '))),
        ], tab_renderer = zip_renderer),
        widgets.RawLabel(' '),
        conky.ConkyWidget(text=str(cg), config=conky_config)
    ]
    if monitor == 0:
        right_widgets.append(trayer.TrayerWidget(args=trayer_config))

    bar.widget = widgets.ListLayout([
        widgets.RawLabel('%{l}'),
        *left_widgets,
        widgets.RawLabel('%{r}'),
        *right_widgets,
    ])
    return bar


bar = main()
