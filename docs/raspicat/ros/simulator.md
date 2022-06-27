---
title: シミュレータの実行
robot: Raspberry Pi Cat
---

# シミュレータの実行


このページでは、
[raspicat_sim](https://github.com/rt-net/raspicat_sim){target=_blank rel=noopener}
パッケージを用いたシミュレーションのセットアップ方法と実行方法を説明します。

シミュレーション環境はROSインストール済みのUbuntu PC上に構築します。  
インストール方法については[ROSのインストール](./install.md)を参照してください。

## パッケージのダウンロードとインストール

制御用のパッケージである
[rt-net/raspimouse](https://github.com/rt-net/raspimouse){target=_blank rel=noopener}、[rt-net/raspicat_ros](https://github.com/rt-net/raspicat_ros){target=_blank rel=noopener}   
SLAM/ナビゲーション用のパッケージである
[rt-net/raspicat_slam_navigation](https://github.com/rt-net/raspicat_slam_navigation){target=_blank rel=noopener}  
シミュレータ用のパッケージである
[rt-net/raspicat_sim](https://github.com/rt-net/raspicat_sim.git){target=_blank rel=noopener}  
RaspberryPiCat用のURDF記述マクロを含んだパッケージである
[rt-net/raspicat_description](https://github.com/rt-net/raspicat_description){target=_blank rel=noopener}  
をダウンロードしてインストールします。

```sh
# Create workspace
$ source /opt/ros/melodic/setup.bash
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

# Gazeboで使用するハードウェアモデルデータをダウンロード
$ rosrun raspicat_gazebo download_gazebo_models.sh
```

## シミュレータ環境を立ち上げる
#### Gazeboのみ立ち上げ
```sh
$ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch rviz:=false
```
#### GazeboとRVizの立ち上げ
```sh
$ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch
```

## キーボードで操縦する

```sh
# シミュレータの起動
$ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch

# キーボード操縦用ノードの立ち上げ（別のターミナルでコマンドを実行）
$ roslaunch raspicat_bringup teleop.launch joy:=true
```

## ジョイスティックコントローラで操縦する

```sh
# シミュレータの起動
$ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch

# ジョイスティックコントローラ操縦用ノードの立ち上げ（別のターミナルでコマンドを実行）
$ roslaunch raspicat_bringup teleop.launch joy:=true
```

## シミュレータ環境でSLAM

#### キーボードで操縦
=== "gmapping"
    ```sh
    # シミュレータの起動
    $ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch

    # gmappingの実行
    $ roslaunch raspicat_slam raspicat_gmapping.launch joy:=false
    ```
=== "cartographer"
    ```sh
    # シミュレータの起動
    $ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch

    # cartographerの実行
    $ roslaunch raspicat_slam raspicat_cartographer.launch joy:=false
    ```
=== "slam_toolbox"
    ```sh
    # シミュレータの起動
    $ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch

    # slam_toolboxの実行
    $ roslaunch raspicat_slam raspicat_slam_toolbox.launch joy:=false
    ```

#### ジョイスティックコントローラで操縦
=== "gmapping"
    ```sh
    # シミュレータの起動
    $ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch

    # gmappingの実行
    $ roslaunch raspicat_slam raspicat_gmapping.launch joy:=true
    ```
=== "cartographer"
    ```sh
    # シミュレータの起動
    $ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch

    # cartographerの実行
    $ roslaunch raspicat_slam raspicat_cartographer.launch joy:=true
    ```
=== "slam_toolbox"
    ```sh
    # シミュレータの起動
    $ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch

    # slam_toolboxの実行
    $ roslaunch raspicat_slam raspicat_slam_toolbox.launch joy:=true
    ```

## シミュレータ環境でナビゲーション

=== "move_base"
    ```sh
    # シミュレータの起動
    $ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch

    # move_baseの実行
    $ roslaunch raspicat_navigation raspicat_navigation.launch navigation:="move_base"
    ```
=== "neonavigation"
    ```sh
    # シミュレータの起動
    $ roslaunch raspicat_gazebo raspicat_with_iscas_museum.launch

    # neonavigationの実行
    $ roslaunch raspicat_navigation raspicat_navigation.launch navigation:="neonav"
    ```