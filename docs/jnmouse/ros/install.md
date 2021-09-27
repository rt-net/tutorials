---
title: ROS パッケージのインストール
robot: Jetson Nano Mouse
---

# ROSパッケージのインストール

このページでは、Jetson Nano MouseのROSサンプル集のインストール方法を説明します。

## 前提条件

- **Jetson Nano Mouse用のイメージファイル**がインストール済みであること
    - [イメージファイルのインストール手順](../driver/install.md)を参照してください

## ROSのインストール

=== "ROS"
    **`ROS Melodic`がインストール済みです**。

    
    手動でインストールする場合は、
    [https://wiki.ros.org/melodic/Installation/Ubuntu](https://wiki.ros.org/melodic/Installation/Ubuntu){target=_blank rel=noopener}
    を参考に、`ROS Melodic`をインストールします。
    GUIを使用する場合は`Desktop-Full`を、
    使用しない場合は`ROS-Base`パッケージをインストールします。

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

    # Install dependencies
    $ rosdep install -r -y --from-paths . --ignore-src      

    # make & install
    $ cd ~/catkin_ws && catkin_make
    $ source ~/catkin_ws/devel/setup.bash
    ```
