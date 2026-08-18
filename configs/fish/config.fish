function fish_greeting
    set_color normal
end

if status is-interactive
    # ==========
    # Sets
    # ==========

    set -gx EDITOR (which nvim)
    set -gx VISUAL (which nvim)
    set -x PATH /usr/bin/ $PATH
    set --erase --universal fish_key_bindings
    set -x PKG_CONFIG_PATH /usr/local/lib/pkgconfig /usr/local/share/pkgconfig $PKG_CONFIG_PATH
    set -g stell_alive "#ffb31c"
    set -x PATH $HOME/.cargo/bin $PATH
    set -x PATH $ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin $PATH
    set -gx PATH $PATH $HOME/.lmstudio/bin
    set -x XDG_DATA_DIRS /home/deltacat/my-files/Launcher/install/share:/usr/local/share:/usr/share
    set -x PATH /home/deltacat/my-files/Launcher/install/bin $PATH
    set -x PATH /home/deltacat/.local/bin $PATH
    set -x ANDROID_NDK_HOME /opt/android-ndk
    set -x PATH /usr/lib/ccache/bin $PATH
    set -gx CARGO_NET_GIT_FETCH_WITH_CLI true
    set -x TERM xterm-256color
    set -x MSF_DATABASE_CONFIG /home/deltacat/.msf4/database.yml
    set -x PATH /usr/bin/ $PATH

    # ==========
    # Inits
    # ==========
    starship init fish | source
    zoxide init fish | source

    # ==========
    # Abbrs
    # ==========
    abbr catb 'bat --style changes '
    abbr wget 'wget -c '

    abbr tarnow 'tar -acf output.tar.zst input'
    abbr untar 'tar -zxvf input.tar.zst'
    abbr 7znow '7z a output.7z input'
    abbr un7z '7z x input.7z'

    abbr rcp 'rsync -aHAXxh --info=progress2'
    abbr rmv 'rsync -aHAXxh --remove-source-files --info=progress2'
    #take

    abbr imun-true 'sudo chattr +i'
    abbr imun-false 'sudo chattr -i'

    abbr pip-inst 'pip install --break-system-packages'

    abbr gowall-edit 'gowall convert ~/Pictures/Wallpapers/WALL-NAME -t color-scheme'
    abbr gowall-list 'gowall list'

    abbr code-photo 'freeze src/main.rs ~/myfiles/main-rs.png'

    # ========= FFMPEG ===========
    abbr ffmg-compress "set f file.mkv; set out (string replace -r '\\.[^.]+\$' '' -- \$f)-compress.mp4; ffmpeg -i \$f -c:v av1_nvenc -preset p7 -tune hq -rc vbr -cq 40 -multipass fullres \$out"
    abbr ffmg-convert "set f file.mkv; set out (string replace -r '\\.[^.]+\$' '' -- \$f)-converted.mp4; ffmpeg -i \$f -c:v libx264 -preset medium -crf 20 -c:a aac -b:a 192k \$out"
    abbr ffmg-denoise "set f file.mp4; set out (string replace -r '\\.[^.]+\$' '' -- \$f)-denoised.mp4; ffmpeg -i \$f -vf hqdn3d=4:3:6:4.5 -c:v av1_nvenc -preset p7 -cq 30 -c:a copy \$out"
    abbr ffmg-denoise-strong "set f file.mp4; set out (string replace -r '\\.[^.]+\$' '' -- \$f)-denoised.mp4; ffmpeg -i \$f -vf \"format=yuv420p,deblock=filter=strong:block=4,hqdn3d=6:4:20:30,atadenoise=0.1:0.1:0.3\" -c:v av1_nvenc -preset p7 -cq 28 -c:a copy \$out"
    abbr ffmg-stab "set f file.mp4; set out (string replace -r '\\.[^.]+\$' '' -- \$f)-stab.mp4; set trf (mktemp -u /tmp/vidstab_XXXXXX.trf); ffmpeg -i \$f -vf vidstabdetect=shakiness=5:accuracy=15:result=\$trf -f null -; and ffmpeg -i \$f -vf vidstabtransform=input=\$trf:zoom=0:smoothing=10,unsharp=5:5:0.8:3:3:0.4 -c:v av1_nvenc -preset p7 -cq 30 -c:a copy \$out; rm -f \$trf"
    abbr ffmg-extract-audio "set f file.mp4; set out (string replace -r '\\.[^.]+\$' '' -- \$f).ogg; ffmpeg -i \$f -vn -c:a libvorbis -q:a 6 \$out"
    abbr ffmg-extract-frames "set f file.mp4; set dir (string replace -r '\\.[^.]+\$' '' -- \$f)_frames; mkdir -p \$dir; ffmpeg -i \$f -vf fps=1 \$dir/frame_%04d.png"
    abbr ffmg-gif "set f file.mp4; set out (string replace -r '\\.[^.]+\$' '' -- \$f).gif; ffmpeg -i \$f -vf \"fps=15,scale=480:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse\" -loop 0 \$out"
    abbr ffmg-trim "set f file.mp4; set out (string replace -r '\\.[^.]+\$' '' -- \$f)-trim.mp4; ffmpeg -ss 00:00:10 -to 00:00:30 -i \$f -c copy \$out"

    # === for debian ===
    abbr at 'sudo apt install'

    abbr pskill "sudo pkill -9"

    abbr own 'sudo chown -R $USER:$USER ~/file'

    # === Gentoo ===
    abbr gto-overlay-repos 'sudo nano /etc/portage/repos.conf/eselect-repo.conf '
    abbr gto-overlay-list 'sudo eselect repository list'
    abbr gto-overlay-enbl 'sudo eselect repository enable name'
    abbr gto-overlay-update 'sudo emaint sync -A'
    abbr gto-unmask-edit 'sudo nano /etc/portage/package.accept_keywords/misc'
    abbr gto-unmask 'echo "category/package ~amd64" | sudo tee -a /etc/portage/package.accept_keywords/misc'
    abbr gto-pkg-use-edit 'sudo nano /etc/portage/package.use/misc'
    abbr gto-pkg-use "echo 'category/package flag' | sudo tee -a /etc/portage/package.use/misc"
    abbr gto-world 'sudo emerge --ask --newuse --deep @world'
    abbr gto-clean 'sudo emerge --ask --depclean'
    abbr gto-USE 'sudo nano /etc/portage/make.conf'
    abbr gto-aply-sett 'sudo dispatch-conf'
    abbr gto-world-list 'cat /var/lib/portage/world'

    # ==== git ====
    #gt
    abbr gt-init 'git init'
    abbr gt-status 'git status'
    abbr gt-add-all 'git add .'
    abbr gt-commit 'git commit -m "Commit_Name"'
    abbr gt-push 'git push'
    abbr gt-pull 'git pull'
    abbr gt-log 'git log --oneline --graph'
    #abbr gt-setup 
    abbr gt-fastcommit 'git add .; git commit -m "fastCommit"; git push'
    #dcs-git-ssh-setup
    abbr gt-fastcommit-tag 'git add .; git commit -m "1.23.0"; git tag -a v1.23.0 -m "1.23.0"; git push --follow-tags'

    # AUR / makepkg
    #aur
    abbr aur-clone 'git clone ssh://aur@aur.archlinux.org/'
    abbr aur-push 'updpkgsums; makepkg --printsrcinfo > .SRCINFO; git add PKGBUILD .SRCINFO; git commit -m "$(grep pkgver PKGBUILD | head -1 | cut -d= -f2) update"; git push'
    abbr aur-build 'makepkg -si'
    abbr aur-check 'namcap PKGBUILD'
    abbr aur-srcinfo 'makepkg --printsrcinfo > .SRCINFO'

    # === journalctl ===
    abbr jlog 'journalctl -b 0 | tee ~/last-session.log'
    abbr jlog-prev 'journalctl -b -1 | tee ~/last-session-prev.log'
    abbr jlog-err 'journalctl -b 0 -p err | tee ~/last-session-errors.log'
    abbr jlog-prev-err 'journalctl -b -1 -p err | tee ~/last-session-prev-errors.log'

    # ==========
    # Aliases
    # ==========
    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."
    alias .....="cd ../../../.."
    alias ......="cd ../../../../.."

    alias networkm-restart='sudo systemctl restart NetworkManager'

    alias orbot="proxychains4 -q"

    alias dl="cd ~/Downloads"
    alias doc="cd ~/Documents"
    alias dt="cd ~/Desktop"
    alias gt="cd ~/my-files/my-git-repos"
    alias aur="cd ~/my-files/my-aur-repos"

    alias reload="source ~/.config/fish/config.fish"

    #searx_up
    #searx_down

    alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
    alias lsz='eza -al --color=always --total-size --group-directories-first --icons=always' # include file size
    alias lsa='eza -a --color=always --group-directories-first --icons=always' # all files and dirs
    alias lsl='eza -l --color=always --group-directories-first --icons=always' # long format
    alias lst='eza -aT --color=always --group-directories-first --icons=always' # tree listing
    alias lsd='eza -ald --color=always --group-directories-first --icons=always .*' # show only dotfiles

    alias grep='ugrep'
    alias egrep='ugrep -E'
    alias fgrep='ugrep -f'

    alias mir-arch='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
    alias mir-blac='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/blackarch-mirrorlist'
    alias mir-chao='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/chaotic-mirrorlist'
    alias mir-cach='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/cachyos-mirrorlist'
    alias mir-cach3='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/cachyos-v3-mirrorlist'
    alias mir-cach4='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/cachyos-v4-mirrorlist'

    alias please='sudo'

    alias rm-full='ls && read -P "Filename: " RMFILE && test -f $RMFILE && dd if=/dev/urandom of=$RMFILE bs=(stat -c%s $RMFILE) count=1 conv=notrunc status=progress && rm -rfi $RMFILE'

    alias ffo='fastfetch'
    alias ff='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/arch.txt'
    alias ffh='fastfetch --logo ~/.config/fastfetch/hypr.png --logo-type kitty --logo-width 45 --logo-height 35'
    alias ffhg='fastfetch --logo ~/.config/fastfetch/hypr-gruvbox.png --logo-type kitty --logo-width 45 --logo-height 35'
    alias ffm='fastfetch --logo ~/.config/fastfetch/myst.png --logo-type kitty --logo-width 50 --logo-height 25'
    alias ffnya='fastfetch --logo ~/.config/fastfetch/nyarch.png --logo-type kitty --logo-width 50 --logo-height 25'
    alias ffhornet='fastfetch --logo ~/.config/fastfetch/hornet-ff.png --logo-type kitty --logo-width 49 --logo-height 21'

    alias ffc='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/cake.txt --logo-color-1 "$stell_alive"'
    alias ffn='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/nuke.txt --logo-color-1 "$stell_alive"'
    alias ffcam='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/camera.txt --logo-color-1 "$stell_alive"'
    alias ffs='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/sience.txt --logo-color-1 "$stell_alive"'
    alias fffire='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/fire.txt --logo-color-1 "$stell_alive"'
    alias ffap='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/aperture.txt --logo-color-1 "$stell_alive"'
    alias ffmesa='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/blackmesa.txt --logo-color-1 "$stell_alive"'
    alias ffkaboom='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/kaboom.txt --logo-color-1 "$stell_alive"'
    alias ffbh='fastfetch --logo-type file --logo ~/.config/fastfetch/templates/broken-heart.txt --logo-color-1 "$stell_alive"'

    alias netorbit='sudo ~/.local/bin/netorbit --violet'

    alias neo='neo-matrix -D -S 13 -f 240 -F -M 1 --colormode=256'
    alias bonsai='rbonsai -li'
    alias quarium='asciiquarium'
    alias rick='curl ascii.live/rick'
    alias map='telnet mapscii.me'
    alias tetris-sand='setrixtui'

    # =========================
    #  DeltaCat Scripts block
    # =========================
    alias dcs-makepkg-edit='nvim ~/.config/pacman/makepkg.conf'

    alias dcs-health-analyze='sudo echo "=== БАТАРЕЯ ===" && upower -i /org/freedesktop/UPower/devices/battery_BAT1 | rg "capacity|energy-full" && echo "=== SSD ===" && sudo smartctl -a /dev/nvme0n1 | rg "Percentage Used|Available Spare|Data Units Written"'
    alias dcs-btrfs-balance='sudo btrfs balance start -dusage=90 / '

    alias dcs-grub-edit='sudo nano /etc/default/grub'
    alias dcs-grub-upgrade='sudo grub-mkconfig -o /boot/grub/grub.cfg'
    alias dcs-grub-cmdline='cat /etc/default/grub | grep "GRUB_CMDLINE_LINUX_DEFAULT" '

    alias dcs-dracut-edit='sudo nano /etc/dracut.conf.d/myflags.conf'
    alias dcs-dracut-conf='cat /etc/dracut.conf.d/myflags.conf'

    alias dcs-nvmodprobe-edit='sudo nano /etc/modprobe.d/nvidia.conf'
    alias dcs-nvmodprobe-conf='cat /etc/modprobe.d/nvidia.conf'

    alias dcs-fish-edit='nano ~/.config/fish/config.fish'
    alias dcs-fish-editv='nvim ~/.config/fish/config.fish'

    alias dcs-pacman-edit='sudo nano /etc/pacman.conf'
    alias dcs-pacman-clear='sudo rm -rf /var/cache/pacman/pkg/*'
    alias dcs-pacman-unlock='sudo rm -rf /var/lib/pacman/db.lck'

    alias dcs-dependencies-setup='sudo pacman -Syy --needed eza ugrep fastfetch matugen bat starship rate-mirrors reflector dracut grub smartmontools upower plocate libsecret'
    alias dcs-folders-setup='mkdir -p ~/Pictures ~/Videos ~/Music ~/Documents ~/Downloads ~/Desktop ~/Games ~/my-files/my-git-repos ~/my-files/Scripts ~/logs'

    alias dcs-rf-unblock='sudo rfkill unblock 1'

    alias dcs-hashcat-restore='sudo find /root/.local/share/hashcat/sessions/ -name "*.restore" && read -P "Session name: " SESSIONHC && sudo hashcat --session $SESSIONHC --restore'
    alias dcs-hashcat-passwd='ls && read -P "Filename: " HASHNAME && sudo hashcat -m 22000 $HASHNAME --show --potfile-path /root/.local/share/hashcat/hashcat.potfile'
    alias dcs-hashcat-passcheck='sudo cat /root/.local/share/hashcat/hashcat.potfile'
    alias dcs-hashcat-watching='sudo watch -n 5 bat --style header,snip,changes /root/.local/share/hashcat/hashcat.potfile'

    abbr dcs-mon-start 'sudo airmon-ng start wlan0'
    abbr dcs-mon-stop 'sudo airmon-ng stop wlan0mon'

    alias dcs-rust-setup='sudo pacman -S rustup rust-src cargo-ndk android-ndk && rustup default stable && rustup target add aarch64-linux-android'
    alias dcs-rustbookua-setup='cargo install mdbook; git clone https://github.com/rust-lang-ua/rustbook_ukrainian ~/my-files/rustbook_ukrainian && cd ~/my-files/rustbook_ukrainian && mdbook build'
    alias dcs-rustbookua='cd ~/my-files/rustbook_ukrainian && mdbook serve --open'
    alias dcs-rust-aarch-build-rel='cargo ndk -t aarch64-linux-android build --release'
    alias dcs-rust-aarch-build='cargo ndk -t aarch64-linux-android build'

    # =========================
    #  DeltaCat Scripts Ports
    # =========================
    # Реалізація через функції, знаходяться далі(притримуюсь принципу монолітного конфігу)
    # dcs-dracut-rebuild - v2 працює ідеально

    # dcs-garuda-update - v1.6
    alias dcs-garuda-update-aur='dcs-garuda-update --aur'
    alias dcs-garuda-update-skip-mirror='dcs-garuda-update --skip-mirrorlist'

    # emerge - Своя реалізація, обгортка над AUR Helper aura(https://github.com/Undercat037/aura-emerge)

    function gt-setup
        argparse 'u/user=' 'n/name=' h/help -- $argv
        or return 1

        if set -q _flag_help
            echo "Usage: gt-setup -u <Username> [-n <RepoName>]"
            return 0
        end

        set -l github_user
        set -l repo_name

        if set -q _flag_user
            set github_user $_flag_user
        else
            echo ">>> Error: GitHub username required (-u)"
            return 1
        end

        if set -q _flag_name
            set repo_name $_flag_name
        else
            set repo_name (basename (pwd))
        end

        # 1. Git Init
        if not test -d .git
            git init
            echo ">>> Initialized Git repository."
        end

        # 2. Safety First: Only add a specific dummy file
        # This creates a commit history without touching your existing files
        date >.init
        echo "Repository initialized by gt-setup" >>.init

        git add .init
        git commit -m "Initial commit (system initialization)"
        git branch -M main

        # 3. Setup Remote
        git remote remove origin 2>/dev/null
        git remote add origin "https://github.com/$github_user/$repo_name.git"

        # 4. Push only the .init file
        echo ">>> Syncing initialization with GitHub..."
        if git push -u origin main
            echo ">>> Success! Git is ready."
            echo ">>> YOUR FILES ARE NOT ADDED YET. Use 'git add <files>' to start backing up your code."
        else
            echo ">>> Error: Push failed. Make sure the repo exists on GitHub!"
        end
    end

end

function take
    sudo setfacl -R -m u:$USER:rwx $argv
    sudo setfacl -R -d -m u:$USER:rwx $argv
end
# ==========================================
# Localtunnel (deltax-*) Functions
# ==========================================

function penpot_up
    docker compose -p penpot -f ~/my-files/my-docker-tools/penpot/docker-compose.yaml up -d
    pkill -f "lt --port 9000" 2>/dev/null
    sleep 8
    lt --port 9000 --subdomain deltax-penpot >/dev/null 2>&1 &
    disown
    echo "Ссылка: https://deltax-penpot.loca.lt"
    echo "IP для верификации:" (curl -s icanhazip.com)
end

function penpot_down
    docker compose -p penpot -f ~/my-files/my-docker-tools/penpot/docker-compose.yaml down
    pkill -f "lt --port 9000" 2>/dev/null
end

function penpot_reload
    penpot_down
    sleep 1
    penpot_up
end

function searx_up
    docker compose -p searxng -f ~/my-files/my-docker-tools/searxng/docker-compose.yml up -d
    pkill -f "lt --port 8080" 2>/dev/null
    sleep 2
    lt --port 8080 --subdomain deltax-searxng >/dev/null 2>&1 &
    disown
    echo "Туннель для SearXNG запущен!"
    echo "Ссылка: https://deltax-searxng.loca.lt"
    echo "IP для верификации:" (curl -s icanhazip.com)
end

function searx_down
    docker compose -p searxng -f ~/my-files/my-docker-tools/searxng/docker-compose.yml down
    pkill -f "lt --port 8080" 2>/dev/null
end

function searx_reload
    searx_down
    sleep 1
    searx_up
end

# ===========================

function dcs-git-ssh-setup
    ssh-keygen -t ed25519 -C (git config --global user.email)
    echo ""
    echo "Добавь этот ключ на github.com/settings/keys:"
    echo ""
    cat ~/.ssh/id_ed25519.pub
    echo ""
    read -P "Нажми Enter после добавления ключа на GitHub..." _
    ssh -T git@github.com
    git config --global url."git@github.com:".insteadOf "https://github.com/"
    set_color green
    echo "SSH настроен. Все новые клонированые репо будут через SSH."
    set_color normal
end

# ==================================
# dcs-dracut-rebuild
# ==================================
# Port of /usr/share/libalpm/scripts/dracut-install-garuda
# Трекинг ошибок: /var/lib/garuda/initramfs_error
function dcs-dracut-rebuild
    if test (id -u) -ne 0
        sudo fish -c "source ~/.config/fish/config.fish; dcs-dracut-rebuild"
        return $status
    end

    set -l error_file /var/lib/garuda/initramfs_error
    set -l overall_status 0

    for pkgbase_file in /usr/lib/modules/*/pkgbase
        set -l kver (string replace -r '.*/modules/([^/]+)/pkgbase' '$1' $pkgbase_file)
        set -l pkgbase (cat $pkgbase_file)

        # Пропускаем ядра не принадлежащие ни одному пакету (резервные копии модулей)
        if not pacman -Qqo $pkgbase_file >/dev/null 2>&1
            set_color yellow
            echo ":: Skipping $pkgbase ($kver) — not owned by any package"
            set_color normal
            continue
        end

        echo ":: Building initramfs for $pkgbase ($kver)"
        set -l dracut_ok 1
        dracut --force --no-hostonly-cmdline --hostonly -L 3 /boot/initramfs-$pkgbase.img --kver $kver
        or set dracut_ok 0

        if test $dracut_ok -eq 1
            echo ":: Building fallback initramfs for $pkgbase ($kver)"
            dracut --force --no-hostonly-cmdline --no-hostonly -L 1 -o "network rdma" /boot/initramfs-$pkgbase-fallback.img --kver $kver
            or set dracut_ok 0
        end

        if test $dracut_ok -eq 1
            if test -f $error_file
                sed -i "/$pkgbase/d" $error_file
                not test -s $error_file; and rm -f $error_file
            end
        else
            set_color red
            echo ":: Failed to build initramfs for $pkgbase ($kver)"
            set_color normal
            echo $pkgbase >>$error_file
            set overall_status 1
        end
    end

    return $overall_status
end

# ==================================
# dcs-garuda-update
# Port: /usr/bin/garuda-update + main-update + update-helper-scripts
# ==================================
function dcs-garuda-update --description "Portable pacman system updater"

    # ── Флаги ────────────────────────────────────────────────────────────────
    set -l do_aur 0
    set -l skip_mirror 0
    set -l extra_opts
    set -l _errors
    set -l _warnings

    # Переменные статусов (теперь объявлены на уровне всей функции)
    set -l dracut_exit 0
    set -l grub_exit 0
    set -l locale_exit 0

    for arg in $argv
        switch $arg
            case -a --aur
                set do_aur 1
            case --skip-mirrorlist
                set skip_mirror 1
            case -h --help help
                set_color yellow
                echo "dcs-garuda-update — portable system updater"
                set_color normal
                echo ""
                echo "  -a, --aur             Update AUR packages (paru/yay)"
                echo "  --skip-mirrorlist     Skip mirrorlist refresh"
                echo "  -h, --help            This help"
                echo ""
                echo "  Aliases: dcs-update  dcs-update-aur  dcs-update-skip-mirror"
                return 0
            case --
            case '*'
                set -a extra_opts $arg
        end
    end

    # ── Эскалация прав ───────────────────────────────────────────────────────
    if test (id -u) -ne 0
        set -l rerun
        test $do_aur -eq 1; and set -a rerun --aur
        test $skip_mirror -eq 1; and set -a rerun --skip-mirrorlist
        set -a rerun $extra_opts
        sudo fish -c "source ~/.config/fish/config.fish; dcs-garuda-update $rerun"
        return $status
    end

    # ── Снапшот-проверка ─────────────────────────────────────────────────────
    if grep -qE 'subvol=@/.snapshots/[0-9]+/snapshot' /proc/cmdline 2>/dev/null
        and not set -q GARUDA_SNAPSHOT_PACMAN
        set_color red
        echo "Error: booted into snapshot. Restore it before updating."
        echo "  Override: GARUDA_SNAPSHOT_PACMAN=1 dcs-garuda-update"
        set_color normal
        return 1
    end

    # ── Лог ──────────────────────────────────────────────────────────────────
    set -l logfile /var/log/dcs-update.log
    mkdir -p (dirname $logfile) 2>/dev/null
    echo "" >>$logfile
    echo ">-<->-< dcs-garuda-update "(date +"%Y-%m-%d %R %Z") >>$logfile 2>/dev/null

    # ── Mirrorlist ────────────────────────────────────────────────────────────
    set -l db_flag -y

    if test $skip_mirror -eq 0
        if command -q rate-mirrors
            set_color yellow
            echo ""
            echo "--> Refreshing mirrorlist (rate-mirrors)... 🍵"
            set_color normal
            set -l tmp (mktemp)
            if rate-mirrors --allow-root --save=$tmp arch --max-delay=21600 >/dev/null 2>&1
                set -l cnt (grep -Ec "^Server *= *" $tmp 2>/dev/null; or echo 0)
                if test "$cnt" -ge 10
                    install -m644 $tmp /etc/pacman.d/mirrorlist
                    set db_flag -yy
                    set_color green
                    echo "  Mirrorlist updated ($cnt mirrors)."
                    set_color normal
                else
                    set -a _warnings "Mirrorlist too short ($cnt mirrors) — skipped"
                    set_color yellow
                    echo "  Too short ($cnt mirrors), skipped."
                    set_color normal
                end
            else
                set -a _warnings "rate-mirrors failed — mirrorlist not updated"
                set_color yellow
                echo "  rate-mirrors failed."
                set_color normal
            end
            rm -f $tmp

        else if command -q reflector
            set_color yellow
            echo ""
            echo "--> Refreshing mirrorlist (reflector)... 🍵"
            set_color normal
            set -l tmp (mktemp)
            if reflector --latest 10 --age 2 --fastest 10 --protocol https --sort rate --save $tmp 2>/dev/null
                set -l cnt (grep -Ec "^Server *= *" $tmp 2>/dev/null; or echo 0)
                if test "$cnt" -ge 5
                    install -m644 $tmp /etc/pacman.d/mirrorlist
                    set db_flag -yy
                    set_color green
                    echo "  Mirrorlist updated ($cnt mirrors)."
                    set_color normal
                else
                    set -a _warnings "Mirrorlist too short ($cnt mirrors) — skipped"
                    set_color yellow
                    echo "  Too short ($cnt mirrors), skipped."
                    set_color normal
                end
            else
                set -a _warnings "reflector failed — mirrorlist not updated"
                set_color yellow
                echo "  reflector failed."
                set_color normal
            end
            rm -f $tmp
        else
            set -a _warnings "No mirrorlist tool found (rate-mirrors / reflector)"
        end
        echo ""
    end

    # ── Pre-update: кейринги ──────────────────────────────────────────────────
    set -l keyrings archlinux-keyring
    if test -f /etc/pacman.d/chaotic-mirrorlist
        set -a keyrings chaotic-keyring
    end
    if pacman -Qq blackarch-keyring >/dev/null 2>&1
        set -a keyrings blackarch-keyring
    end

    set -l keyring_updates (pacman -Qu $keyrings 2>/dev/null)
    if test -n "$keyring_updates"
        set_color yellow
        echo "--> Updating keyrings first..."
        set_color normal
        set -l keyring_exit 0
        SNAP_PAC_SKIP=y SKIP_AUTOSNAP='' pacman -S --needed --noconfirm $keyrings
        or set keyring_exit $status
        if test $keyring_exit -ne 0
            set -a _warnings "Keyring update failed (exit $keyring_exit) — continuing anyway"
        else
            set db_flag -yy
        end
        echo ""
    end

    # ── Сборка аргументов pacman ──────────────────────────────────────────────
    set -l pacman_bin pacman
    set -q PACMAN_EXE; and set pacman_bin $PACMAN_EXE

    set -l pacman_args -Su $db_flag --noconfirm
    for o in $extra_opts
        set -a pacman_args $o
    end

    # ── Обновление пакетов через Pacman ───────────────────────────────────────
    set_color yellow
    echo "--> $pacman_bin $pacman_args"
    set_color normal
    echo ""

    set -l pacman_exit 0
    $pacman_bin $pacman_args
    or set pacman_exit $status

    if test $pacman_exit -ne 0
        set -a _errors "pacman exited with code $pacman_exit"
        set_color red
        echo "pacman failed (exit $pacman_exit)."
        set_color normal
    end

    # ── AUR ───────────────────────────────────────────────────────────────────
    set -l aur_exit 0
    if test $do_aur -eq 1
        set -l real_uid $SUDO_UID
        test -z "$real_uid"; and test -n "$SUDO_USER"
        and set real_uid (id -u $SUDO_USER 2>/dev/null)

        if test -x /usr/bin/paru; and test -n "$real_uid"
            set_color yellow
            echo ""
            echo "--> Updating AUR (paru).."
            set_color normal
            sudo -u "#$real_uid" paru -Sua
            or begin
                set aur_exit $status
                set -a _errors "paru exited with code $aur_exit"
            end
        else if test -x /usr/bin/yay; and test -n "$real_uid"
            set_color yellow
            echo ""
            echo "--> Updating AUR (yay).."
            set_color normal
            sudo -u "#$real_uid" yay -Sua
            or begin
                set aur_exit $status
                set -a _errors "yay exited with code $aur_exit"
            end
        else
            set -a _warnings "--aur: no AUR helper found (paru/yay)"
            set_color yellow
            echo "--> --aur: no AUR helper found ❌"
            set_color normal
        end
    end

    # ── DKMS rebuild ─────────────────────────────────────────────────────────
    set -l dkms_exit 0
    if command -q dkms
        set -l dkms_failed 0
        set -l dkms_ran 0
        for kdir in /usr/lib/modules/*/pkgbase
            set -l kver (string replace -r '.*/modules/([^/]+)/pkgbase' '$1' $kdir)
            if not pacman -Qqo $kdir >/dev/null 2>&1
                continue
            end
            if not test -d /usr/lib/modules/$kver/build
                set_color yellow
                echo "  DKMS: skipping $kver — headers not found"
                set_color normal
                continue
            end
            set -l modules_for_kver (dkms status -k $kver 2>/dev/null | grep -v '^$')
            if test -z "$modules_for_kver"
                set_color cyan
                echo "  DKMS: no modules for $kver, skipping"
                set_color normal
                continue
            end
            set dkms_ran 1
            set_color yellow
            echo ""
            echo "--> Rebuilding DKMS modules for $kver..."
            set_color normal
            for mod_line in $modules_for_kver
                set -l mod_ver (string replace -r ',.*' '' $mod_line | string trim)
                set_color cyan
                echo "  -> $mod_ver ($kver)"
                set_color normal
                dkms install $mod_ver -k $kver
                or set dkms_failed 1
            end
            depmod -a $kver
        end
        if test $dkms_ran -eq 0
            set_color cyan
            echo ""
            echo "--> DKMS: no modules or headers found, skipping."
            set_color normal
        end
        if test $dkms_failed -eq 1
            set dkms_exit 1
            set -a _errors "dkms install failed for one or more modules"
        end
    end

    # ── Rebuild initramfs (Dracut) ─────────────────────────────────────────────
    if command -q dracut
        set_color yellow
        echo ""
        echo "--> Rebuilding initramfs..."
        set_color normal
        dcs-dracut-rebuild
        set dracut_exit $status
        if test $dracut_exit -ne 0
            set -a _errors "dracut failed with code $dracut_exit"
        end
    end

    # ── Update GRUB configuration ─────────────────────────────────────────────
    if command -q grub-mkconfig; and test -f /boot/grub/grub.cfg
        set_color yellow
        echo ""
        echo "--> Updating GRUB configuration..."
        set_color normal
        sudo grub-mkconfig -o /boot/grub/grub.cfg
        set grub_exit $status
        if test $grub_exit -ne 0
            set -a _errors "grub-mkconfig exited with code $grub_exit"
        end
    end

    # ── Locale rebuild ────────────────────────────────────────────────────────
    if command -q locale-gen; and test -f /etc/locale.gen
        set_color yellow
        echo ""
        echo "--> Regenerating locales..."
        set_color normal
        locale-gen
        or begin
            set locale_exit $status
            set -a _errors "locale-gen failed (exit $locale_exit)"
        end
    end

    # ── ФИНАЛЬНЫЙ ОТЧЕТ (Генерация вывода) ─────────────────────────────────────
    echo ""
    echo "━━━━━━━━━━━━━━━━ СТАТУС ОБНОВЛЕНИЯ ━━━━━━━━━━━━━━━━"

    # Вывод статуса pacman
    if test $pacman_exit -eq 0
        echo "    ✔ pacman system update"
    else
        set_color red
        echo "    ✘ pacman $pacman_args  (exit $pacman_exit)"
        set_color normal
    end

    # Вывод статуса AUR
    if test $do_aur -eq 1
        if test $aur_exit -eq 0
            echo "    ✔ AUR update"
        else
            set_color red
            echo "    ✘ AUR update (exit $aur_exit)"
            set_color normal
        end
    end

    # Вывод статуса DKMS
    if command -q dkms
        set -l _has_dkms_mods (dkms status 2>/dev/null | grep -c .)
        if test -n "$_has_dkms_mods"
            if test $dkms_exit -eq 0
                echo "    ✔ DKMS rebuild"
            else
                set_color red
                echo "    ✘ DKMS rebuild (exit $dkms_exit)"
                set_color normal
            end
        end
    end

    # Вывод статуса локалей
    if command -q locale-gen; and test -f /etc/locale.gen
        if test $locale_exit -eq 0
            echo "    ✔ locale-gen"
        else
            set_color red
            echo "    ✘ locale-gen (exit $locale_exit)"
            set_color normal
        end
    end

    # Вывод статуса Dracut
    if command -q dracut
        if test $dracut_exit -eq 0
            echo "    ✔ initramfs rebuild"
        else
            set_color red
            echo "    ✘ initramfs rebuild (exit $dracut_exit)"
            set_color normal
        end
    end

    # Вывод статуса GRUB
    if command -q grub-mkconfig; and test -f /boot/grub/grub.cfg
        if test $grub_exit -eq 0
            echo "    ✔ grub-mkconfig"
        else
            set_color red
            echo "    ✘ grub-mkconfig (exit $grub_exit)"
            set_color normal
        end
    end

    # Вывод предупреждений (Warnings)
    if test (count $_warnings) -gt 0
        echo ""
        set_color yellow
        echo "  Warnings:"
        set_color normal
        for w in $_warnings
            echo "    ⚠ $w"
        end
    end

    # Вывод ошибок (Errors) и подсказок (Fixes)
    if test (count $_errors) -gt 0
        echo ""
        set_color red
        echo "  Errors:"
        set_color normal
        for e in $_errors
            echo "    ✘ $e"
        end
        echo ""
        set_color yellow
        echo "  Fixes:"
        set_color normal
        for e in $_errors
            switch $e
                case "pacman exited*"
                    echo "    • sudo pacman -Sc && dcs-garuda-update   — clear cache, retry"
                    echo "    • sudo pacman-key --refresh-keys          — keyring issues"
                    echo "    • dcs-garuda-update --skip-mirrorlist     — skip mirror refresh"
                    echo "    • sudo pacman -Syuu                       — allow downgrades"
                case "paru*" "yay*"
                    echo "    • paru -Sua  /  yay -Sua"
                case "dkms install*"
                    echo "    • dkms status                        — check module state"
                    echo "    • sudo dkms install <mod>/<ver> -k <kver>  — retry specific module"
                    echo "    • sudo pacman -S linux-headers        — missing headers?"
                case "locale-gen*"
                    echo "    • sudo locale-gen                    — retry"
                    echo "    • check /etc/locale.gen for enabled locales"
                case "dcs-dracut-rebuild*" "dracut failed*"
                    echo "    • sudo dcs-dracut-rebuild"
                    echo "    • Check boot partition: ls /boot/ /boot/efi/"
                case "grub-mkconfig*"
                    echo "    • sudo grub-mkconfig -o /boot/grub/grub.cfg"
                    echo "    • sudo dcs-grub-upgrade"
            end
        end
    end

    echo ""
    echo "  Log: $logfile"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    test (count $_errors) -eq 0
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/deltacat/.lmstudio/bin
# End of LM Studio CLI section
