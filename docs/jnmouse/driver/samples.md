---
title: デバイスドライバのサンプルを動かす
robot: Jetson Nano Mouse
---

# サンプルプログラムの実行

イメージファイルをインストールしたら、
サンプルプログラムを実行しましょう。

サンプルプログラムのディレクトリに移動します。

```sh
$ cd ~/JetsonNanoMouse/samples
```

ディレクトリにあるプログラムを実行すると、LEDやブザーを動かせます。

このサンプルプログラムは[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)でオープンソースソフトウェアとして公開しています。  
[https://github.com/rt-net/JetsonNanoMouse/tree/master/samples](https://github.com/rt-net/JetsonNanoMouse/tree/master/samples){target=_blank rel=noopener}

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

<iframe width="560" height="315" src="https://www.youtube.com/embed/EigulXN9eUo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## ブザー {: #step2}

キーボード入力でブザーを鳴らします。 入力キーと音階のペアは[SCALE](https://github.com/rt-net/JetsonNanoMouse/blob/master/samples/SCALE)を参照してください。

※正しい音階で鳴らないのは仕様です。 詳細は[製品マニュアル](https://rt-net.jp/products/jetson-nano-mouse#downloads){target=_blank rel=noopener}をご覧ください。  
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

<iframe width="560" height="315" src="https://www.youtube.com/embed/MvXJ0mwaBns" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

<iframe width="560" height="315" src="https://www.youtube.com/embed/hkoaJzoj0T8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

<iframe width="560" height="315" src="https://www.youtube.com/embed/_22Q1neOgGc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

<iframe width="560" height="315" src="https://www.youtube.com/embed/WAlHY-Faz7I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

<iframe width="560" height="315" src="https://www.youtube.com/embed/Y_ajx3LgKiQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
