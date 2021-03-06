# Create the default command_not_found handler
function __fish_default_command_not_found_handler
    printf "Unknown command: %s\n" (string escape -- $argv[1]) >&2
    printf "Packages that can be installed that implement %s:\n" (string escape -- $argv[1]) >&2
    pacman -F $argv[1] >&2 # Change this line if you don't use pacman
end

# Set path bins for cargo and poetry
set -x PATH $HOME/.cargo/bin $HOME/.poetry/bin $HOME/.gem/ruby/2.7.0/bin $HOME/.local/bin $HOME/bin $PATH

# Disable fish greeting
set fish_greeting

# Fetch if a fetch is installed
if command -v pfetch &> /dev/null && [ "$TERM_PROGRAM" != "vscode" ]
    pfetch
end

starship init fish | source
