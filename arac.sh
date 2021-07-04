#!/bin/bash

echo "
───▄▄▄
─▄▀░▄░▀▄		Hazırlayan:agahemir
─█░█▄▀░█		5 Yıl devamlı olarak güncellenecektir.
─█░▀▄▄▀█▄█▄▀		Sürüm: 1062021
▄▄█▄▄▄▄███▀		Kurulum sırasında uzunca mesajlar çıkabilir. Herhangi bir 				hata mesajı olmadığı sürece sorun yoktur.
"

apt update
var="
Yararlı Sistem Araçlarını İndirmek İstiyormusunuz?
İçerik:
inxi :: Uçbirim tabanlı sistem bilgisi aracı.
curl :: Çeşitli protokolleri destekleyen transfer aracı.
git  :: Git depoları üzerinde işlemler yapmanızı sağlar.
neofetch :: Sistem özelliklerini, göze güzel gelen bir şekilde sıralar.
htop :: Acil durumlar için vazgeçilmez uçbirim görev yöneticisi.
software-properties-common :: APT paket yöneticisi için hızlı bir arayüz.
"
echo "$var"
PS3='Tercih: '
kategori=("Evet" "Hayır, atlayacağım" "Çık")
select fav in "${kategori[@]}"; do
    case $fav in
        "Evet")
	    apt install -y inxi curl git neofetch htop software-properties-common; break;;
        "Hayır, atlayacağım")
	break;;
	"Çık")
	    echo "Görüşmek üzere"
	    exit
	    ;;
        *) echo Söylediğiniz şey "$REPLY" dizgesi, ancak bunu anlayamadım, lütfen tercihinizi sayılarla belirtin.;;
    esac
done
echo
var=$"Ek Uygulamaları İndirmek İstiyormusunuz?
İçerik:
hardinfo:: Sistem bilginizi görüntüleyin ve sisteminizi test edin.
vlc:: Herkesin bildiği medya oynatıcısı.
gnome-paint ya da kolourpaint:: Basit çizim uygulaması
flameshot: : Gelişmiş ekran görüntüsü alma aracı.
kazam :: Basit ve hafif bir ekran kaydedicisi.
gparted-partitionmanager :: Disk bölümlerini düzenleyin.
gnome-multi-writer :: Çoklu disk destekleyen, USB yükleme medyası hazırlama aracı.
menulibre :: Başlangıç menülerini uçbirime gerek kalmadan yönetin.
grub-customizer :: Açılış menünüzü uçbirime gerek kalmadan yönetin ve kontrol edin.
Önemli:
 Sihirbazın içinde yer alan, (gparted,gnome-multi-writer,gnome-paint) paketleri GTK tabanlı masaüstleri (Gnome, Elementary, Budgie, Xfce, Cinnamon, Mate) için daha uygundur, Qt tabanlı masaüstleri olan (KDE,LxQT de tutarsız gözükebilir), ya da fazla bağımlılık kurabilir. Bu yüzden aşağıda kullandığınız masaüstünün araç kitini seçmeniz sizin için faydalı olacaktır. Eğer Qt tabanlı masaüstü kullanıyorsanız, gparted yerine partitionmanager, gnome-paint yerine kolourpaint kurulacaktır.
"

echo "$var"
PS3='Tercih: '
kategori=("GTK Tabanlı Masaüstü" "Qt Tabanlı Masaüstü" "Hayır, atlayacağım" "Çık")
select fav in "${kategori[@]}"; do
    case $fav in
        "GTK Tabanlı Masaüstü")
	    apt install -y hardinfo vlc gnome-paint flameshot kazam gparted gnome-multi-writer grub-customizer; break;;
        "Qt Tabanlı Masaüstü")
	    apt install -y hardinfo vlc kolourpaint flameshot kazam partitionmanager grub-customizer; 
	break;;
        "Hayır, atlayacağım")
	    break
            ;;
	"Çık")
	    echo "Görüşmek üzere"
	    exit
	    ;;
        *)
	    echo Söylediğiniz şey "$REPLY" dizgesi, ancak bunu anlayamadım, lütfen tercihinizi sayılarla belirtin.;;
    esac
done
echo

var=$'Debian da varsayılan olarak Plymouth(bir açılış uygulaması) olmasına rağmen ektin değildir. Sistem açılış ekranınızın grafiksel bir görünüme sahip olmasını istermisiniz?'
echo "$var"
PS3='Tercih: '
kategori=("Evet" "Hayır, atlayacağım" "Çık")
select fav in "${kategori[@]}"; do
    case $fav in
        "Evet")
	    sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=\"\quiet\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\quiet splash\"/' /etc/default/grub && sudo update-grub; break;;
        "Hayır, atlayacağım")
	break;;
	"Çık")
	    echo "Görüşmek üzere"
	    exit
	    ;;
        *) echo Söylediğiniz şey "$REPLY" dizgesi, ancak bunu anlayamadım, lütfen tercihinizi sayılarla belirtin.;;
    esac
done
echo

var=$'Kernel işletim sisteminizin, donanımını yöneten temel bir bütündür. Debian ın stok kerneli sürüm olarak hem düşük hem de bazı aygıtlarda sürücü problemine yol açabilir. Kernel sürümünüzü oyun ve multimedya için iyileştirilmiş Liquorix kernel ile değiştirmek istermisiniz?'
echo "$var"
PS3='Tercih: '
kategori=("Evet" "Hayır, atlayacağım" "Çık")
select fav in "${kategori[@]}"; do
    case $fav in
        "Evet")
	    sudo apt install curl && curl 'https://liquorix.net/add-liquorix-repo.sh' | sudo bash && sudo apt-get install -y linux-image-liquorix-amd64 linux-headers-liquorix-amd64; break;;
        "Hayır, atlayacağım")
	break;;
	"Çık")
	    echo "Görüşmek üzere"
	    exit
	    ;;
        *) echo Söylediğiniz şey "$REPLY" dizgesi, ancak bunu anlayamadım, lütfen tercihinizi sayılarla belirtin.;;
    esac
done
echo
var=$'Flatpak uygulama mağazasını yüklemek istermisiniz? Telegram, Discord, Onlyoffice gibi Debian ın deposunda olmayan çoğu popüler şeyi indirmenizi sağlar. Gnome ya da KDE Plasma masaüstü için özel yazılım merkezi eklentisini de indirebilirsiniz.'
echo "$var"
PS3='Tercih: '
kategori=("Evet" "Evet, GNOME masaüstü kullanıyorum" "Evet, KDE Plasma masaüstü kullanıyorum" "Hayır, atlayacağım")
select fav in "${kategori[@]}"; do
    case $fav in
        "Evet")
	    sudo apt install -y flatpak && sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; break;;
        "Evet, GNOME masaüstü kullanıyorum")
	sudo apt install -y flatpak && sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && sudo apt install -y gnome-software-plugin-flatpak; break;;
        "Evet, KDE Plasma masaüstü kullanıyorum")
	sudo apt install -y flatpak && sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && sudo apt install -y plasma-discover-backend-flatpak; break;;
	"Hayır, atlayacağım")
	    break
	    ;;
        *) echo Söylediğiniz şey "$REPLY" dizgesi, ancak bunu anlayamadım, lütfen tercihinizi sayılarla belirtin.;;
    esac
done
echo
