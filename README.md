My dotfiles
===========

This is a copy of my dotfiles.

This is essentially made for me to restore my settings.

Programs whose configs can be found here
----------------------------------------

+ i3
+ i3blocks
+ vim
+ neomutt
+ newsboat
+ zsh
+ ranger
+ X11
+ some fonts in .fonts
+ and scripts in .tools

Dependencies
------------

+ [ttf-symbola](https://aur.archlinux.org/packages/ttf-symbola/)\textsuperscript{AUR}
+ xclip
+ dunst
+ dmenu

Changes to be made
------------------

### Sudoers

Add to your `/etc/sudoers`:

```{sudoers}
ALL ALL=(ALL) NOPASSWD:/usr/bin/pacman -Syuw,\
		/home/archie/.tools/mount.sh,\
		/home/archie/.tools/umount.sh,\
		/usr/bin/systemctl restart NetworkManager,\
		/usr/bin/shutdown,\
		/usr/bin/reboot,\
		/usr/bin/systemctl suspend
```

### caps2esc

Install **caps2esc** with intecept and add this job to `/etc/udevmon.yaml`:

```
- JOB: "intercept -g $DEVNODE | caps2esc | uinput -d $DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
```

Start the process with systemd:

```{bash}
sudo systemctl enable udevmon
```

