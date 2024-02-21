# Henrik's dotfiles

Contains my dotfiles and a bootstrap script to copy them from this repository to my home directory.

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/hknutsen/dotfiles.git && cd dotfiles
    ```

1. Run the bootstrap script:

    ```bash
    ./bootstrap.sh
    ```

    Copy a single given dotfile:

    ```bash
    ./bootstrap.sh file
    ```

    Copy multiple given dotfiles:

    ```bash
    ./bootstrap.sh "file1 file2 file3"
    ```
