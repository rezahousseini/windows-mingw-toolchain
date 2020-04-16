# Usage

## Debug build

First initialize the build

on Linux:

    docker run --rm -v $(pwd -P):/usr/project rezahousseini/windows-mingw-toolchain:version-1.0 meson build-win-debug --cross-file windows-mingw-static.config --buildtype=debug
on Windows `cmd.exe`:

    docker run --rm -v %cd%:/usr/project rezahousseini/windows-mingw-toolchain:version-1.0 meson build-win-debug --cross-file windows-mingw-static.config --buildtype=debug

Compilation can be started as

on Linux:

    docker run --rm -v $(pwd -P):/usr/project rezahousseini/windows-mingw-toolchain:version-1.0 ninja -C build-win-debug

on Windows `cmd.exe`:

    docker run --rm -v %cd%:/usr/project rezahousseini/windows-mingw-toolchain:version-1.0 ninja -C build-win-debug

## Release build

For a release build change the `--buildtype` flag to `release` in the configuration step and change accordingly the folder name from `build-win-debug` to `build-win-release`.
