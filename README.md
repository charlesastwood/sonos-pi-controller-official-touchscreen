# sonos-pi-controller
A touch screen (Adafruit PiTFT 3.5") Sonos controller for Raspberry Pi. Runs in a docker container.

This controller relies upon the [SoCo library](https://github.com/SoCo/SoCo) for communicating with [Sonos speakers](https://www.sonos.com/) and the [pygame library](https://github.com/pygame/pygame) for the UI.

![Now Playing](./resources/screenshots/sonospi.gif)
![Raspberry Pi Controller mounted to wall](./resources/screenshots/controller-mounted.jpg)

## Features
The sonos-pi-controller includes the following features:

* Familiar interface similar to the official Sonos controller
* Stays synced with all your other Sonos controllers
* View album art, track name, artist, album
* Select room (top right icon)
* Group rooms (bottom right icon)
  * Select/deselect all rooms (top right party icon)
* Select music from music library (top left icon)
  * Artists
  * Albums
  * Genres
  * Playlists (Imported Playlists)
  * Favorites (i.e., items added to 'My Sonos')
* Play & Pause
* Next & Previous Track
* Adjust volume (including grouped rooms)
* Mute and unmute
* Automatic backlight shutoff after period of inactivity

## Planned Upgrades
* Ability to view song queue, select a song in queue, & adjust playback mode (normal, shuffle, repeat)
  * Replace select room icon with a queue icon
  * Room selection will be available via tapping on room name.

## Installation & Requirements
### You will need the following hardware:

* Raspberry Pi 3B or armv7 compatible version
* [Adafruit PiTFT Plus 3.5" TFT+Touchscreen](https://www.adafruit.com/product/2441)
* Optional: [PiTFT Pibow+ Case](https://www.adafruit.com/product/2779)

### Installation

* Flash your Raspberry Pi with the latest Raspbian Lite (right now it's *buster*)
* Login to your Pi via SSH and install docker, docker-compose, and git.
  * [Here](https://www.bargelt.com/setting-up-a-headless-raspberry-pi-with-ssh-docker-docker-compose-git/) is a very helpful guide if you need help.
* Attach your touchscreen to the Pi, reboot, and run the [installer script from Adafruit](https://learn.adafruit.com/adafruit-pitft-3-dot-5-touch-screen-for-raspberry-pi/easy-install-2) to setup your touchscreen.
  * Choose **0 degrees (portrait)** for the *rotation*.
  * Answer **Yes** when asked *Would you like the console to appear on the PiTFT display?*.
  * My personal settings in `/boot/config.txt`:
    ```bash
    gpu_mem=16
    # --- added by adafruit-pitft-helper Tue 30 Oct 10:12:27 MDT 2018 ---
    dtparam=spi=on
    dtparam=i2c1=on
    dtparam=i2c_arm=on
    dtoverlay=pitft35-resistive,rotate=0,speed=32000000,fps=60
    # --- end adafruit-pitft-helper Tue 30 Oct 10:12:27 MDT 2018 ---
    ```
* Build the base Dockerfile image with pygame, pip, and SDL 1.2 support:
  ```bash
  docker build -t containers/debian-pygame-base -f Dockerfile.base .
  ```
* Build main Dockerfile image with:
  ```bash
  docker-compose build
  ```
* Copy `sample.env` to `.env` and adjust `BACKLIGHT_TIMEOUT` to your preference. Default is 30 seconds.
* Run `docker-compose up -d` and enjoy your Raspberry Pi Sonos Controller!

## Screenshots
![Now Playing](./resources/screenshots/now_playing.png)
![Select Room](./resources/screenshots/room_select.png)
![Group Rooms](./resources/screenshots/group_rooms.png)
![Music Library](./resources/screenshots/music_library.png)
![Select Artist](./resources/screenshots/artists.png)
![Select Track](./resources/screenshots/select_track.png)
![Select Favorite](./resources/screenshots/favorites.png)
![Raspberry Pi Controller mounted to wall](./resources/screenshots/controller-mounted.jpg)

## Troubleshooting
If you have any issues getting started, please reach out and I will try to help.

If your touchscreen is not calibrated correctly, try running the calibration program:
  ```bash
  sudo TSLIB_FBDEVICE=/dev/fb1 TSLIB_TSDEVICE=/dev/input/touchscreen ts_calibrate
  ```
