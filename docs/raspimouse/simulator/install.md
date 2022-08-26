---
title: シミュレータのインストール
robot: Raspberry Pi Mouse
---

# シミュレータのインストール

Raspberry Pi Mouse SimulatorはメインボードにRaspberry Piを使った左右独立二輪方式の小型移動プラットフォームロボット、Raspberry Pi Mouseのシミュレータです。

Gazebo上で動きます。ROSとGazeboがインストールされた環境で使用することができます。

このページでは、
[rt-net/raspimouse_sim](https://github.com/rt-net/raspimouse_sim){target=_blank rel=noopener}
パッケージを用いたシミュレーションのセットアップ方法と動作確認方法を説明します。

## 使用機材 {: #requirements}

* ノートパソコン等のPC
    * OS（**Ubuntu Desktop 20.04**）およびROS/ROS 2がインストール済みであることを前提としています
        * インストール方法については[ROS/ROS 2のインストール](../ros/install.md)を参照してください。

## パッケージのダウンロードとインストール {: #install}

=== "ROS"
    次のコマンドを実行します。

    ```sh
    # シミュレータパッケージのダウンロード
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/rt-net/raspimouse_sim.git

    # 依存パッケージをインストール
    $ git clone https://github.com/rt-net/raspimouse.git
    $ git clone https://github.com/rt-net/raspimouse_description.git
    $ rosdep install -r -y -i --from-paths raspimouse*

    # パッケージをビルド
    $ cd ~/catkin_ws && catkin_make
    $ source ~/catkin_ws/devel/setup.bash

    # Gazeboで使用するハードウェアモデルデータをダウンロード
    $ rosrun raspimouse_gazebo download_gazebo_models.sh
    ```

## 動作確認（キーボードで操縦） {: #teleop}

=== "ROS"
    次のコマンドを実行します。

    ```sh
    # シミュレータの起動
    $ roslaunch raspimouse_gazebo raspimouse_with_samplemaze.launch

    # 別のターミナルでコマンドを実行
    $ rosrun teleop_twist_keyboard teleop_twist_keyboard.py _speed:=0.1 _turn:=1.57
    ```


    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_samplemaze_animation.gif)
