OSDOD
=====

Overview
--------

Here I'm building a simple daemon for showing persistent full screen notifications, primarily for use with [skhd](https://github.com/koekeishiya/skhd) and [chunkwm](https://github.com/koekeishiya/chunkwm).
`skhd` supports modal keyboard shortcuts, and `osdod` makes it obvious when a certain mode is active.

Installation
------------

1. Build `osdod` and `osdodc` targets in XCode
2. Copy `osdod` and `osdodc` executables to `/usr/bin`
3. `cp me.yarotsky.osdod ~/Library/LaunchAgents`
4. `launchctl load ~/Library/LaunchAgents/me.yarotsky.osdod`

Usage
-----

    osdodc show

    osdodc hide


In `~./skhd`:

    :: default : osdodc hide
    :: wm @ : osdodc show
