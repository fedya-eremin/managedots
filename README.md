In educational purposes
[![CI](https://github.com/fedya-eremin/managedots/actions/workflows/tests.yml/badge.svg)](https://github.com/fedya-eremin/managedots/actions/workflows/tests.yml)
# managedots - an utility to install your dotfiles

## Dependencies
- git

For Debian-based distributives fans (poor way):
```bash
sudo apt install git
```
For Arch-based distributives fans (chad way):
```bash
sudo pacman -Sy git
```

## Usage
- To learn about commands, perform ```managedots --help```
- To install config files from preferred repository, perform ```managedots --install <source> <destination>```
![image](https://user-images.githubusercontent.com/126074306/236689300-0da4e178-9d01-4d68-a0f8-dec0e4cdd9b6.png)

- To download repository with configs, perform ```managedots --strap <url> <name-you-like>```
![image](https://user-images.githubusercontent.com/126074306/236689260-20625fa2-161f-4811-a9d7-150aa3b26e82.png)

Example dotfiles: [this](https://github.com/fedya-eremin/dotfiles)

## Contributing
- If you want to contribute, you have to open a pull request with feature request and/or its full changelog
