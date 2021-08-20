---
title: デバイスドライバのインストール
robot: Jeton Nano Mouse
---

# デバイスドライバのインストール

このページでは
[Jetson Nano Mouseのデバイスドライバ](https://github.com/rt-net/JetsonNanoMouse)
のインストール方法を説明します。

Jetson Nano MouseのLEDやモータを駆動するためには、
デバイスドライバが必要です。

## OSのインストール

<!-- ベースとなるJetson Nano用のOS、L4Tをダウンロードし、開発用のPCからmicroSDへ書き込みます。
NVIDIA社が公開しているAIロボットキットである<a href="https://www.nvidia.com/ja-jp/autonomous-machines/embedded-systems/jetbot-ai-robot-kit/" target="_blank" rel="noopener">JetBot</a>用のイメージでは機械学習ライブラリの<a href="https://pytorch.org/" target="_blank" rel="noopener">PyTorch</a>や<a href="https://www.tensorflow.org/?hl=ja" target="_blank" rel="noopener">TensorFlow</a>、
プログラム実行環境のJupyter Lab（後ほど説明します）等があらかじめインストールされているのでこのイメージを使用します。
イメージファイルは以下のURLからjetbot_image_v0p4p0.zipという名前の7GB程度の圧縮ファイルでダウンロードできます。
<a href="https://drive.google.com/open?id=1G5nw0o3Q6E08xZM99ZfzQAe7-qAXxzHN" target="_blank" rel="noopener">https://drive.google.com/open?id=1G5nw0o3Q6E08xZM99ZfzQAe7-qAXxzHN</a>

このjetbot_image_v0p4p0.zipは<b>JetPack 4.3</b>がベースとなっています。
JetBot用イメージ作成用スクリプト：<a href="https://github.com/NVIDIA-AI-IOT/jetcard" rel="noopener" target="_blank">https://github.com/NVIDIA-AI-IOT/jetcard</a>

JetBotのセットアップ方法は<b>GitHub上に公開されています</b>ので、イメージの詳細について、イメージの最新の情報について知りたい場合はNVIDIAのGitHubリポジトリを参照してください。
JetBotのセットアップ方法（英語）：<a href="https://github.com/NVIDIA-AI-IOT/jetbot/wiki/software-setup" rel="noopener" target="_blank">https://github.com/NVIDIA-AI-IOT/jetbot/wiki/software-setup</a>

<a href="https://www.balena.io/etcher/" target="_blank" rel="noopener">balenaEtcher</a>等を用いてmicroSDカードにイメージを書き込みます。


書き込みが無事に完了したらmicroSDカードをJetson Nanoに差し込み、起動します。

※より詳しい書き込み方を知りたい場合は<a href="https://rt-net.jp/products/jetson-nano-mouse#downloads">製品マニュアル</a>をご覧ください。 -->

Jetson Nano Mouseのデバイスドライバは
NVIDIA社が公開している
[JetBot](https://www.nvidia.com/ja-jp/autonomous-machines/embedded-systems/jetbot-ai-robot-kit/)
用のイメージファイル（Jetson Nano開発キットがインストールされたUbuntu）に対応しています。

そのため、以下の手順は[JetBotのソフトウェアセットアップ方法](https://github.com/NVIDIA-AI-IOT/jetbot/wiki/software-setup)
を参考にしています。

!!! warning
    micro SDカードの取り付けやJetson Nanoの電源操作時に、
    Jetson NanoやJetson Nano Mouse本体を**故障させないように**注意してください。
    詳細はJetson Nano Mouseの**製品マニュアルを参照してください**。

1. micro SDカードにイメージファイルを書き込むアプリケーションを準備します。
ここでは[balena Etcher](https://www.balena.io/etcher/)を使用します。
1. 下記のリンクをクリックして、イメージファイル(jetbot_image_v0p4p0.zip)をダウンロードします
    - [https://drive.google.com/open?id=1G5nw0o3Q6E08xZM99ZfzQAe7-qAXxzHN](https://drive.google.com/open?id=1G5nw0o3Q6E08xZM99ZfzQAe7-qAXxzHN)
2. micro SDカードをPCに接続します
    - **micro SDカードの容量は32GB以上必要です**
3. Etcherを起動し、イメージファイルをmicro SDカードに書き込みます
    - ![Jetson Nanoのイメージをダウンロード&書き込み](https://rt-net.jp/mobility/wp-content/uploads/2020/09/75cb799bd850f71d34f4f877c16c990e.gif)
1. micro SDカードをJetson Nanoに取り付け、Jetson Nano Mouseの電源を入れます
1. `login:ubuntu`、`password:ubuntu`でログインし、パスワードを変更します
1. `$sudo apt update && sudo apt upgrade`を実行します


## ソースファイルのダウンロードとインストール

Raspberry Pi Mouseのデバイスドライバのソースファイルは
[GitHub](https://github.com/rt-net/RaspberryPiMouse)
に公開されています。

1. 次のコマンドを実行し、デバイスドライバをインストールします
```sh
$ git clone https://github.com/rt-net/RaspberryPiMouse.git
$ cd RaspberryPiMouse/utils
$ sudo apt install linux-headers-$(uname -r) build-essential
$ ./build_install.bash
```
1. コマンド実行後にブザーが鳴ればインストール完了です。
1. パルスカウンタの動作を安定させるためI2Cのボーレートを変更します
    1. `/boot/firmware/config.txt`を編集し、`dtparam=i2c_baudrate=62500`を追記します
    1. Raspberry Pi を再起動します
    1. `$ printf "%d\n" 0x$(xxd -ps /sys/class/i2c-adapter/i2c-1/of_node/clock-frequency)`を実行し、`62500`と表示されたら設定完了です。


**デバイスドライバはOSを起動するたびにインストールしてください。**
