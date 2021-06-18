# Faust-plugins

DSP experiments with [Faust](https://faust.grame.fr), intended for SuperCollider plugins but can probably be compiled to other things.

# Build and install

Run make to build the plugins:
`make`

Run make install to build and install the plugins:
`m̀ake install`

You may supply a an install prefix to install it to a specific location
`PREFIX=<path> make install`

This is an example of what compiling and installing the plugins would look like on linux:
``` 
PREFIX=~/.local/share/SuperCollider/Extensions make install
```
