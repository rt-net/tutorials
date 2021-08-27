---
title: デバイスドライバのサンプルを動かす
robot: Jetson Nano Mouse
---

# サンプルプログラムの実行

デバイスドライバをインストールしたら、
サンプルプログラムを実行しましょう。

サンプルプログラムのディレクトリに移動します。

```sh
$ cd ~/JetsonNanoMouse/samples
```

ディレクトリにあるプログラムを実行すると、LEDやブザーを動かせます。

## LED

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

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/eNyp5zA0Its" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

## ブザー

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

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/Lr-1AvuMcMY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

## スイッチ

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

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/6ZqimPlsPeY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

## モータ

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

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/l5ZhUfYPVGc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

## ライトセンサ

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

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/tk-mRriwi9E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

## パルスカウンタ

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

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/ECoc8aU3A94" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
