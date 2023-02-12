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
