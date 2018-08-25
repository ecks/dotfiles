class Py3status:

    button_enable = 1
    button_disable = 3
    cache_timeout = 10
    format = '{status}'

    def post_config_hook(self):
        self.colors_dict = {}
        self.touchpad_name = 'SynPS/2 Synaptics TouchPad'
        self.status = ""

    def touchpad(self):
        self.status = self._command() or '??'

        response = {
            'cached_until': self.py3.time_in(self.cache_timeout),
            'full_text': self.py3.safe_format(self.format, {'status': self.status})
        }

        lang_color = getattr(self.py3, 'COLOR_%s' % self.status.upper())

        if lang_color:
            response['color'] = lang_color

        return response

    def _command(self):
        ret = ""
        out = self.py3.command_output(
                ['xinput', 'list-props', self.touchpad_name]
                ).splitlines()[1].strip().split()[3]

        if out == '1':
            ret = "on"
        else:
            ret = "off"
        return ret

    def _enable(self):
        self.py3.command_run(['xinput', 'enable', self.touchpad_name])

    def _disable(self):
        self.py3.command_run(['xinput', 'disable', self.touchpad_name])

    def on_click(self, event):
        button = event['button']
        if button == self.button_enable and self.status == "off":
            self._enable()
        if button == self.button_disable and self.status == "on":
            self._disable()
        self.py3.log("hello from touchpad")

if __name__ == "__main__":
    """
    Run module in test mode.
    """
    from py3status.module_test import module_test
    module_test(Py3status)
