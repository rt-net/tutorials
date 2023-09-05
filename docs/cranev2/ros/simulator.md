---
title: ROS 2サンプル集の実行（シミュレータ）
robot: CRANE+ V2
---

# ROS 2サンプルの実行（シミュレータ）

シミュレータ（Ignition Gazebo）上における
[rt-net/crane_plus/crane_plus_examples](https://github.com/rt-net/crane_plus/tree/master/crane_plus_examples)
の動作確認方法を説明します。

## 使用機材 {: requirements}

* 設置済みCRANE+ V2本体
    * [製品マニュアル](https://rt-net.jp/products/cranev2/)を読んで設置済みの状態を前提としています
* ノートパソコン等のPC
    * OS（**Ubuntu Desktop**）がインストール済みであることを前提としています
        * `ROS 2 Humble`を使用する場合（推奨）: **Ubuntu Desktop 22.04**
        * `ROS 2 Foxy`を使用する場合（非推奨）: **Ubuntu Desktop 20.04**
    * ROS 2がインストール済みであることを前提としています
        * [ROS 2のインストール手順](./install.md)を参照してください
    * ROS 2用のパッケージがインストール済みであることを前提としています
        * [ROS 2パッケージのインストール手順](./package-install.md)を参照してください

## ROS 2サンプルの実行

### gripper_control

=== "ROS 2 Humble（推奨）"

    詳しい実行手順は[サンプル集のgripper_control](https://github.com/rt-net/crane_plus/tree/master/crane_plus_examples#gripper_control){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とIgnition Gazeboを起動します。

    ```sh
    ros2 launch crane_plus_gazebo crane_plus_with_table.launch.py
    ```

    別のターミナルで次のコマンドを実行すると、CRANE+ V2のグリッパが開閉します。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='gripper_control' use_sim_time:=true
    ```

    <img src="https://camo.githubusercontent.com/c7015fcb0d76eb715752f09a7a093ecbde6a0499fe96956dea038b6878684fe0/68747470733a2f2f72742d6e65742e6769746875622e696f2f696d616765732f6372616e652d706c75732f6372616e655f706c75735f69676e6974696f6e2e706e67" width="500">

    <img src="https://rt-net.github.io/images/crane-plus/gripper_control.gif" width="500">

=== "ROS 2 Foxy（非推奨）"

    詳しい実行手順は[サンプル集のgripper_control](https://github.com/rt-net/crane_plus/tree/master/crane_plus_examples#gripper_control){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とIgnition Gazeboを起動します。

    ```sh
    ros2 launch crane_plus_ignition crane_plus_ignition.launch.py
    ```

    別のターミナルで次のコマンドを実行すると、CRANE+ V2のグリッパが開閉します。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='gripper_control' use_sim_time:=true
    ```

    <img src="https://camo.githubusercontent.com/c7015fcb0d76eb715752f09a7a093ecbde6a0499fe96956dea038b6878684fe0/68747470733a2f2f72742d6e65742e6769746875622e696f2f696d616765732f6372616e652d706c75732f6372616e655f706c75735f69676e6974696f6e2e706e67" width="500">

    <img src="https://rt-net.github.io/images/crane-plus/gripper_control.gif" width="500">

### pose_groupstate

=== "ROS 2 Humble（推奨）"

    詳しい実行手順は[サンプル集のpose_groupstate](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#pose_groupstate){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とIgnition Gazeboを起動します。

    ```sh
    ros2 launch crane_plus_gazebo crane_plus_with_table.launch.py
    ```

    別のターミナルで次のコマンドを実行すると、CRANE+ V2が`home`と`vertical`の姿勢へ移行します。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='pose_groupstate' use_sim_time:=true
    ```

    <img src="https://rt-net.github.io/images/crane-plus/pose_groupstate.gif" width="500">

=== "ROS 2 Foxy（非推奨）"

    詳しい実行手順は[サンプル集のpose_groupstate](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#pose_groupstate){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とIgnition Gazeboを起動します。

    ```sh
    ros2 launch crane_plus_ignition crane_plus_ignition.launch.py
    ```

    別のターミナルで次のコマンドを実行すると、CRANE+ V2が`home`と`vertical`の姿勢へ移行します。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='pose_groupstate' use_sim_time:=true
    ```

    <img src="https://rt-net.github.io/images/crane-plus/pose_groupstate.gif" width="500">

### joint_values

=== "ROS 2 Humble（推奨）"

    詳しい実行手順は[サンプル集のjoint_values](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#joint_values){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とIgnition Gazeboを起動します。

    ```sh
    ros2 launch crane_plus_gazebo crane_plus_with_table.launch.py
    ```

    別のターミナルで次のコマンドを実行すると、CRANE+ V2の各関節が一つずつ変化します。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='joint_values' use_sim_time:=true
    ```

    <img src="https://rt-net.github.io/images/crane-plus/joint_values.gif" width="500">

=== "ROS 2 Foxy（非推奨）"

    詳しい実行手順は[サンプル集のjoint_values](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#joint_values){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とIgnition Gazeboを起動します。

    ```sh
    ros2 launch crane_plus_ignition crane_plus_ignition.launch.py
    ```

    別のターミナルで次のコマンドを実行すると、CRANE+ V2の各関節が一つずつ変化します。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='joint_values' use_sim_time:=true
    ```

    <img src="https://rt-net.github.io/images/crane-plus/joint_values.gif" width="500">

### pick_and_place

=== "ROS 2 Humble（推奨）"

    詳しい実行手順は[サンプル集のpick_and_place](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#pick_and_place){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とcontroller（`crane_plus_control`）を起動します。
    
    ```sh
    ros2 launch crane_plus_gazebo crane_plus_with_table.launch.py
    ```
    
    別のターミナルで次のコマンドを実行すると、CRANE+ V2がピックアンドプレース動作を行います。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='pick_and_place' use_sim_time:=true
    ```

    <img src="https://rt-net.github.io/images/crane-plus/pick_and_place.gif" width="500">

=== "ROS 2 Foxy（非推奨）"

    詳しい実行手順は[サンプル集のpick_and_place](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#pick_and_place){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とcontroller（`crane_plus_control`）を起動します。
    
    ```sh
    ros2 launch crane_plus_ignition crane_plus_ignition.launch.py
    ```
    
    別のターミナルで次のコマンドを実行すると、CRANE+ V2がピックアンドプレース動作を行います。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='pick_and_place' use_sim_time:=true
    ```

    <img src="https://rt-net.github.io/images/crane-plus/pick_and_place.gif" width="500">
