---
title: ROSパッケージのインストール
robot: Raspberry Pi Cat
---

# ROSパッケージのインストール

このページでは、Raspberry Pi CatへのROSサンプル集のインストール方法を説明します。

## 前提条件

- Raspberry PiにOS（**Ubuntu Server 18.04**）がインストール済みであること
    - Raspberry Pi OSでのROSの動作は確認していません。
- **デバイスドライバ**がインストール済みであること
    - [デバイスドライバのインストール手順](../driver/install.md)を参照してください
- ROSがインストール済みであること
    - [ROSのインストール手順](./install.md)を参照してください


## ROSパッケージのインストール

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
$ git clone -b $ROS_DISTRO-devel https://github.com/rt-net/raspimouse.git
$ git clone -b $ROS_DISTRO-devel https://github.com/rt-net/raspicat_ros.git
$ git clone -b $ROS_DISTRO-devel https://github.com/rt-net/raspicat_slam_navigation.git
$ git clone https://github.com/rt-net/raspicat_sim.git
$ git clone https://github.com/rt-net/raspicat_description.git

# Install dependencies
$ rosdep update
$ rosdep install -r -y -i --from-paths raspicat* raspimouse*

# make & install
$ cd ~/catkin_ws && catkin_make
$ source ~/catkin_ws/devel/setup.bash
```