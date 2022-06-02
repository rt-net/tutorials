---
title: デバイスドライバのサンプルを動かす
robot: Raspberry Pi Mouse
---

# サンプルプログラムの実行

デバイスドライバをインストールしたら、
サンプルプログラムを実行しましょう。

サンプルプログラムのディレクトリに移動します。

```sh
$ cd ~/RaspberryPiMouse/SampleProgram
```

ディレクトリにあるプログラムを実行すると、LEDやブザーを動かせます。

このサンプルプログラムは[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)でオープンソースソフトウェアとして公開しています。  
[https://github.com/rt-net/RaspberryPiMouse/tree/master/SampleProgram](https://github.com/rt-net/RaspberryPiMouse/tree/master/SampleProgram){target=_blank rel=noopener}

## LED {: #step1}

LED0〜LED3が点滅します。

=== "Shell Script"
    ```sh
    $ bash step1.sh
    ```

=== "C"
    ```sh
    $ gcc step1.c -o step1
    $ ./step1
    ```

=== "Python"
    ```sh
    $ python3 step1.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/eNyp5zA0Its" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## ブザー {: #step2}

キーボード入力でブザーを鳴らします。 入力キーと音階のペアは[SCALE](https://github.com/rt-net/RaspberryPiMouse/blob/master/SampleProgram/SCALE)を参照してください。

++0++を入力するとブザーが止まります。 ++c++を入力するとプログラムが終了します。（Shell Scriptでは++ctrl+c++で終了します。）

=== "Shell Script"
    ```sh
    $ bash step2.sh
    ```

=== "C"
    ```sh
    $ gcc step2.c -o step2
    $ ./step2
    ```

=== "Python"
    ```sh
    $ python3 step2.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/Lr-1AvuMcMY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## スイッチ {: #step3}

スイッチを押してLEDを点消灯します。 組み合わせは次のとおりです。

* SW0 : LED3
* SW1 : LED1 & LED2
* SW2 : LED0

=== "Shell Script"
    ```sh
    $ bash step3.sh
    ```

=== "C"
    ```sh
    $ gcc step3.c -o step3
    $ ./step3
    ```

=== "Python"
    ```sh
    $ python3 step3.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/6ZqimPlsPeY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## モータ {: #step4}

モータを回して右旋回、左旋回します。

=== "Shell Script"
    ```sh
    $ bash step4.sh
    ```

=== "C"
    ```sh
    $ gcc step4.c -o step4
    $ ./step4
    ```

=== "Python"
    ```sh
    $ python3 step4.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/l5ZhUfYPVGc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## ライトセンサ {: #step5}

ライトセンサの値を読み込みます。

=== "Shell Script"
    ```sh
    $ bash step5.sh
    ```

=== "C"
    ```sh
    $ gcc step5.c -o step5
    $ ./step5
    ```

=== "Python"
    ```sh
    $ python3 step5.py
    ```

<iframe width="560" height="315" src="https://www.youtube.com/embed/tk-mRriwi9E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## パルスカウンタ {: #step6}

モータを回して、パルスカウンタの値を読み込みます。

=== "Shell Script"
    ```sh
    $ bash step6.sh
    ```

=== "C"
    ```sh
    $ gcc step6.c -o step6
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

Raspberry Pi 3では通信に失敗する場合（常に0が返ってくるなど）があります。I2Cのbaudrate設定を変更してください。  
https://github.com/rt-net/RaspberryPiMouse#%E3%83%91%E3%83%AB%E3%82%B9%E3%82%AB%E3%82%A6%E3%83%B3%E3%82%BF%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6