# animX-memory-leak

A small proof-of-concept demonstrating that animX (a LÖVE animation library) leaks memory.

Tested on LÖVE 11.5 on Windows 10 x64. Tested with `30log-plus`, `30log`, and `classic`.

## Usage

1. Press the left mouse button to spawn 1,000 torch animations.
2. Spawn about 50,000 torches to notice high CPU usage.
3. Press the right mouse button to destroy all torches and call `collectgarbage("collect")`.
4. If using the "old" `animX`, memory remains occupied and CPU usage stays high even after destroying all torches.
5. Uncomment the line `-- animx = require("libs/animX")` in `main.lua`.
6. Repeat steps 1–4 and observe the difference.

## Links

- Original `animX`: https://github.com/besnoi/animX
- My fork of `animX` with fixed memory leak: https://github.com/cpeosphoros/30log-plus/
- Torch image: https://rone3190.itch.io/torch-32x32-animated
- `30log-plus`: https://github.com/cpeosphoros/30log-plus/
