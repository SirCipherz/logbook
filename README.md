# logbook
logbook is a nice and simple script made to simplify the creation of an
encrypted logbook

## Install
Just run the following command, this will install logbook in ~/.local/bin

```
make install
```

## Usage
First you need to create a new logbook, this will create an encrypted file named
~/.logbook you can change this by setting the LOGBOOK shell variable

```
logbook init
```

then you can start your log book with this command it will create a new line
with the date a new line and 4 spaces. You must set the EDITOR shell variable in
order to edit the file with your favorite text editor.

```
logbook write
```

If you want to read your logbook you can run this command, this will open it in
less

```
logbook read
```

## Dependencies
- gnupg (of course)
- bash

## Security
logbook needs to decrypt your logbook in order to let you edit it, logbook will
decrypt it in /tmp make sure your /tmp is a tmpfs filesystem
