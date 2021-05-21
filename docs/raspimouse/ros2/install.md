---
title: ROS 2パッケージのインストール
robot: Raspberry Pi Mouse
---

# ROS 2パッケージのインストール

このページでは、Raspberry Pi MouseのROS 2サンプル集のインストール方法を説明します。

## Raspberry PiにインストールするOSについて

Raspberry Pi OSでのROSの動作は確認していません。
**Ubuntu Server 20.04のインストールを推奨します**。

## ROS 2のインストール

[https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html](https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html)
を参考に、`ROS 2 Foxy`をインストールします。
Ubuntu ServerではGUIを使用しないため、`ROS-Base`パッケージをインストールします。

### colconのインストール

[https://docs.ros.org/en/foxy/Tutorials/Colcon-Tutorial.html](https://docs.ros.org/en/foxy/Tutorials/Colcon-Tutorial.html)
を参考に、パッケージビルドツールの`colcon`をインストールします。

## ROS 2パッケージのインストール

サンプル集パッケージ
[rt-net/raspimouse_ros2_examples](https://github.com/rt-net/raspimouse_ros2_examples)
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
