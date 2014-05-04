# Swappy

Swappy lets you easily swap between config file sets.

## Use Cases

* You have, for instance, 2 different .vimrc files that you switch back and forth between depending on the circumstances. It doesn't have to be .vimrc files; it can be *any* config file. In fact, it doesn't even have to be a config file, it can be *any file*—even multiple files!
* You want to take someone's dotfiles out for a spin, and easily switch back to yours.

## Installation

`gem install swappy`

Run `swappy --help` as a sanity check.

## Example

Put this `.swappy.json` config file in your `~`:

    {
      "config_sets": {
        "vim_heavy": {
          "link_root": "~",
          "source_root": "~/.config_sets/vim_heavy",
          "configs": {
            ".vimrc": "vimrc"
          }
        },
        "vim_minimalist": {
          "link_root": "~",
          "source_root": "~/.config_sets/vim_minimalist",
          "configs": {
            ".vimrc": "vimrc"
          }
        }
      }
    }

This file has two config sets:

* **vim_heavy** (files live in `~/.config_sets/vim_heavy`)
* **vim_minimalist** (files live in `~/.config_sets/vim_minimalist`)

You can verify these are configured correctly by running `swappy list`. You should see:

    vim_heavy
    vim_minimalist

When you issue the command `swappy swap vim_heavy`, `~/.vimrc` will now be a symbolic link to `~/.config_sets/vim_heavy/vimrc`.

"**BUT WAIT!**", you say, "**What happens if I already have a `.vimrc` in my `~`?**" I'm glad you asked. Swappy will back it up within the same directory. The backup file will be named with a timestamp, like this:

    .vimrc.backup.1399229001

Even your symlinks will be backed up!

This effectively means that a history of your swaps will be stored within the same directory.

## Contributing

1. Fork it ( http://github.com/facto/swappy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write code (don't forget the tests!)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
