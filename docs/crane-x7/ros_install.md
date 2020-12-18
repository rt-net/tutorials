# Installation

CRANE-X7のROSパッケージである[crane_x7_ros](https://github.com/rt-net/crane_x7_ros)
をインストールして動かします。
## ROSのインストール

=== "Noetic"

    1. Ubuntu 20.04がインストールされたPCを用意します。
    2. [ROS Wiki](http://wiki.ros.org/noetic/Installation/Ubuntu)の手順に従い、ROS Noetic Ninjemys をインストールします (Desktop-Fullインストール推奨です)

=== "Melodic"

    1. Ubuntu 18.04がインストールされたPCを用意します。
    2. [ROS Wiki](http://wiki.ros.org/melodic/Installation/Ubuntu)の手順に従い、ROS Melodic Morenia をインストールします (Desktop-Fullインストール推奨です)

=== "Kinetic"

    1. Ubuntu 16.04がインストールされたPCを用意します。
    2. [ROS Wiki](http://wiki.ros.org/kinetic/Installation/Ubuntu)の手順に従い、ROS Kinetic Kame をインストールします (Desktop-Fullインストール推奨です)

## ROS パッケージのインストール

`git`を使用して本パッケージをダウンロードします。

```bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/rt-net/crane_x7_ros.git
```

依存関係にあるパッケージをインストールします。

```bash
$ cd ~/catkin_ws/src

# package for crane_x7_gazebo
$ git clone https://github.com/roboticsgroup/roboticsgroup_gazebo_plugins.git

$ rosdep install -r -y --from-paths --ignore-src crane_x7_ros
```

`catkin_make`を使用して本パッケージをビルドします。

```bash
$ cd ~/catkin_ws && catkin_make
$ source ~/catkin_ws/devel/setup.bash
```

## USBポートの設定

CRANE-X7のUSBケーブルをPCに接続し、USBポート(`/dev/ttyUSB*`)の設定を変更します。
### アクセス権限の変更

`/dev/ttyUSB0`へのアクセス権を変更するには下記のコマンドを実行します。

```sh
$ sudo chmod 666 /dev/ttyUSB0
```

### latency_timerの設定

制御周期200Hzを実現するために、
`$ sudo su`コマンドを実行してroot権限でログインし、下記のコマンドを実行します。


```sh
# cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
16
# echo 1 > /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
# cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
1
```

## Quick Start

実機のCRANE-X7を起動し、グリッパを開閉します。

```sh
$ roslaunch crane_x7_bringup demo.launch fake_execution:=false

# ターミナルをもう一つ開き、実行
$ rosrun crane_x7_examples gripper_action_example.py
```

終了するときは`Ctrl+C`を入力します。

