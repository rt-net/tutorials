---
title: ROS / ROS 2パッケージのインストール
robot: Raspberry Pi Mouse
---

# ROS / ROS 2パッケージのインストール

このページでは、Raspberry Pi MouseのROSサンプル集のインストール方法を説明します。

## 前提条件

- OS（**Ubuntu Server 20.04**）がインストール済みであること
    - Raspberry Pi OSでのROSの動作は確認していません。
- **デバイスドライバ**がインストール済みであること
    - [デバイスドライバのインストール手順](../driver/install.md)を参照してください

## ROS / ROS 2のインストール

=== "ROS"
    [https://wiki.ros.org/noetic/Installation/Ubuntu](https://wiki.ros.org/noetic/Installation/Ubuntu){target=_blank rel=noopener}
    を参考に、`ROS Noetic`をインストールします。
    Ubuntu ServerではGUIを使用しないため、`ROS-Base`パッケージをインストールします。

=== "ROS 2"
    [https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html](https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html){target=_blank rel=noopener}
    を参考に、`ROS 2 Foxy`をインストールします。
    Ubuntu ServerではGUIを使用しないため、`ROS-Base`パッケージをインストールします。

    [https://docs.ros.org/en/foxy/Tutorials/Colcon-Tutorial.html](https://docs.ros.org/en/foxy/Tutorials/Colcon-Tutorial.html){target=_blank rel=noopener}
    を参考に、パッケージビルドツールの`colcon`をインストールします。

## ROS / ROS 2パッケージのインストール

=== "ROS"
    制御用のパッケージである
    [ryuichiueda/raspimouse_ros_2](https://github.com/ryuichiueda/raspimouse_ros_2){target=_blank rel=noopener}
    と、サンプル集パッケージ
    [rt-net/raspimouse_ros_examples](https://github.com/rt-net/raspimouse_ros_examples){target=_blank rel=noopener}
    および、ナビゲーション用のパッケージ
    [rt-net/raspimouse_slam_navigation_ros](https://github.com/rt-net/raspimouse_slam_navigation_ros){target=_blank rel=noopener}
    をダウンロードしてインストールします。

    ```sh
    $ source /opt/ros/noetic/setup.bash
    $ mkdir -p ~/catkin_ws/src
    $ cd ~/catkin_ws/src
    # Clone ROS packages
    $ git clone https://github.com/ryuichiueda/raspimouse_ros_2
    $ git clone -b $ROS_DISTRO-devel https://github.com/rt-net/raspimouse_ros_examples 
    $ git clone -b $ROS_DISTRO-devel https://github.com/rt-net/raspimouse_slam_navigation_ros 
    # For direction control example
    $ git clone https://github.com/rt-net/rt_usb_9axisimu_driver

    # Install dependencies
    $ rosdep install -r -y --from-paths . --ignore-src      

    # make & install
    $ cd ~/catkin_ws && catkin_make
    $ source ~/catkin_ws/devel/setup.bash
    ```

=== "ROS 2"
    サンプル集パッケージ
    [rt-net/raspimouse_ros2_examples](https://github.com/rt-net/raspimouse_ros2_examples){target=_blank rel=noopener}
    をダウンロードしてインストールします。

    ```sh
    $ source /opt/ros/foxy/setup.bash
    $ mkdir -p ~/ros2_ws/src
    $ cd ~/ros2_ws/src
    # Clone packages
    $ git clone https://github.com/rt-net/raspimouse_ros2_examples

    # Install dependencies
    $ rosdep install -r -y --from-paths . --ignore-src

    # make & install
    $ cd ~/ros2_ws
    $ colcon build --symlink-install
    $ source ~/ros2_ws/install/setup.bash
    ```
