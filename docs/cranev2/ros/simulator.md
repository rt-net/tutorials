---
title: ROS 2サンプル集の実行（シミュレータ）
robot: CRANE+ V2
---

# ROS 2サンプルの実行（シミュレータ）

シミュレータ（Ignition Gazebo）上における
[rt-net/crane_plus/crane_plus_examples](https://github.com/rt-net/crane_plus/tree/master/crane_plus_examples)
の動作確認方法を説明します。

## 使用機材 {: requirements}

* 設置済みCRANE+ V2本体
    * [製品マニュアル](https://rt-net.jp/products/cranev2/)を読んで設置済みの状態を前提としています
* ノートパソコン等のPC
    * OS（**Ubuntu Desktop 20.04**）がインストール済みであることを前提としています
    * ROS 2がインストール済みであることを前提としています
        * [ROS 2のインストール手順](./install.md)を参照してください
    * ROS 2用のパッケージがインストール済みであることを前提としています
        * [ROS 2パッケージのインストール手順](./package-install.md)を参照してください

## シミュレータの動作確認 {: simulator}

=== "ROS 2"

次のコマンドでmove_group（`crane_plus_moveit_config`）とIgnition Gazeboを起動します。

```sh
ros2 launch crane_plus_ignition crane_plus_ignition.launch.py
```

別のターミナルで次のコマンドを実行すると、シミュレータ上のCRANE+ V2のグリッパが開閉します。

```sh
ros2 launch crane_plus_examples example.launch.py example:='gripper_control'
```

