---
title: ROSの実行
robot: Raspberry Pi Cat
---

# ROSを使用してRaspberry Pi Catの制御

このページでは
SLAMからナビゲーションまでの実行方法を説明します。

サンプルを実行する場合は下記コマンドを実行し、
ROSとパッケージを読み込んでください。

```sh
$ source /opt/ros/melodic/setup.bash
$ source ~/catkin_ws/devel/setup.bash
```

## Raspberry PiとPC間のROSネットワークを接続する

環境変数`ROS_IP`、`ROS_MASTER_URI`を設定することで、
PCからネットワークを介してRaspberry Pi側のトピックやサービスにアクセスできます。

Raspberry PiのIPアドレスが`192.168.11.89`、
PCのIPアドレスが`192.168.11.100`のとき、
下記コマンドで環境変数を設定します。

```sh
# Raspberry Pi側
$ export ROS_IP=192.168.11.89
$ export ROS_MASTER_URI=http://192.168.11.89:11311/

# PC側
# ROS_MASTER_URIにはRaspberry PiのIPアドレスを入力する
$ export ROS_IP=192.168.11.100
$ export ROS_MASTER_URI=http://192.168.11.89:11311/
```

ネットワーク接続を切る場合は、
`ROS_MASTER_URI`をデフォルトの`http://localhost:11311/`に戻します。

##　注意事項

PCから操縦する場合はネットワークと環境変数を設定してください。

## キーボードで操縦する

操作方法はターミナルに出力されます。
#### Raspberry Pi
```sh
$ roslaunch raspicat_bringup raspicat_bringup.launch
```

#### Remote PC
```sh
$ roslaunch raspicat_bringup teleop.launch joy:=false
```

## ジョイスティックコントローラで操縦する

操作方法は[こちら](https://github.com/rt-net/raspicat_ros/blob/main/raspicat_gamepad_controller/README.ja.md)のパッケージを参照してください。
を参照してください。

=== "ジョイスティックコントローラをRemote PCに接続した場合"
    #### Raspberry Pi
    ```sh
    $ roslaunch raspicat_bringup raspicat_bringup.launch
    ```
    #### Remote PC
    ```sh
    $ roslaunch raspicat_bringup teleop.launch joy:=true
    ```
=== "ジョイスティックコントローラをRaspberry Pi 4に接続した場合"
    #### Raspberry Pi
    ```sh
    $ roslaunch raspicat_bringup raspicat_bringup.launch joy:=true
    ```

## LiDARでSLAM

ジョイスティックコントローラおよびキーボードにてRaspberry Pi Catを操作出来る状態でSLAMを実行します。
`SLAM`は`Remote PC`上で実行するとします。
[raspicat_slam](https://github.com/rt-net/raspicat_slam_navigation/tree/main/raspicat_slam)パッケージにて実行が
可能なSLAMは、[gmapping](http://wiki.ros.org/gmapping)、[cartographer](http://wiki.ros.org/cartographer)、[slam_toolbox](http://wiki.ros.org/slam_toolbox)の3種類です。
rosbagを使用した場合はオフラインでSLAMを行うことができます。

### gmapping

=== "Online SLAM"
    #### Raspberry Pi
    ```sh
    $ roslaunch raspicat_bringup raspicat_bringup.launch
    ```
    #### Remote PC
    ```sh
    $ roslaunch raspicat_slam raspicat_gmapping.launch joy:=true
    $ roslaunch raspicat_slam map_save.launch map_file:=your map
    ```

=== "Offline SLAM"
    #### Remote PC
    ```sh
    $ roslaunch raspicat_slam raspicat_gmapping.launch rosbag:=true rosbag_rate:=1 rosbag_topics:="/odom /scan /tf /tf_static" rosbag_filename:=your rosbag
    $ roslaunch raspicat_slam map_save.launch map_file:=your map
    ```

### cartographer
=== "Online SLAM"
    #### Raspberry Pi
    ```sh
    $ roslaunch raspicat_bringup raspicat_bringup.launch
    ```
    #### Remote PC
    ```sh
    $ roslaunch raspicat_slam raspicat_cartographer.launch joy:=true
    $ roslaunch raspicat_slam map_save.launch map_file:=your map
    ```

=== "Offline SLAM"
    #### Remote PC
    ```sh
    $ roslaunch raspicat_slam raspicat_cartographer.launch rosbag:=true rosbag_rate:=1 rosbag_topics:="/odom /scan /tf /tf_static" rosbag_filename:=your rosbag
    $ roslaunch raspicat_slam map_save.launch map_file:=your map
    ```

### slam_toolbox
=== "Online SLAM"
    #### Raspberry Pi
    ```sh
    $ roslaunch raspicat_bringup raspicat_bringup.launch
    ```
    #### Remote PC
    ```sh
    $ roslaunch raspicat_slam raspicat_slam_toolbox.launch joy:=true
    $ roslaunch raspicat_slam map_save.launch map_file:=your map
    ```

=== "Offline SLAM"
    #### Remote PC
    ```sh
    $ roslaunch raspicat_slam raspicat_slam_toolbox.launch rosbag:=true rosbag_rate:=1 rosbag_topics:="/odom /scan /tf /tf_static" rosbag_filename:=your rosbag
    $ roslaunch raspicat_slam map_save.launch map_file:=your map
    ```

## LiDARでナビゲーション

### move_base
#### Raspberry Pi
```sh
$ roscore
$ roslaunch raspicat_bringup raspicat_bringup.launvch lidar_ether:=false lidar_usb:=true joy:=false
```
#### Remote PC
```sh
$ roslaunch raspicat_navigation raspicat_navigation.launch navigation:="move_base"
```

### neonavigation
#### Raspberry Pi
```sh
$ roscore
$ roslaunch raspicat_bringup raspicat_bringup.launvch lidar_ether:=false lidar_usb:=true joy:=false
```
#### Remote PC
```sh
$ roslaunch raspicat_navigation raspicat_navigation.launch navigation:="neonav"
```