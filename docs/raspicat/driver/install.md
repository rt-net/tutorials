---
title: デバイスドライバのインストール
robot: Raspberry Pi Cat
---

# デバイスドライバのインストール

このページでは
[Raspberry Pi Catのデバイスドライバ](https://github.com/rt-net/RaspberryPiMouse)
のインストール方法を説明します。

Raspberry Pi CatのLEDやモータを駆動するためには、
デバイスドライバが必要です。

## OSのインストール

Raspberry Pi Catのデバイスドライバは`Ubuntu`と`Raspberry Pi OS (旧称Raspbian)`に対応しています。

後ほどRaspberry Pi Catで**ROSを扱う場合はUbuntu Serverのインストールを推奨します**。

=== "Ubuntu Server 18.04"
    [こちらのリンク](http://cdimage.ubuntu.com/ubuntu/releases/18.04/release/)から`Ubuntu 18.04 server`のイメージをダウンロードします。

    ダウンロードしたイメージは[rpi-imager](https://www.raspberrypi.com/software/)等でSDカードに書き込みます。

=== "Raspberry Pi OS"
    Raspberry Pi OSの場合は、サイトからイメージをダウンロードせずに[rpi-imager](https://www.raspberrypi.com/software/)を使用することで、イメージを書き込むことができます。

## ソースファイルのダウンロードとインストール

Raspberry Pi Catのデバイスドライバのソースファイルは
[GitHub](https://github.com/rt-net/RaspberryPiMouse)
に公開されています。

=== "Ubuntu Server"
    1. 次のコマンドを実行し、デバイスドライバをインストールします
    ```sh
    $ git clone https://github.com/rt-net/RaspberryPiMouse.git $HOME/RaspberryPiMouse
    $ cd $HOME/RaspberryPiMouse/utils
    $ sudo apt install linux-headers-$(uname -r) build-essential
    $ ./build_install.bash
    ```
    1. コマンド実行後にブザーが鳴ればインストール完了です
    1. パルスカウンタの動作を安定させるためI2Cのボーレートを変更します
        1. `/boot/firmware/config.txt`を編集し、`dtparam=i2c_baudrate=62500`を追記します
        1. Raspberry Pi を再起動します
        1. `$ printf "%d\n" 0x$(xxd -ps /sys/class/i2c-adapter/i2c-1/of_node/clock-frequency)`を実行し、`62500`と表示されたら設定完了です。

=== "Raspberry Pi OS"
    1. `Raspberry Piの設定`を開きます
    ![](../../img/raspimouse/driver/raspi_os_settings2.png)
    1. `インターフェイス`に進み、`SPI`と`I2C`の機能を有効にします
    ![](../../img/raspimouse/driver/raspi_os_settings3.png)
    1. ターミナル(`LXTerminal`)を起動します
    ![](../../img/raspimouse/driver/open_terminal.png)
    1. 次のコマンドを実行し、デバイスドライバをインストールします
    ```sh
    $ git clone https://github.com/rt-net/RaspberryPiMouse.git
    $ cd RaspberryPiMouse/utils
    $ sudo apt install raspberrypi-kernel-headers build-essential
    $ ./build_install.bash
    ```
    1. コマンド実行後にブザーが鳴ればインストール完了です。
    1. パルスカウンタの動作を安定させるためI2Cのボーレートを変更します
        1. `/boot/config.txt`を編集し、`dtparam=i2c_baudrate=62500`を追記します
        1. Raspberry Pi を再起動します
        1. `$ printf "%d\n" 0x$(xxd -ps /sys/class/i2c-adapter/i2c-1/of_node/clock-frequency)`を実行し、`62500`と表示されたら設定完了です。

## デバイスドライバの自動インストール
デバイスドライバは起動たびにインストールする必要があります。

そのため、[raspicat_setup_scripts](https://github.com/rt-net/raspicat_setup_scripts)を使用して、起動たびにデバイスドライバをインストールするためのサービスを登録します。

```sh
$ git clone https://github.com/rt-net/raspicat_setup_scripts.git $HOME/raspicat_setup_scripts
$ cd $HOME/raspicat_setup_scripts
$ make install
```

## その他

### Ubuntu ServerでWi-Fiに接続し、IPアドレスを固定する

[https://ubuntu.com/server/docs/network-configuration](https://ubuntu.com/server/docs/network-configuration)
に詳細な説明が書かれています。

1. `$ sudo vim /etc/netplan/99_config.yaml`で設定ファイルを新規作成し、下記のように記述します
この例では、IPアドレスを`192.168.11.89`に固定します
```txt
network:
    ethernets:
        eth0:
            dhcp4: true
            optional: true
    wifis:
        wlan0:
            access-points:
                ここにSSIDを書く:
                    password: ここにパスワードを書く
            dhcp4: false
            addresses: [192.168.11.89/24]
            gateway4: 192.168.11.1
            nameservers:
                addresses: [8.8.8.8, 192.168.11.1]
    version: 2
```
2. `$ sudo netplan apply`を実行します
3. `$ ip addr`でWi-Fiに接続できているか確認します

### 有線LANを使用し、PCのネットワークを利用する

`Raspberry Pi`と`PC`間で有線LAN接続を行い、PCのネットワークを利用する手順について説明します。

!!! Warning
    `PC`は`Wi-Fi`に接続している必要があります。

1. PC側でEthernetの接続プロファイルを作成します  
`PROFILE-NAME`は任意の名前、`NIC-NAME`は`ip addr`コマンド等で調べたEthernetのインターフェイス名です。
```sh
$ sudo apt install net-tools
$ nmcli connection add type ethernet con-name PROFILE-NAME ifname NIC-NAME ipv4.method shared
```
2. プロファイルを作成後、プロファイルの適用を行います  
`PROFILE-NAME`には、作成したプロファイル名を入れます。
```sh
$ nmcli con up PROFILE-NAME ifname NIC-NAME
```
3. `$ ip addr`で有線LAN接続ができているか確認します  
4. Raspberry Piにssh接続  
Raspberry PiのIPアドレスを調べるために`arp-scan`コマンドを使用します。
```sh
$ sudo apt install arp-scan
$ sudo arp-scan -l -I NIC-NAME
```
Raspberry PiのIPアドレスが出てきたら、そのIPを使用しssh接続を行います。  
`Raspberry-Pi-IP`には、調べたIPアドレスを入れます。
```sh
$ ssh ubuntu@Raspberry-Pi-IP
```
5. ssh接続ができたら、Raspberry PiがPCのネットワークを利用できているか確認します  
```sh
$ ping '8.8.8.8'
```