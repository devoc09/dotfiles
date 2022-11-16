# Setup help

## Windows
- make directory to configure neovim

```
mkdir %USERPROFILE%\AppData\Local\nvim
```

- install `vim-plug` to `%USERPROFILE%\AppData\Local\nvim\autoload\`

- make symbolic link

```
mklink %USERPROFILE%\AppData\Local\nvim\init.vim %USERPROFILE%\dotfiles\nvim\.init.vim
```

- make symbolic link

```
mklink /D %USERPROFILE%\AppData\Local\nvim\_config %USERPROFILE%\dotfiles\nvim\_config
```

## WSL
- Disable sharing $PATH
```
// /etc/wsl.conf 

[interop]
appendWindowsPath = false
```
