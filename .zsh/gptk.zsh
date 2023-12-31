# Homebrew switcher and Apple Game Porting Toolkit
if [ "$(arch)" = "arm64" ]; then
    if [[ -f /opt/homebrew/bin/brew && -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    if [[ -f /usr/local/bin/brew && -x /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
        function wine-gptk {
            WINEESYNC=1 WINEPREFIX=~/gptk $(brew --prefix game-porting-toolkit)/bin/wine64 "$@";
        }
    fi
fi
