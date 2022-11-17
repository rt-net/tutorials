---
title: ROS 2サンプル集の実行（実機）
robot: CRANE+ V2
---

# ROS 2サンプルの実行（実機）

このページでは
[rt-net/crane_plus/crane_plus_examples](https://github.com/rt-net/crane_plus/tree/master/crane_plus_examples){target=_blank rel=noopener}
の実行方法を説明します。

## 使用機材 {: #requirements}

* 設置済みCRANE+ V2本体
    * [製品マニュアル](https://rt-net.jp/products/cranev2/)を読んで設置済みの状態を前提としています
* ノートパソコン等のPC
    * OS（**Ubuntu Desktop 20.04**）がインストール済みであることを前提としています
    * ROS 2がインストール済みであることを前提としています
        * [ROS 2のインストール手順](./install.md)を参照してください
    * ROS 2用のパッケージがインストール済みであることを前提としています
        * [ROS 2パッケージのインストール手順](./package-install.md)を参照してください

## CRANE+ V2のセットアップ {: #setup}

### USB通信ポートの設定

USB通信ポート`/dev/ttyUSB0`を経由してCRANE+ V2と通信する場合、以下のコマンドでアクセス権限を変更します。

```sh
$ sudo chmod 666 /dev/ttyUSB0
```

### その他の設定

さらに設定を行う場合は、`crane_plus_control`の[README](https://github.com/rt-net/crane_plus/blob/master/crane_plus_control/README.md)を参照してください。

## ROS 2サンプルの実行 {: examples}

=== "ROS 2"

次のコマンドでmove_group（`crane_plus_moveit_config`）とcontroller（`crane_plus_control`）を起動します。

```sh
$ ros2 launch crane_plus_examples demo.launch.py port_name:=/dev/ttyUSB0
```

別のターミナルで次のコマンドを実行すると、CRANE+ V2のグリッパが開閉します。

```sh
ros2 launch crane_plus_examples example.launch.py example:='gripper_control'
```
