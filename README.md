# Single User Interactive Executive

## Background

Susie (Single User Interactive Executive) is a simple operating system developed for my final year project at [City University](https://www.city.ac.uk/) in 1979.

The project was "An operating system for a minicomputer", where the mini-computer was a [PDP-11/34](https://en.wikipedia.org/wiki/PDP-11).

I purchased and built a [PiDP-11](https://obsolescence.wixsite.com/obsolescence/pidp-11), which is a 2/3 scale replica of a PDP-11/70 emulated with [SIMH](https://github.com/simh/simh) on a [Raspberry Pi](https://www.raspberrypi.com/).

For no other reason, other than nostalgia, I decided to reincarnate Susie on the [PiDP-11](https://obsolescence.wixsite.com/obsolescence/pidp-11).

This project was complete two years *before* [MS-DOS](https://en.wikipedia.org/wiki/MS-DOS) although [CP/M](https://en.wikipedia.org/wiki/CP/M) had been developed four years prior.

**This project is very likely absolutely no use to anyone at all in any way shape or form.**

| Core Programs | |
|---------------|-|
| `susie`       | The main operating system. |
| `dkinit`      | Disk initiasation program. |
| `boot`        | Disk bootstrap program. |

| Susie Programs | |
|----------------|-|
| `sysmac`       | System macros used by programs developed for Susie. |
| `load`         | Enables programs to be loaded on to Susie. |
| `fido`         | File utility package. |
| `kt`           | Keyboard test program. |
| `ft`           | File test program. |
| `gbig`         | Large file test. |

## Development environment

The easiest way to set up the development environment is with [nix](https://nixos.org/). This would then require local nix install of [`github:nigeleke/macro11`](https://github.com/nigeleke/macro11).

**Start** the development environment (the `--impure` setting is used for [Visual Code](https://code.visualstudio.com/)):

```
> nix develop --impure
```

**Edit**:
```
> code .
```

**Assemble** everything:
```
> ./build.sh
```

## Runtime environment

Follow the [PiDP-11](https://obsolescence.wixsite.com/obsolescence/pidp-11) instructions [here](https://www3.ispnet.net/pidp11/PiDP-11%20Manual%20v0.2.odt).

It is not necessary to perform the *systems* installations as these options get overwritten with the `simh/selections` file during the `build` process.
```
> ./build.sh
```

### [PiDP-11](https://obsolescence.wixsite.com/obsolescence/pidp-11) switch settings

| Switches | Program | Description |
|--|--|--|
| 0000 | `idled` | Runs Idled program and shows these options |
| 0001 | `susie` | Runs raw copy of Susie, loaded from *paper-tape* |
| 0002 | `dkinit` | Runs disk initialisation (loaded from *paper-tape*). This will immediately *halt*. This was to allow the development operating system disk [RT-11](https://en.wikipedia.org/wiki/RT-11) to be removed, and replaced with the disk where Susie is to be written. Press *cont* and the disk is updated with a copy of Susie, and `dkinit` *halt*s again. |
| 0003 | `boot` | Runs the *bootstrap* program (loaded from *paper-tape*), which then loads and runs the copy of Susie currently on the disk. To load paper-tapes into the reader, stop the simulation (CTRL-E), then `att ptr <file.bin>` followed by `cont`. |
| 0004 | `load` | Allows files to be loaded from *paper-tape* onto the Susie disk. This is set up for a self load, so at the `[LOAD] ` prompt enter `LOAD`. From that point on you can then start with the `boot` sequence. |
