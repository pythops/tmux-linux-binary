# Static tmux binaries

You can download the pre-built binaries in the release page.

## Building

Make sure you have [podman](https://github.com/containers/podman) installed on your machine first

To build the binary follow those instructions:

```
$ git clone https://github.com/pythops/tmux-linux-binary
$ cd tmux-linux-binary
$ podman build  -f Containerfile --output artifacts .
```

The binary will be inside artifacts directory.

## License

MIT
