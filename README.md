# Single User Interactive Executive

## Background

Susie (Single User Interactive Executive) is a simple operating system developed for my final year project at [City University](https://www.city.ac.uk/) in 1979.

The project was "An operating system for a minicomputer", where the mini-computer was a [PDP-11/34](https://en.wikipedia.org/wiki/PDP-11).

I purchased and built a [PiDP-11](https://obsolescence.wixsite.com/obsolescence/pidp-11), which is a 2/3 scale replica of a PDP-11/70 emulated with [SIMH](https://github.com/simh/simh) on a [Raspberry Pi](https://www.raspberrypi.com/).

For no other reason, other than nostalgia, I decided to reincarnate Susie on the PiDP-11.

This project is very likely absolutely no use to anyone at all in any way shape or form, but I would like to point out that it beat [MS-DOS](https://en.wikipedia.org/wiki/MS-DOS) by two years.

| Programs  | |
|-----------|-|
| susie     | The main operating system. |
| dkinit    | Disk initiasation program. |
| boot      | Disk bootstrap program. |
| sysmac    | System macros, used in Susie and for any program that runs on Susie. |
| load      | Enables programs to be loaded on to Susie. |
| fido      | File utility package. |
| kt        | Keyboard test program. |
| ft        | File test program. |
| gbig      | Large file test. |

## Development environment

### Pre-requisite

Requires local nix install of `github:nigeleke/macro11`.

### Build

```
nix develop --impure
./build.sh
```
