---
title: シミュレータの実行
robot: Raspberry Pi Mouse
---

# シミュレータの実行

=== "ROS"
    このページでは、
    [rt-net/raspimouse_sim](https://github.com/rt-net/raspimouse_sim){target=_blank rel=noopener}
    パッケージを用いたシミュレーションの実行方法を説明します。

    シミュレーション環境はUbuntu PC上に構築します。

## パッケージのダウンロードとインストール

=== "ROS"
    次のコマンドを実行します。

    ```sh
    # パッケージのダウンロード
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/rt-net/raspimouse_sim.git

    # 依存パッケージをインストール
    $ git clone https://github.com/ryuichiueda/raspimouse_ros_2.git
    $ git clone https://github.com/rt-net/raspimouse_description.git
    $ rosdep install -r -y -i --from-paths raspimouse*

    # パッケージをビルド
    $ cd ~/catkin_ws && catkin_make
    $ source ~/catkin_ws/devel/setup.bash

    # Gazeboで使用するハードウェアモデルデータをダウンロード
    $ rosrun raspimouse_gazebo download_gazebo_models.sh
    ```

## キーボードで操縦する

=== "ROS"
    [rt-net/raspimouse_ros_examples](https://github.com/rt-net/raspimouse_ros_examples){target=_blank rel=noopener}
    を使用します。
    [ROS パッケージのインストール](./install.md)を参考に、パッケージを**PCにインストール**してください。

    次のコマンドを実行します。

    ```sh
    # シミュレータの起動
    $ roslaunch raspimouse_gazebo raspimouse_with_samplemaze.launch

    # 別のターミナルでコマンドを実行
    $ roslaunch raspimouse_ros_examples teleop.launch key:=true mouse:=false
    ```


    ![](https://rt-net.github.io/images/raspberry-pi-mouse/raspimouse_sim_samplemaze_animation.gif)
