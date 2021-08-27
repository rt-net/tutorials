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

1. micro SDカードにイメージファイルを書き込むためのアプリケーションを用意します。
ここでは[balena Etcher](https://www.balena.io/etcher/)を使用します。
1. 下記のリンクをクリックして、イメージファイル(`jetbot_image_v0p4p0.zip`)をダウンロードします
    - [https://drive.google.com/open?id=1G5nw0o3Q6E08xZM99ZfzQAe7-qAXxzHN](https://drive.google.com/open?id=1G5nw0o3Q6E08xZM99ZfzQAe7-qAXxzHN)
1. micro SDカードをPCに接続します
    - **micro SDカードの容量は32GB以上必要です**
1. Etcherを起動し、イメージファイルをmicro SDカードに書き込みます
    - ![Jetson Nanoのイメージをダウンロード&書き込み](https://rt-net.jp/mobility/wp-content/uploads/2020/09/75cb799bd850f71d34f4f877c16c990e.gif)
1. micro SDカードをJetson Nanoに取り付け、Jetson Nano Mouseの電源を入れます

## 初期設定

Jetson Nano Mouse後の初期設定を行います。
ログインユーザ名とパスワードは両方`jetbot`です。

1. ++ctrl+alt+t++を入力してターミナルを起動します
1. 次のコマンドを入力し、[rt-net/jnmouse_utils@GitHub](https://github.com/rt-net/jnmouse_utils)
をダウンロードします。その後、自動ソフトウェアアップデートを停止するスクリプトを実行します
```sh
$ git clone https://github.com/rt-net/jnmouse_utils.git
$ ~/jnmouse_utils/scripts/disable-auto-apt-upgrade.sh
```
    - 意図しないアップデートにより、ソフトウェアが動作しなくなることを防ぐためです
    - 手動によるソフトアップデート(`apt update`や`apt upgrade`)はスクリプト実行後も動作します
1. 次のコマンドを実行し、Jetson-IOを起動します
```sh
$ sudo /opt/nvidia/jetson-io/jetson-io.py
```
    - Jetson-IOが起動できない場合は、次のコマンドを入力し、修正スクリプトを実行して下さい
    ```sh
    $ ~/jnmouse_utils/scripts/fix-jetsonio-r3231.sh
    ```
1. `Configure 40-pin expansion header`を選択し、
<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/68747470733a2f2f692e6779617a6f2e636f6d2f65396464623039613863343437343035613563386266653139643939333761632e706e67.png" alt="Configure 40-pin expansion header" width="914" height="776" class="alignnone size-full wp-image-14984" />
spi1を有効にするfunctionとして選択します。
<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/68747470733a2f2f692e6779617a6f2e636f6d2f35666330393961306633656438653065346361626564656432623264656536382e706e67.png" alt="Configure 40-pin expansion header" width="914" height="776" class="alignnone size-full wp-image-14985" />
function選択後は<code>Back</code>を選び、メニューに戻ります。
<code>Select one of the following options:</code>と言われるので、<code>Save and reboot to reconfigure pins</code>を選択して再起動します。
<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/68747470733a2f2f692e6779617a6f2e636f6d2f36333861653834336531336533306231306164373130616462303162363830312e706e67.png" alt="Save and reboot to reconfigure pins" width="914" height="776" class="alignnone size-full wp-image-14991" />

## ソースファイルのダウンロードとインストール

[rt-net/JetsonNanoMouse@GitHub](https://github.com/rt-net/JetsonNanoMouse)
からJetson Nano Mouseのデバイスドライバのソースファイルをダウンロードし、
インストールします。

1. ++ctrl+alt+t++を入力してターミナルを起動します
1. 次のコマンドを実行し、デバイスドライバをインストールします
```sh
$ git clone https://github.com/rt-net/JetsonNanoMouse.git
$ cd JetsonNanoMouse
$ make
$ sudo make install
```
1. 以下のコマンドを実行し、ブザーが2秒間鳴ればデバイスドライバは正常にインストールされています。
```sh
$ echo 400 > /dev/rtbuzzer0 && sleep 2 && echo 0 > /dev/rtbuzzer0
```

## その他

### Jetson IOの起動エラー対処方法

[NVIDIA Jetson Linux Developer Guide](https://docs.nvidia.com/jetson/l4t/index.html#page/Tegra%2520Linux%2520Driver%2520Package%2520Development%2520Guide%2Fhw_setup_jetson_io.html)に記載されている説エラー対処方法を抜粋し加筆したものです。

エラーごとに対処方法を説明します

---

`ImportError: cannot import name 'board'`

```sh
ubuntu@JETBOT:~$ sudo /opt/nvidia/jetson-io/jetson-io.py
Traceback (most recent call last):
File "/opt/nvidia/jetson-io/jetson-io.py", line 25, in <module>
from Jetson import board
ImportError: cannot import name 'board'
```

上記のエラーは以下のコマンドで修正できます。

```sh
sudo find /opt/nvidia/jetson-io/ -mindepth 1 -maxdepth 1 -type d -exec touch {}/__init__.py \;
```

---

`RuntimeError: No DTB found for NVIDIA Jetson Nano Developer Kit!`

```sh
ubuntu@JETBOT:~$ sudo /opt/nvidia/jetson-io/config-by-pin.py -p 5
Traceback (most recent call last):
  File "/opt/nvidia/jetson-io/config-by-pin.py", line 51, in <module>
    main()
  File "/opt/nvidia/jetson-io/config-by-pin.py", line 34, in main
    jetson = board.Board()
  File "/opt/nvidia/jetson-io/Jetson/board.py", line 149, in __init__
    self.dtb = _board_get_dtb(self.compat, self.model, dtbdir)
  File "/opt/nvidia/jetson-io/Jetson/board.py", line 88, in _board_get_dtb
    raise RuntimeError("No DTB found for %s!" % model)
RuntimeError: No DTB found for NVIDIA Jetson Nano Developer Kit!
```

上記のエラーは以下のコマンドで修正できます。

```sh
sudo mkdir -p /boot/dtb
ls /boot/*.dtb | xargs -I{} sudo ln -s {} /boot/dtb/
```
