# Audio

Useful commands for managing audio in Fedora Linux.

## Check current playback format

List available sound cards:

```bash
cat /proc/asound/cards
```

Check current playback format for given sound card, for example `card0`:

```bash
cat /proc/asound/card0/pcm0p/sub0/hw_params
```

## Restart PipeWire

Fedora Linux uses the PipeWire server for audio.

After making changes to PipeWire configuration, restart PipeWire:

```bash
systemctl --user restart pipewire.service
```
