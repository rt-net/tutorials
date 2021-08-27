---
title: シミュレータの実行
robot: Jetson Nano Mouse
---

# シミュレータの実行

=== "ROS"
    このページでは、
    [rt-net/jnmouse_sim](https://github.com/rt-net/jnmouse_sim){target=_blank rel=noopener}
    パッケージを用いたシミュレーションの実行方法を説明します。

    シミュレーション環境はUbuntu PC上に構築します。

## パッケージのダウンロードとインストール

=== "ROS"
    次のコマンドを実行します。

    ```sh
    # パッケージのダウンロード
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/rt-net/jnmouse_sim.git

    # 依存パッケージをインストール
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/ryuichiueda/raspimouse_ros_2.git
    $ git clone https://github.com/rt-net/jnmouse_description.git
    $ rosdep install -r -y -i --from-paths .

    # パッケージをビルド
    $ cd ~/catkin_ws && catkin_make
    $ source ~/catkin_ws/devel/setup.bash

    # Gazeboで使用するハードウェアモデルデータをダウンロード
    $ rosrun jnmouse_gazebo download_gazebo_models.sh

    ```

## キーボードで操縦する

=== "ROS"
    次のコマンドを実行します。

    ```sh
    # シミュレータの起動
    $ roslaunch jnmouse_gazebo jnmouse_with_table.launch

    # 別のターミナルでコマンドを実行
    $ roslaunch jnmouse_gazebo keyboard_teleop.launch rviz:=true
    ```
    ![](https://rt-net.github.io/images/jetson-nano-mouse/jnmouse_gazebo_3.gif)

    ![](https://rt-net.github.io/images/jetson-nano-mouse/jnmouse_gazebo_1.gif)
