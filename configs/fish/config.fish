function fish_greeting
set_color normal
end

if status is-interactive

# ==========
# Sets
# ==========
set --erase --universal fish_key_bindings
set -x PKG_CONFIG_PATH /usr/local/lib/pkgconfig /usr/local/share/pkgconfig $PKG_CONFIG_PATH
set -g stell_alive "#ffb31c"
set -x PATH /home/deltacat/.cargo/bin $PATH
set -x ANDROID_NDK_HOME /opt/android-ndk
set -gx PATH $PATH /home/deltacat/.lmstudio/bin
# set -x TERM xterm

# ==========
# Inits
# ==========
starship init fish | source

# ==========
# Abbrs
# ==========
abbr cat 'bat --style header,snip,changes'
abbr wget 'wget -c '

abbr tarnow 'tar -acf '
abbr untar 'tar -zxvf '
abbr 7znow '7z a'
abbr un7z '7z x'


abbr pip-inst 'pip install --break-system-packages'


# ==== git ==== 
abbr gt-init 'git init'
abbr gt-status 'git status'
abbr gt-add-all 'git add .'
abbr gt-commit 'git commit -m "Commit_Name"'
abbr gt-push 'git push'
abbr gt-pull 'git pull'
abbr gt-log 'git log --oneline --graph'
abbr gt-save-pass 'git config --global credential.helper store'
abbr gt-setup 'git remote add origin https://github.com/Username/ && git branch -M main && git push -u origin main'
abbr gt-fastcommit 'git add .; git commit -m "fastCommit"; git push'


# ==========
# Aliases
# ==========
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias dl="cd ~/Downloads"
alias doc="cd ~/Documents"
alias dt="cd ~/Desktop"
alias gt="cd ~/my-files/my-git-repos"

alias reload="source ~/.config/fish/config.fish"
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias lsz='eza -al --color=always --total-size --group-directories-first --icons' # include file size
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias ld='eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles

alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'

alias mir-arch='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mir-blac='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/blackarch-mirrorlist'
alias mir-chao='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/chaotic-mirrorlist'
alias mir-cach='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/cachyos-mirrorlist'
alias mir-cach3='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/cachyos-v3-mirrorlist'
alias mir-cach4='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/cachyos-v4-mirrorlist'

alias please='sudo'

alias ffh='fastfetch --logo ~/.config/fastfetch/hypr.png --logo-type kitty --logo-width 45 --logo-height 35'
alias ffhg='fastfetch --logo ~/.config/fastfetch/hypr-gruvbox.png --logo-type kitty --logo-width 45 --logo-height 35'
alias ffm='fastfetch --logo ~/.config/fastfetch/myst.png --logo-type kitty --logo-width 50 --logo-height 25'
alias ffnya='fastfetch --logo ~/.config/fastfetch/nyarch.png --logo-type kitty --logo-width 50 --logo-height 25'
alias ff='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/arch.txt'

alias ffc='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/cake.txt --logo-color-1 "$stell_alive"'
alias ffn='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/nuke.txt --logo-color-1 "$stell_alive"'
alias ffcam='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/camera.txt --logo-color-1 "$stell_alive"'
alias ffs='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/sience.txt --logo-color-1 "$stell_alive"'
alias fffire='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/fire.txt --logo-color-1 "$stell_alive"'
alias ffap='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/aperture.txt --logo-color-1 "$stell_alive"'
alias ffmesa='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/blackmesa.txt --logo-color-1 "$stell_alive"'
alias ffkaboom='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/kaboom.txt --logo-color-1 "$stell_alive"'
alias ffbh='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/broken-heart.txt --logo-color-1 "$stell_alive"'

alias neo='neo-matrix --speed=13'
alias bonsai='rbonsai -li'
alias quarium='asciiquarium'
alias rick='curl ascii.live/rick'
alias map='telnet mapscii.me'

# =========================
#  DeltaCat Scripts block
# =========================
alias dcs-health-analyze='sudo echo "=== БАТАРЕЯ ===" && upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "capacity|energy-full" && echo "=== SSD ===" && sudo smartctl -a /dev/nvme0n1 | grep -E "Percentage Used|Available Spare|Data Units Written"'
alias dcs-btrfs-balace='sudo btrfs balance start -dusage=90 / '

alias dcs-grub-edit='sudo nano /etc/default/grub'
alias dcs-grub-upgrade='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias dcs-grub-cmdline='cat /etc/default/grub | grep "GRUB_CMDLINE_LINUX_DEFAULT" '

alias dcs-dracut-edit='sudo nano /etc/dracut.conf.d/myflags.conf'
alias dcs-dracut-conf='cat /etc/dracut.conf.d/myflags.conf'

alias dcs-nvmodprobe-edit='sudo nano /etc/modprobe.d/nvidia.conf'
alias dcs-nvmodprobe-conf='cat /etc/modprobe.d/nvidia.conf'

alias dcs-fish-edit='nano ~/.config/fish/config.fish'

alias dcs-pacman-edit='sudo nano /etc/pacman.conf'
alias dcs-pacman-clear='sudo rm -rf /var/cache/pacman/pkg/*'
alias dcs-pacman-unlock='sudo rm -rf /var/lib/pacman/db.lck'

alias dcs-dependencies-setup='sudo pacman -Syy eza ugrep fastfetch matugen bat straship'
alias dcs-folders-setup='mkdir -p ~/Pictures ~/Videos ~/Music ~/Documents ~/Downloads ~/Desktop ~/Games ~/Scripts ~/my-files'

alias dcs-rf-unblock='sudo rfkill unblock 1'

alias dcs-hashcat-restore='sudo find /root/.local/share/hashcat/sessions/ -name "*.restore" && read -P "Session name: " SESSIONHC && sudo hashcat --session $SESSIONHC --restore'
alias dcs-hashcat-passwd='ls && read -P "Filename: " HASHNAME && sudo hashcat -m 22000 $HASHNAME --show --potfile-path /root/.local/share/hashcat/hashcat.potfile'
alias dcs-hashcat-passcheck='sudo cat /root/.local/share/hashcat/hashcat.potfile'
alias dcs-hashcat-watching='sudo watch -n 5 bat --style header,snip,changes /root/.local/share/hashcat/hashcat.potfile'  

alias dcs-mon-start='sudo airmon-ng start wlp3s0'
alias dcs-mon-stop='sudo airmon-ng stop wlp3s0mon'

alias dcs-rust-setup='sudo pacman -S rustup rust-src cargo-ndk android-ndk && rustup default stable && rustup target add aarch64-linux-android'
alias dcs-rustbookua-setup='cargo install mdbook; git clone https://github.com/rust-lang-ua/rustbook_ukrainian ~/my-files/rustbook_ukrainian && cd ~/my-files/rustbook_ukrainian && mdbook build'
alias dcs-rustbookua='cd ~/my-files/rustbook_ukrainian && mdbook serve --open'
alias dcs-rust-aarch-build-rel='cargo ndk -t aarch64-linux-android build --release'
alias dcs-rust-aarch-build='cargo ndk -t aarch64-linux-android build'

end


function dcs-dracut-rebuild
    for pkgbase_file in /usr/lib/modules/*/pkgbase
        set kver (string replace -r '.*/modules/([^/]+)/pkgbase' '$1' $pkgbase_file)
        set pkgbase (cat $pkgbase_file)
        echo ":: Building initramfs for $pkgbase ($kver)"
        sudo dracut --force --no-hostonly-cmdline --hostonly -L 3 /boot/initramfs-$pkgbase.img --kver $kver
        echo ":: Building fallback initramfs for $pkgbase ($kver)"
        sudo dracut --force --no-hostonly-cmdline --no-hostonly -L 1 -o "network rdma" /boot/initramfs-$pkgbase-fallback.img --kver $kver
    end
end
