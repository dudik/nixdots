# nixdots

## Notes

### NixOS virt-manager guest clipboard support

Remove (or set to `false`):
```
services.xserver.displayManager.startx.enable = true;
```

Add:
```
services.xserver.desktopManager.xfce.enable = true;
services.spice-vdagentd.enable = true;
```

### Adding fonts
After adding a font package, run:
```shell
fc-cache -f
```

Home-manager doesn't do this automatically.