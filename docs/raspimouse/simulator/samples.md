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
    * OS（**Ubuntu Desktop 22.04** / **Ubuntu Desktop 24.04**）がインストール済みであることを前提としています
    * ROS 2 (**Humble** / **Jazzy**)がインストール済みであることを前提としています
        * インストール方法については[ROS/ROS 2のインストール](../ros/install.md)を参照してください。
    * ROS 2のシミュレータパッケージがインストール済みであることを前提としています
        * インストール方法については[シミュレータのインストール](./install.md)を参照してください。

## ROS 2パッケージ情報の読み込み {: #load-workspace}

=== "ROS 2 Humble"
    [ROS 2サンプル集(rt-net/raspimouse_ros2_examples)](https://github.com/rt-net/raspimouse_ros2_examples){target=_blank rel=noopener}
    のサンプルを実行する場合は下記コマンドを実行し、
    ROS 2とパッケージを読み込んでください。

    ```sh
    source /opt/ros/humble/setup.bash
    source ~/ros2_ws/install/setup.bash
    ```
=== "ROS 2 Jazzy"
    [ROS 2サンプル集(rt-net/raspimouse_ros2_examples)](https://github.com/rt-net/raspimouse_ros2_examples){target=_blank rel=noopener}
    のサンプルを実行する場合は下記コマンドを実行し、
    ROS 2とパッケージを読み込んでください。

    ```sh
    source /opt/ros/jazzy/setup.bash
    source ~/ros2_ws/install/setup.bash
    ```

## ジョイスティックで操縦 {: #joystick}

=== "ROS 2"
    次のコマンドを実行します。

    シミュレータの起動

    ```sh
    ros2 launch raspimouse_gazebo raspimouse_with_emptyworld.launch.py
    ```

    別のターミナルでコマンドを実行

    ```sh
    ros2 launch raspimouse_ros2_examples teleop_joy.launch.py joydev:="/dev/input/js0" joyconfig:=f710 mouse:=false
    ```

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_joystick.gif)

## RGBカメラの色検出による物体追従 {: #object_tracking}

=== "ROS 2"
    次のコマンドを実行します。

    シミュレータの起動

    ```sh
    ros2 launch raspimouse_gazebo raspimouse_with_color_objects.launch.py use_rgb_camera:=true
    ```

    別のターミナルでコマンドを実行

    ```sh
    ros2 launch raspimouse_ros2_examples object_tracking.launch.py mouse:=false use_camera_node:=false
    ```

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_object_tracking.gif)

## RGBカメラによるライントレース {: #camera_line_follower}

=== "ROS 2"
    次のコマンドを実行します。

    シミュレータの起動

    ```sh
    ros2 launch raspimouse_gazebo raspimouse_with_line_follower_field.launch.py use_rgb_camera:=true camera_downward:=true
    ```

    カメラライントレースを実行

    ```sh
    ros2 launch raspimouse_ros2_examples camera_line_follower.launch.py mouse:=false use_camera_node:=false
    ```

    走行開始

    ```sh
    ros2 topic pub --once /switches raspimouse_msgs/msg/Switches "{switch0: false, switch1: false, switch2: true}"
    ```

    走行停止

    ```sh
    ros2 topic pub --once /switches raspimouse_msgs/msg/Switches "{switch0: true, switch1: false, switch2: false}"
    ```

    カメラライントレースにおけるパラメータは[こちら](https://github.com/rt-net/raspimouse_ros2_examples?tab=readme-ov-file#parameters)を参照してください。

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_camerafollower_short.gif)

## SLAM {: #slam}

!!! info
    `ROS 2 Jazzy`と`ROS 2 Humble`でコマンドが異なるためご注意ください。

=== "ROS 2 Humble"
    次のコマンドを実行します。

    シミュレータの起動

    ```sh
    ros2 launch raspimouse_gazebo raspimouse_with_lakehouse.launch.py lidar:=urg
    ```

    `lidar`は`urg`、`lds`、`rplidar`のいずれかを指定してください。

    キーボードで操作

    ```sh
    ros2 run teleop_twist_keyboard teleop_twist_keyboard
    ```

    SLAMを実行

    ```sh
    ros2 launch raspimouse_slam pc_slam.launch.py
    ```

    Raspberry Pi Mouseを走らせて地図を作成

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_slam.png)

    作成した地図を保存

    ```sh
    ros2 run nav2_map_server map_saver_cli -f ~/MAP_NAME
    ```

    `MAP_NAME`は任意の名前を指定できます。

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_slam_short.gif)

=== "ROS 2 Jazzy"
    次のコマンドを実行します。

    シミュレータの起動

    ```sh
    ros2 launch raspimouse_gazebo raspimouse_with_lakehouse.launch.py lidar:=urg
    ```

    `lidar`は`urg`、`lds`、`rplidar`のいずれかを指定してください。

    キーボードで操作

    ```sh
    ros2 run teleop_twist_keyboard teleop_twist_keyboard --ros-args -p stamped:=true
    ```

    SLAMを実行

    ```sh
    ros2 launch raspimouse_slam pc_slam.launch.py
    ```

    Raspberry Pi Mouseを走らせて地図を作成

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_slam.png)

    作成した地図を保存

    ```sh
    ros2 run nav2_map_server map_saver_cli -f ~/MAP_NAME
    ```

    `MAP_NAME`は任意の名前を指定できます。

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_slam_short.gif)

## Navigation {: #navigation}

!!! info
    `ROS 2 Jazzy`と`ROS 2 Humble`でコマンドが異なるためご注意ください。

=== "ROS 2 Humble"
    次のコマンドを実行します。

    シミュレータの起動

    ```sh
    ros2 launch raspimouse_gazebo raspimouse_with_lakehouse.launch.py lidar:=urg
    ```

    `lidar`は`urg`、`lds`、`rplidar`のいずれかを指定してください。

    Navigationを実行

    ```sh
    ros2 launch raspimouse_navigation pc_navigation.launch.py map:=$HOME/MAP_NAME.yaml
    ```

    引数`map`にはSLAMで作成した地図ファイルのパスを指定してください。

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_navigation_short.gif)

=== "ROS 2 Jazzy"
    次のコマンドを実行します。

    シミュレータの起動

    ```sh
    ros2 launch raspimouse_gazebo raspimouse_with_lakehouse.launch.py lidar:=urg
    ```

    `lidar`は`urg`、`lds`、`rplidar`のいずれかを指定してください。

    Navigationを実行

    ```sh
    ros2 launch raspimouse_navigation pc_navigation.launch.py use_sim_time:=true map:=$HOME/MAP_NAME.yaml
    ```

    引数`map`にはSLAMで作成した地図ファイルのパスを指定してください。

    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_navigation_short.gif)
