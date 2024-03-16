# Pipewire

Useful commands for operating Pipewire audio server.

## Restart

```bash
systemctl --user restart pipewire.service
```

## Check settings

```bash
pw-metadata -n settings
```

## Check playback format

```bash
pw-top
```
