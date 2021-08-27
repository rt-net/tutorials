---
title: ROS パッケージのインストール
robot: Jetson Nano Mouse
---

# ROS / ROS 2パッケージのインストール

このページでは、Jetson Nano MouseのROSサンプル集のインストール方法を説明します。

## 前提条件

- OS（**JetBot 用のUbuntu**）がインストール済みであること
- **デバイスドライバ**がインストール済みであること
    - [デバイスドライバのインストール手順](../driver/install.md)を参照してください

## ROSのインストール

=== "ROS"
    [https://wiki.ros.org/melodic/Installation/Ubuntu](https://wiki.ros.org/melodic/Installation/Ubuntu){target=_blank rel=noopener}
    を参考に、`ROS Melodic`をインストールします。
    GUIを使用する場合は`Desktop-Full`を、
    使用しない場合は`ROS-Base`パッケージをインストールします。

<!-- === "ROS 2"
    [https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html](https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html){target=_blank rel=noopener}
    を参考に、`ROS 2 Foxy`をインストールします。
    GUIを使用する場合は`Desktop-Full`を、
    使用しない場合は`ROS-Base`パッケージをインストールします。

    [https://docs.ros.org/en/foxy/Tutorials/Colcon-Tutorial.html](https://docs.ros.org/en/foxy/Tutorials/Colcon-Tutorial.html){target=_blank rel=noopener}
    を参考に、パッケージビルドツールの`colcon`をインストールします。 -->

## ROSパッケージのインストール

Jetson Nano Mouseを動かすためのROSパッケージはRaspberry Pi Mouseと同じです。

=== "ROS"
    制御用のパッケージである
    [ryuichiueda/raspimouse_ros_2](https://github.com/ryuichiueda/raspimouse_ros_2){target=_blank rel=noopener}
    と、サンプル集パッケージ
    [rt-net/raspimouse_ros_examples](https://github.com/rt-net/raspimouse_ros_examples){target=_blank rel=noopener}
    をダウンロードしてインストールします。

    ```sh
    $ source /opt/ros/melodic/setup.bash
    $ mkdir -p ~/catkin_ws/src
    $ cd ~/catkin_ws/src
    # Clone ROS packages
    $ git clone https://github.com/ryuichiueda/raspimouse_ros_2
    $ git clone -b $ROS_DISTRO-devel https://github.com/rt-net/raspimouse_ros_examples 
    # For direction control example
    $ git clone https://github.com/rt-net/rt_usb_9axisimu_driver

    # Install dependencies
    $ rosdep install -r -y --from-paths . --ignore-src      

    # make & install
    $ cd ~/catkin_ws && catkin_make
    $ source ~/catkin_ws/devel/setup.bash
    ```

<!-- === "ROS 2"
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
    ``` -->
