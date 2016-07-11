# Hammerspoon config

Configuration files for the [Hammerspoon](https://github.com/Hammerspoon/hammerspoon) project. 

## Installation

```shell
# goto the hammerspoon configuration directory
cd $HOME
mkdir .hammerspoon
cd .hammerspoon

# pull rather than clone (we don't want the extra folder)
git init
git remote add origin git@github.com:muppetjones/hammerspoon_config.git
git pull
```

## Functionality

* App cycling
  * Between windows of the same app.
  * Between windows of multiple apps.
* Mouse location
  * Highlight mouse location (automatic during app cycling)
  * Fun logos instead of a plain circle
* Window resizing
  * Right, left, top, bottom, full

## To add

* Move windows between screens
* More fun logos

## Known bugs

* App filter only returns main iTerm window if not on same space.
  * (iTerm bug)
