# docker-vint

[![Build Status][build-badge]][build] [![Docker Pulls][docker-badge]][docker]
[![GitHub][github-badge]][github]

A small Docker image for [Vint][], a fast and highly extensible Vim script
language linter implemented in Python.

**Table of Contents**

<!-- toc -->

- [Getting the Image](#getting-the-image)
- [Usage](#usage)
- [Issues](#issues)
- [Contributing](#contributing)
- [Authors](#authors)
- [License](#license)

<!-- tocstop -->

## Getting the Image

Time image is hosted on Docker Hub and can be pulled down with:

```console
$ docker pull fnichol/vint
```

## Usage

By default, `vint` will be run with no arguments:

```console
$ docker run --rm -ti fnichol/vint
vint ERROR: nothing to check
usage: vint [-h] [-v] [-V] [-e] [-w] [-s] [-m MAX_VIOLATIONS] [-c]
            [--no-color] [-j] [-t] [--enable-neovim] [-f FORMAT]
            [files [files ...]]

Lint Vim script

positional arguments:
  files                 file or directory path to lint

optional arguments:
  -h, --help            show this help message and exit
  -v, --version         show program's version number and exit
  -V, --verbose         output verbose message
  -e, --error           report only errors
  -w, --warning         report errors and warnings
  -s, --style-problem   report errors, warnings and style problems
  -m MAX_VIOLATIONS, --max-violations MAX_VIOLATIONS
                        limit max violations count
  -c, --color           colorize output when possible
  --no-color            do not colorize output
  -j, --json            output json style
  -t, --stat            output statistic info
  --enable-neovim       Enable Neovim syntax
  -f FORMAT, --format FORMAT
                        set output format

```

To lint Vin scripts in your current directory, mount your current directory into
the container as read-only:

```console
$ docker run --rm -ti -v "$(pwd)":/src:ro -w /src fnichol/vint --color .vimrc
.vimrc:7:1: Do not use nocompatible which has unexpected effects (see :help nocompatible)
```

## Issues

If you have any problems with or questions about this image, please contact us
through a [GitHub issue][issues].

## Contributing

You are invited to contribute to new features, fixes, or updates, large or
small; we are always thrilled to receive pull requests, and do our best to
process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub
issue][issues], especially for more ambitious contributions. This gives other
contributors a chance to point you in the right direction, give you feedback on
your design, and help you find out if someone else is working on the same thing.

## Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>).

## License

This Docker image is licensed under the [MIT][license] license. The Vint project
is also licensed under the [MIT][vint-license] license.

[build-badge]: https://api.cirrus-ci.com/github/fnichol/docker-vint.svg
[build]: https://cirrus-ci.com/github/fnichol/docker-vint
[docker-badge]: https://img.shields.io/docker/pulls/fnichol/vint.svg
[docker]: https://hub.docker.com/r/fnichol/vint
[fnichol]: https://github.com/fnichol
[github-badge]: https://img.shields.io/github/tag-date/fnichol/docker-vint.svg
[github]: https://github.com/fnichol/docker-vint
[issues]: https://github.com/fnichol/docker-vint/issues
[license]: https://github.com/fnichol/docker-vint/blob/master/LICENSE.txt
[vint-license]: https://github.com/Kuniwak/vint/blob/master/LICENSE.txt
[vint]: https://github.com/Kuniwak/vint
