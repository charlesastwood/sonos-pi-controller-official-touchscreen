from decouple import config
from rpi_backlight import Backlight

BACKLIGHT_CONTROL = config('BACKLIGHT_CONTROL')


class Backlight:
    """Static Class for controlling device backlight"""
    backlight = Backlight()

    # Get the current state
    # with open(BACKLIGHT_CONTROL) as file:
    enabled = backlight.power

    @staticmethod
    def on():
        backlight = Backlight()
        if not Backlight.enabled:
            backlight.power = True

    @staticmethod
    def off():
        backlight = Backlight()
        if Backlight.enabled:
            backlight.power = False
