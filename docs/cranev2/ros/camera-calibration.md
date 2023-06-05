---
title: カメラのキャリブレーション
robot: CRANE+ V2
---

# カメラのキャリブレーション
このページではCRANE+ V2のカメラのキャリブレーション方法について説明します。

## 使用機材 {: #requirements}

* 設置済みCRANE+ V2本体（Webカメラ搭載モデル）
    * [製品マニュアル](https://rt-net.jp/products/cranev2/)を読んで設置済みの状態を前提としています
* ノートパソコン等のPC
    * OS（**Ubuntu Desktop 20.04**）がインストール済みであることを前提としています
    * ROS 2がインストール済みであることを前提としています
        * [ROS 2のインストール手順](./install.md)を参照してください
    * ROS 2用のパッケージがインストール済みであることを前提としています
        * [ROS 2パッケージのインストール手順](./package-install.md)を参照してください
* キャリブレーション用のチェスボード（A4サイズで印刷）
    * [OpenCVのサンプル](https://github.com/opencv/opencv/blob/master/samples/data/chessboard.png)

## 参考ページ

[navigation.ros.org/tutorials/docks/camera_calibration](https://navigation.ros.org/tutorials/docs/camera_calibration.html)

## キャリブレーション用パッケージのインストール {: #install}
ノートパソコン等のPCに、キャリブレーションを行うためのROS 2パッケージをインストールします。

```bash
sudo apt install ros-foxy-camera-calibration-parsers
sudo apt install ros-foxy-camera-info-manager
sudo apt install ros-foxy-launch-testing-ament-cmake
```

```bash
cd ~/ros2_ws/src
git clone – b foxy git@github.com:ros-perception/image_pipeline.git
rosdep install -r -y --from-paths . --ignore-src
cd ~/ros2_ws
colcon build --symlink-install
source ~/ros2_ws/install/setup.bash
```

## CRANE+ V2のカメラを起動 {: #launch-camera}
CRANE+ V2のカメラを起動します。
`port_name`はCRANE+ V2を指定し、`video_device`はCRANE+ V2のカメラを指定してください。
```bash
ros2 launch crane_plus_examples demo.launch.py port_name:=/dev/ttyUSB0 use_camera:=true video_device:=/dev/video2
```

## キャリブレーションを実行 {: #launch-calibration}
カメラのキャリブレーションを実行します。
`size`はチェスボードの交点の数を指定し、`square`はチェスボードの1マスの大きさを指定してください。
```bash
ros2 run camera_calibration cameracalibrator --size 6x9 --square 0.022 --ros-args -r image:=/image_raw
```

キャリブレーションが実行できたら、カメラの画角内でチェスボードを遠ざけたり、近づけたり、傾けたりなど自由に動かします。

CALIBRATEボタンが緑色になったら押してしばらく待ちます。

その後、SAVEボタンを押すと、`tmp`ディレクトリに`calibrationdata.tar.gz`ファイルができます。

## パラメータファイルの配置 {: #replace-file}
パラメータファイル`ost.yaml`を取得して、`crane_plus/crane_plus_examples/config/camera_info.yaml`に配置します。
```bash
cd /tmp
tar -xvf calibrationdata.tar.gz
cp ost.yaml ~/ros2_ws/src/crane_plus/crane_plus_examples/config/camera_info.yaml
```
