---
title: ROS 2サンプルの実行（シミュレータ）
robot: Raspberry Pi Mouse
---

# ROS 2サンプルの実行（シミュレータ）

このページではシミュレータ上で
[ROS 2サンプル集(rt-net/raspimouse_ros2_examples)](https://github.com/rt-net/raspimouse_ros2_examples){target=_blank rel=noopener}
を実行する方法を紹介します。

## 使用機材 {: #requirements}

* ノートパソコン等のPC
    * OS（**Ubuntu Desktop 22.04**）がインストール済みであることを前提としています
    * ROS 2がインストール済みであることを前提としています
        * インストール方法については[ROS/ROS 2のインストール](../ros/install.md)を参照してください。
    * ROS 2のシミュレータパッケージがインストール済みであることを前提としています
        * インストール方法については[シミュレータのインストール](./install.md)を参照してください。

## ROS 2パッケージ情報の読み込み {: #load-workspace}

=== "ROS 2"
    [ROS 2サンプル集(rt-net/raspimouse_ros2_examples)](https://github.com/rt-net/raspimouse_ros2_examples){target=_blank rel=noopener}
    のサンプルを実行する場合は下記コマンドを実行し、
    ROS 2とパッケージを読み込んでください。

    ```sh
    $ source /opt/ros/humble/setup.bash
    $ source ~/ros2_ws/install/setup.bash
    ```

## ジョイスティックで操縦 {: #joystick}

=== "ROS 2"
    次のコマンドを実行します。

    ```sh
    # シミュレータの起動
    $ ros2 launch raspimouse_gazebo raspimouse_with_emptyworld.launch.py

    # 別のターミナルでコマンドを実行
    $ ros2 launch raspimouse_ros2_examples teleop_joy.launch.py joydev:="/dev/input/js0" joyconfig:=f710 mouse:=false
    ```

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_joystick.gif)

## RGBカメラの色検出による物体追従 {: #object_tracking}

=== "ROS 2"
    次のコマンドを実行します。

    ```sh
    # シミュレータの起動
    $ ros2 launch raspimouse_gazebo raspimouse_with_color_objects.launch.py use_rgb_camera:=true

    # 別のターミナルでコマンドを実行
    $ ros2 launch raspimouse_ros2_examples object_tracking.launch.py mouse:=false use_camera_node:=false
    ```

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_object_tracking.gif)
