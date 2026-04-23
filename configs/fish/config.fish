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

abbr jlog='journalctl -b 0 | tee ~/last-session.log'
abbr jlog-prev='journalctl -b -1 | tee ~/last-session-prev.log'
abbr jlog-err='journalctl -b 0 -p err | tee ~/last-session-errors.log'
abbr jlog-prev-err='journalctl -b -1 -p err | tee ~/last-session-prev-errors.log'

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

alias dcs-dependencies-setup='sudo pacman -Syy --needed eza ugrep fastfetch matugen bat starship rate-mirrors reflector dracut grub smartmontools upower plocate'
alias dcs-folders-setup='mkdir -p ~/Pictures ~/Videos ~/Music ~/Documents ~/Downloads ~/Desktop ~/Games ~/my-files/my-git-repos ~/my-files/Scripts ~/logs'

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

# =========================
#  DeltaCat Scripts Ports
# =========================
# Реалізація через функції, знаходяться далі(притримуюсь принципу монолітного конфігу)
#dcs-dracut-rebuild - v2 працює ідеально

#dcs-garuda-update - v1 реліз порту
alias dcs-garuda-update-aur='dcs-garuda-update --aur'
alias dcs-garuda-update-noconfirm='dcs-garuda-update --noconfirm'
alias dcs-garuda-update-skip-mirror='dcs-garuda-update --skip-mirrorlist'



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
            set_color yellow; echo ":: Skipping $pkgbase ($kver) — not owned by any package"; set_color normal
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
            set_color red; echo ":: Failed to build initramfs for $pkgbase ($kver)"; set_color normal
            echo $pkgbase >> $error_file
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
    set -l noconfirm 0
    set -l extra_opts
    set -l _errors
    set -l _warnings
 
    for arg in $argv
        switch $arg
            case -a --aur;           set do_aur 1
            case --skip-mirrorlist;  set skip_mirror 1
            case --noconfirm;        set noconfirm 1
            case -h --help help
                set_color yellow; echo "dcs-garuda-update — portable system updater"; set_color normal
                echo ""
                echo "  -a, --aur             Update AUR packages (paru/yay)"
                echo "  --skip-mirrorlist     Skip mirrorlist refresh"
                echo "  --noconfirm           Pass --noconfirm to pacman"
                echo "  -h, --help            This help"
                echo ""
                echo "  Aliases: dcs-update  dcs-update-aur  dcs-update-noconfirm  dcs-update-skip-mirror"
                return 0
            case '--'
            case '*'; set -a extra_opts $arg
        end
    end
 
    # ── Эскалация прав ───────────────────────────────────────────────────────
    if test (id -u) -ne 0
        set -l rerun
        test $do_aur -eq 1;      and set -a rerun --aur
        test $skip_mirror -eq 1; and set -a rerun --skip-mirrorlist
        test $noconfirm -eq 1;   and set -a rerun --noconfirm
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
    echo "" >> $logfile
    echo ">-<->-< dcs-garuda-update "(date +"%Y-%m-%d %R %Z") >> $logfile 2>/dev/null
 
    # ── Mirrorlist ────────────────────────────────────────────────────────────
    set -l db_flag -y
 
    if test $skip_mirror -eq 0
        if command -q rate-mirrors
            set_color yellow; echo ""; echo "--> Refreshing mirrorlist (rate-mirrors)... 🍵"; set_color normal
            set -l tmp (mktemp)
            if rate-mirrors --allow-root --save=$tmp arch --max-delay=21600 >/dev/null 2>&1
                set -l cnt (grep -Ec "^Server *= *" $tmp 2>/dev/null; or echo 0)
                if test "$cnt" -ge 10
                    install -m644 $tmp /etc/pacman.d/mirrorlist
                    set db_flag -yy
                    set_color green; echo "  Mirrorlist updated ($cnt mirrors)."; set_color normal
                else
                    set -a _warnings "Mirrorlist too short ($cnt mirrors) — skipped"
                    set_color yellow; echo "  Too short ($cnt mirrors), skipped."; set_color normal
                end
            else
                set -a _warnings "rate-mirrors failed — mirrorlist not updated"
                set_color yellow; echo "  rate-mirrors failed."; set_color normal
            end
            rm -f $tmp
 
        else if command -q reflector
            set_color yellow; echo ""; echo "--> Refreshing mirrorlist (reflector)... 🍵"; set_color normal
            set -l tmp (mktemp)
            if reflector --latest 10 --age 2 --fastest 10 --protocol https --sort rate --save $tmp 2>/dev/null
                set -l cnt (grep -Ec "^Server *= *" $tmp 2>/dev/null; or echo 0)
                if test "$cnt" -ge 5
                    install -m644 $tmp /etc/pacman.d/mirrorlist
                    set db_flag -yy
                    set_color green; echo "  Mirrorlist updated ($cnt mirrors)."; set_color normal
                else
                    set -a _warnings "Mirrorlist too short ($cnt mirrors) — skipped"
                    set_color yellow; echo "  Too short ($cnt mirrors), skipped."; set_color normal
                end
            else
                set -a _warnings "reflector failed — mirrorlist not updated"
                set_color yellow; echo "  reflector failed."; set_color normal
            end
            rm -f $tmp
 
        else
            set -a _warnings "No mirrorlist tool found (rate-mirrors / reflector)"
        end
        echo ""
    end
 
    # ── Pre-update: кейринги ──────────────────────────────────────────────────
    # Port of update-helper-scripts::update_keyring_packages
    # Обновляем кейринги первыми — иначе при устаревшем кейринге весь апдейт падает
    set -l keyrings archlinux-keyring
    # chaotic-keyring — если репо подключён
    if test -f /etc/pacman.d/chaotic-mirrorlist
        set -a keyrings chaotic-keyring
    end
    # blackarch-keyring — если установлен
    if pacman -Qq blackarch-keyring >/dev/null 2>&1
        set -a keyrings blackarch-keyring
    end
    # Проверяем есть ли обновления для кейрингов
    set -l keyring_updates (pacman -Qu $keyrings 2>/dev/null)
    if test -n "$keyring_updates"
        set_color yellow; echo "--> Updating keyrings first..."; set_color normal
        set -l keyring_exit 0
        SNAP_PAC_SKIP=y SKIP_AUTOSNAP='' pacman -S --needed --noconfirm $keyrings
        or set keyring_exit $status
        if test $keyring_exit -ne 0
            set -a _warnings "Keyring update failed (exit $keyring_exit) — continuing anyway"
        else
            # Кейринги обновились — форсируем пересинк БД
            set db_flag -yy
        end
        echo ""
    end
 
    # ── Сборка аргументов pacman ──────────────────────────────────────────────
    set -l pacman_bin pacman
    set -q PACMAN_EXE; and set pacman_bin $PACMAN_EXE
 
    set -l pacman_args -Su $db_flag
    test $noconfirm -eq 1; and set -a pacman_args --noconfirm
    for o in $extra_opts; set -a pacman_args $o; end
 
    # ── Обновление ───────────────────────────────────────────────────────────
    set_color yellow; echo "--> $pacman_bin $pacman_args"; set_color normal; echo ""
 
    set -l pacman_exit 0
    $pacman_bin $pacman_args
    or set pacman_exit $status
 
    if test $pacman_exit -ne 0
        set -a _errors "pacman exited with code $pacman_exit"
        set_color red; echo "pacman failed (exit $pacman_exit)."; set_color normal
    end
 
    # ── AUR ───────────────────────────────────────────────────────────────────
    set -l aur_exit 0
    if test $do_aur -eq 1
        set -l real_uid $SUDO_UID
        test -z "$real_uid"; and test -n "$SUDO_USER"
            and set real_uid (id -u $SUDO_USER 2>/dev/null)
 
        if test -x /usr/bin/paru; and test -n "$real_uid"
            set_color yellow; echo ""; echo "--> Updating AUR (paru).."; set_color normal
            sudo -u "#$real_uid" paru -Sua
            or begin; set aur_exit $status; set -a _errors "paru exited with code $aur_exit"; end
        else if test -x /usr/bin/yay; and test -n "$real_uid"
            set_color yellow; echo ""; echo "--> Updating AUR (yay).."; set_color normal
            sudo -u "#$real_uid" yay -Sua
            or begin; set aur_exit $status; set -a _errors "yay exited with code $aur_exit"; end
        else
            set -a _warnings "--aur: no AUR helper found (paru/yay)"
            set_color yellow; echo "--> --aur: no AUR helper found ❌"; set_color normal
        end
    end
 
    # ── dracut rebuild ────────────────────────────────────────────────────────
    set -l dracut_exit 0
    if command -q dracut
        set_color yellow; echo ""; echo "--> Rebuilding initramfs..."; set_color normal
        if functions -q dcs-dracut-rebuild
            dcs-dracut-rebuild
            or begin; set dracut_exit $status; set -a _errors "dcs-dracut-rebuild failed (exit $dracut_exit)"; end
        else
            set -a _warnings "dcs-dracut-rebuild not found — bare dracut fallback (may fail on EFI/UKI)"
            set_color yellow; echo "  dcs-dracut-rebuild not found, using bare dracut"; set_color normal
            for kdir in /usr/lib/modules/*/
                set -l kver (basename $kdir)
                set_color cyan; echo "  -> $kver"; set_color normal
                dracut --force --kver $kver
                or begin; set dracut_exit $status; set -a _errors "dracut failed for $kver (exit $dracut_exit)"; end
            end
        end
    end
 
    # ── GRUB rebuild (если установлен) ───────────────────────────────────────
    set -l grub_exit 0
    if command -q grub-mkconfig; and test -f /boot/grub/grub.cfg
        set_color yellow; echo ""; echo "--> Updating GRUB config..."; set_color normal
        grub-mkconfig -o /boot/grub/grub.cfg
        or begin; set grub_exit $status; set -a _errors "grub-mkconfig failed (exit $grub_exit)"; end
    end
 
    # ── End-routines ─────────────────────────────────────────────────────────
    # plocate index (фоново, чтобы locate видел новые файлы)
    if test -x /usr/bin/locate
        systemctl start plocate-updatedb.service --no-block 2>/dev/null; or true
    end
 
    # ── Garuda: changelog / notices ──────────────────────────────────────────
    if test -e /var/lib/garuda/tmp/update_notices
        set_color green; echo ""; echo "Update notices:"; set_color cyan
        gawk -F '\t' '{print $2}' /var/lib/garuda/tmp/update_notices
        set_color normal
        rm /var/lib/garuda/tmp/update_notices
    end
 
    # ── Garuda Health ─────────────────────────────────────────────────────────
    if test -x /usr/bin/garuda-health
        /usr/bin/garuda-health --forcetty; or true
    end
 
    # ════════════════════════════════════════════════════════════════════════
    # Отчёт
    # ════════════════════════════════════════════════════════════════════════
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    if test (count $_errors) -eq 0
        set_color green; echo "  System updated successfully 🐧"; set_color normal
    else
        set_color red;   echo "  Update finished with errors ❌"; set_color normal
    end
    echo ""
 
    set_color cyan; echo "  Steps:"; set_color normal
    if test $pacman_exit -eq 0
        echo "    ✔ pacman $pacman_args"
    else
        set_color red; echo "    ✘ pacman $pacman_args  (exit $pacman_exit)"; set_color normal
    end
    if test $do_aur -eq 1
        if test $aur_exit -eq 0
            echo "    ✔ AUR update"
        else
            set_color red; echo "    ✘ AUR update (exit $aur_exit)"; set_color normal
        end
    end
    if command -q dracut
        if test $dracut_exit -eq 0
            echo "    ✔ initramfs rebuild"
        else
            set_color red; echo "    ✘ initramfs rebuild (exit $dracut_exit)"; set_color normal
        end
    end
    if command -q grub-mkconfig; and test -f /boot/grub/grub.cfg
        if test $grub_exit -eq 0
            echo "    ✔ grub-mkconfig"
        else
            set_color red; echo "    ✘ grub-mkconfig (exit $grub_exit)"; set_color normal
        end
    end
 
    if test (count $_warnings) -gt 0
        echo ""
        set_color yellow; echo "  Warnings:"; set_color normal
        for w in $_warnings; echo "    ⚠ $w"; end
    end
 
    if test (count $_errors) -gt 0
        echo ""
        set_color red; echo "  Errors:"; set_color normal
        for e in $_errors; echo "    ✘ $e"; end
        echo ""
        set_color yellow; echo "  Fixes:"; set_color normal
        for e in $_errors
            switch $e
                case "pacman exited*"
                    echo "    • sudo pacman -Sc && dcs-garuda-update   — clear cache, retry"
                    echo "    • sudo pacman-key --refresh-keys          — keyring issues"
                    echo "    • dcs-garuda-update --skip-mirrorlist     — skip mirror refresh"
                    echo "    • sudo pacman -Syuu                       — allow downgrades"
                case "paru*" "yay*"
                    echo "    • paru -Sua  /  yay -Sua"
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
 
