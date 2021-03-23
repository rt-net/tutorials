---
title: デバイスドライバのインストール
---

# デバイスドライバのインストール

このページでは
[Raspberry Pi Mouseのデバイスドライバ](https://github.com/rt-net/RaspberryPiMouse)
をインストールする方法を説明します。

## OSのインストール

Raspberry Pi Mouseのデバイスドライバは`Ubuntu`と`Raspberry Pi OS (旧称Raspbian)`に対応しています。

ここではUbuntu（Ubuntu Server 20.04）と、Raspberry Pi OSのインストール手順を紹介します。

後ほどRaspberry Pi MouseでROSを扱う場合はUbuntuのインストールを推奨します。

!!! warning
    SDカードの取り付けやRaspberry Piの電源操作時に、
    Raspberry PiやRaspberry Pi Mouse本体を**故障させないように**注意してください。
    詳細はRaspberry Pi Mouseの**製品マニュアルを参照してください**。

=== "Ubuntu Server 20.04"
    1. [https://ubuntu.com/download/raspberry-pi](https://ubuntu.com/download/raspberry-pi)にアクセスします
    1. `Ubuntu Server 20.04.2 LTS` をダウンロードします
    ![](../../img/raspimouse/driver/download_ubuntu_server.png)
    1. ダウンロードしたイメージファイルをSDカードに書き込みます
    1. SDカードをRaspberry Piに取り付け、Raspberry Piの電源をいれます

=== "Raspberry Pi OS"
    1. [https://www.raspberrypi.org/software/operating-systems/](https://www.raspberrypi.org/software/operating-systems/) にアクセスします
    1. `Raspberry Pi OS with desktop and recommended software` をダウンロードします
    1. ダウンロードしたイメージファイルをSDカードに書き込みます
    1. SDカードをRaspberry Piに取り付け、Raspberry Piの電源をいれます

## ソースファイルのダウンロードとインストール

Raspberry Pi Mouseのデバイスドライバのソースファイルは
[GitHub](https://github.com/rt-net/RaspberryPiMouse)
に公開されています。

ターミナル上で次のコマンドを実行し、
ソースファイルをダウンロード、ビルド、インストールします。

=== "Raspberry Pi OS"
    ```sh
    $ git clone https://github.com/rt-net/RaspberryPiMouse.git
    $ cd RaspberryPiMouse/utils
    $ sudo apt install raspberrypi-kernel-headers build-essential
    $ ./build_install.bash
    ```

=== "Ubuntu Server"
    ```sh
    $ git clone https://github.com/rt-net/RaspberryPiMouse.git
    $ cd RaspberryPiMouse/utils
    $ sudo apt install linux-headers-$(uname -r) build-essential
    $ ./build_install.bash
    ```
