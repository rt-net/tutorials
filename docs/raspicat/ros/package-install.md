---
title: ROSパッケージのインストール
robot: Raspberry Pi Cat
---

# ROSパッケージのインストール

このページでは、Raspberry Pi/Ubuntu PCへのROSパッケージのインストール方法を説明します。

## 前提条件

- Raspberry PiにOS（**Ubuntu Server 18.04**）がインストール済みであること
    - Raspberry Pi OSでのROSの動作は確認していません。
- **デバイスドライバ**がインストール済みであること
    - [デバイスドライバのインストール手順](../driver/install.md)を参照してください
- ROSがインストール済みであること
    - [ROSのインストール手順](./install.md)を参照してください


## ROSパッケージのインストール

制御用のパッケージである
[rt-net/raspimouse](https://github.com/rt-net/raspimouse){target=_blank rel=noopener}、[rt-net/raspicat_ros](https://github.com/rt-net/raspicat_ros){target=_blank rel=noopener}  
SLAM/ナビゲーション用のパッケージである
[rt-net/raspicat_slam_navigation](https://github.com/rt-net/raspicat_slam_navigation){target=_blank rel=noopener}  
RaspberryPiCat用のURDF記述マクロを含んだパッケージである
[rt-net/raspicat_description](https://github.com/rt-net/raspicat_description){target=_blank rel=noopener}  
をダウンロードしてインストールします。

!!! Tip
    Raspberry PiとPCの両方にダウンロードおよびインストールを行います。

```sh
# Create workspace
$ source /opt/ros/melodic/setup.bash
$ mkdir -p ~/catkin_ws/src
$ cd ~/catkin_ws/src

# Clone ROS packages
$ git clone -b $ROS_DISTRO-devel https://github.com/rt-net/raspimouse.git
$ git clone -b $ROS_DISTRO-devel https://github.com/rt-net/raspicat_ros.git
$ git clone -b $ROS_DISTRO-devel https://github.com/rt-net/raspicat_slam_navigation.git
$ git clone https://github.com/rt-net/raspicat_description.git

# Install dependencies
$ rosdep update
$ rosdep install -r -y -i --from-paths raspicat* raspimouse*

# make & install
$ cd ~/catkin_ws && catkin_make
$ source ~/catkin_ws/devel/setup.bash
```