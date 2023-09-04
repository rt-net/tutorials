---
title: ROS 2サンプル集の実行（実機）
robot: CRANE+ V2
---

# ROS 2サンプルの実行（実機）

このページでは
[rt-net/crane_plus/crane_plus_examples](https://github.com/rt-net/crane_plus/tree/master/crane_plus_examples){target=_blank rel=noopener}
の実行方法を説明します。

## 使用機材 {: #requirements}

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

## CRANE+ V2のセットアップ {: #setup}

### USB通信ポートの設定

USB通信ポート`/dev/ttyUSB0`を経由してCRANE+ V2と通信する場合、以下のコマンドでアクセス権限を変更します。

```sh
sudo chmod 666 /dev/ttyUSB0
```

### その他の設定

さらに設定を行う場合は、`crane_plus_control`の[README](https://github.com/rt-net/crane_plus/blob/master/crane_plus_control/README.md)を参照してください。

## ROS 2サンプルの実行 {: examples}

### gripper_control

=== "ROS 2"

    詳しい実行手順は[サンプル集のgripper_control](https://github.com/rt-net/crane_plus/tree/master/crane_plus_examples#gripper_control){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とcontroller（`crane_plus_control`）を起動します。
    
    ```sh
    ros2 launch crane_plus_examples demo.launch.py port_name:=/dev/ttyUSB0
    ```
    
    別のターミナルで次のコマンドを実行すると、CRANE+ V2のグリッパが開閉します。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='gripper_control'
    ```

    <img src="https://rt-net.github.io/images/crane-plus/gripper_control.gif" width="500">

### pose_groupstate

=== "ROS 2"

    詳しい実行手順は[サンプル集のpose_groupstate](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#pose_groupstate){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とcontroller（`crane_plus_control`）を起動します。
    
    ```sh
    ros2 launch crane_plus_examples demo.launch.py port_name:=/dev/ttyUSB0
    ```
    
    別のターミナルで次のコマンドを実行すると、CRANE+ V2が`home`と`vertical`の姿勢へ移行します。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='pose_groupstate'
    ```

    <img src="https://rt-net.github.io/images/crane-plus/pose_groupstate.gif" width="500">

### joint_values

=== "ROS 2"

    詳しい実行手順は[サンプル集のjoint_values](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#joint_values){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とcontroller（`crane_plus_control`）を起動します。
    
    ```sh
    ros2 launch crane_plus_examples demo.launch.py port_name:=/dev/ttyUSB0
    ```
    
    別のターミナルで次のコマンドを実行すると、CRANE+ V2の各関節が一つずつ変化します。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='joint_values'
    ```

    <img src="https://rt-net.github.io/images/crane-plus/joint_values.gif" width="500">

### pick_and_place

=== "ROS 2"

    詳しい実行手順は[サンプル集のpick_and_place](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#pick_and_place){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とcontroller（`crane_plus_control`）を起動します。
    
    ```sh
    ros2 launch crane_plus_examples demo.launch.py port_name:=/dev/ttyUSB0
    ```
    
    別のターミナルで次のコマンドを実行すると、CRANE+ V2がピックアンドプレース動作を行います。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='pick_and_place'
    ```

    <img src="https://rt-net.github.io/images/crane-plus/pick_and_place.gif" width="500">

## ROS 2カメラサンプルの実行 {: camera_examples}

### aruco_detection

=== "ROS 2"

    詳しい実行手順は[サンプル集のaruco_detection](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#aruco_detection){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とcontroller（`crane_plus_control`）、カメラノードを起動します。
    
    ```sh
    ros2 launch crane_plus_examples demo.launch.py port_name:=/dev/ttyUSB0 use_camera:=true video_device:=/dev/video0
    ```
    
    別のターミナルで次のコマンドを実行すると、カメラ画像から物体に取り付けたマーカを検出し、CRANE+ V2がピックアンドプレースを行います。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='aruco_detection'
    ```

    <img src="https://rt-net.github.io/images/crane-plus/aruco_detection.gif" width="500">

### color_detection

=== "ROS 2"

    詳しい実行手順は[サンプル集のcolor_detection](https://github.com/rt-net/crane_plus/blob/master/crane_plus_examples/README.md#color_detection){target=_blank rel=noopener}
    を参照してください。

    次のコマンドでmove_group（`crane_plus_moveit_config`）とcontroller（`crane_plus_control`）、カメラノードを起動します。
    
    ```sh
    ros2 launch crane_plus_examples demo.launch.py port_name:=/dev/ttyUSB0 use_camera:=true video_device:=/dev/video0
    ```
    
    別のターミナルで次のコマンドを実行すると、カメラ画像から特定の色の物体を検出し、CRANE+ V2がピックアンドプレースを行います。
    
    ```sh
    ros2 launch crane_plus_examples example.launch.py example:='color_detection'
    ```

    <img src="https://rt-net.github.io/images/crane-plus/color_detection.gif" width="500">
