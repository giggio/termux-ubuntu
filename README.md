# Termux Ubuntu installation

## Installing

The easiest way it to run the oneliner install command:

```bash
curl -fsSL https://raw.githubusercontent.com/giggio/termux-ubuntu/main/setup | bash -s -- <your_user_name>
```

You can also clone this repo and keep it updated. To do so, either:

1. Clone it and run `./setup` from the clone;
2. Create a $HOME/p directory and run the install command. It will be cloned under it automatically.

    ```bash
    mkdir "$HOME/p"
    curl -fsSL https://raw.githubusercontent.com/giggio/termux-ubuntu/main/setup | bash -s -- <your_user_name>
    ```

After installing you need to setup the user's password to be able to run commands with `sudo`.

Run:

```bash
proot-distro login ubuntu
passwd <user_user_name>
```

## Running

At the end the installer will add the command to run Ubuntu to your `.bashrc` file.
But you can get back to it by running:

```bash
proot-distro login ubuntu --user <user_user_name>
```

## Author

[Giovanni Bassi](https://twitter.com/giovannibassi)

## License

Licensed under the Apache License, Version 2.0.
