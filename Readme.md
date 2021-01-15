## Static tmux binaries

You can download the pre-built binaries in the release page.

> Those binaries are built for *Linux x86_64*

### Building

If you want to build it yourself, follow those instructions:
> You need to have Docker installed on your machine.

```
$ export DOCKER_BUILDKIT=1
$ git clone https://github.com/pythops/tmux-linux-binary
$ cd tmux-linux-binary
$ docker build --output artifacts .
```
The binary will be inside artifacts directory.

### License
MIT
