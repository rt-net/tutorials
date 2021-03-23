# デバイスドライバのインストール

このページでは、Raspberry Pi Mouseのデバイスドライバをインストールする方法と、
サンプルプログラムの実行方法を説明します。

## OSのインストール

=== "Ubuntu Server"
    1. [https://ubuntu.com/download/raspberry-pi](https://ubuntu.com/download/raspberry-pi)にアクセスします
    1. `Ubuntu Server 20.04.2 LTS` をダウンロードします
    ![](../../img/raspimouse/driver/download_ubuntu_server.png)
    1. `Ubuntu Server 20.04.2 LTS` をダウンロードします

=== "Raspberry Pi OS"
    1. [https://www.raspberrypi.org/software/operating-systems/](https://www.raspberrypi.org/software/operating-systems/) にアクセスします
    1. `Raspberry Pi OS with desktop and recommended software` をダウンロードします

## ソースファイルのダウンロードとインストール

Raspberry Pi Mouseのデバイスドライバのソースファイルは
[GitHub](https://github.com/rt-net/RaspberryPiMouse)
に公開されています。

次のコマンドを実行して、ソースファイルをダウンロード、ビルド、インストールします。

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

## サンプルプログラムの実行

サンプルプログラムのディレクトリに移動します。

```sh
$ cd ~/RaspberryPiMouse/SampleProgram
```

ディレクトリにあるプログラムを実行すると、LEDやブザーを動かせます。

### LED

=== "Shell Script"
    ```sh
    $ bash step1.sh
    ```

=== "C"
    ```sh
    $ gcc step1.c -p step1
    $ ./step1
    ```

=== "Python"
    ```sh
    $ python3 step1.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/eNyp5zA0Its" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### ブザー

=== "Shell Script"
    ```sh
    $ bash step2.sh
    ```

=== "C"
    ```sh
    $ gcc step2.c -p step2
    $ ./step2
    ```

=== "Python"
    ```sh
    $ python3 step2.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/Lr-1AvuMcMY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### スイッチ

=== "Shell Script"
    ```sh
    $ bash step3.sh
    ```

=== "C"
    ```sh
    $ gcc step3.c -p step3
    $ ./step3
    ```

=== "Python"
    ```sh
    $ python3 step3.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/6ZqimPlsPeY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### モータ

=== "Shell Script"
    ```sh
    $ bash step4.sh
    ```

=== "C"
    ```sh
    $ gcc step4.c -p step4
    $ ./step4
    ```

=== "Python"
    ```sh
    $ python3 step4.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/l5ZhUfYPVGc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### ライトセンサ

=== "Shell Script"
    ```sh
    $ bash step5.sh
    ```

=== "C"
    ```sh
    $ gcc step5.c -p step5
    $ ./step5
    ```

=== "Python"
    ```sh
    $ python3 step5.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/tk-mRriwi9E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### パルスカウンタ

=== "Shell Script"
    ```sh
    $ bash step6.sh
    ```

=== "C"
    ```sh
    $ gcc step6.c -p step6
    $ ./step6
    ```

=== "Python"
    ```sh
    $ python3 step6.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/ECoc8aU3A94" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


次のようにstep6.shを編集することで、符号付きのカウント値を読み取ることができます。

```sh
# step6.sh
MOTOR_R=/dev/rtmotor_raw_r0
MOTOR_L=/dev/rtmotor_raw_l0
COUNTER_R=/dev/rtcounter_r1  # r0からr1に書き換え
COUNTER_L=/dev/rtcounter_l1  # l0からl1に書き換え
```

```sh
$ bash step6.sh
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/DEVr4HU9tC4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

