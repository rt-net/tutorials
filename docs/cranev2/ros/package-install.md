---
title: ROS 2パッケージのインストール
robot: CRANE+ V2
---

# ROS 2パッケージのインストール

このページでは、CRANE+ V2のROS 2パッケージのインストール方法を説明します。

## 使用機材 {: #requirements}

* 設置済みCRANE+ V2本体
    * [製品マニュアル](https://rt-net.jp/products/cranev2/)を読んで設置済みの状態を前提としています
* ノートパソコン等のPC
    * OS（**Ubuntu Desktop**）がインストール済みであることを前提としています
        * `ROS 2 Humble`を使用する場合（推奨）: **Ubuntu Desktop 22.04**
        * `ROS 2 Foxy`を使用する場合（非推奨）: **Ubuntu Desktop 20.04**
    * ROS 2がインストール済みであることを前提としています
        * [ROS 2のインストール手順](./install.md)を参照してください

## ROS 2パッケージのインストール {: #installation-binary}

=== "ROS 2 Humble（推奨）"

    ノートパソコン等のPCに、
    ROS 2パッケージ[rt-net/crane_plus](https://github.com/rt-net/crane_plus){target=_blank rel=noopener}
    をインストールします。

    ```sh
    sudo apt install ros-humble-crane-plus
    ```

=== "ROS 2 Foxy（非推奨）"

    ノートパソコン等のPCに、
    ROS 2パッケージ[rt-net/crane_plus](https://github.com/rt-net/crane_plus){target=_blank rel=noopener}
    をインストールします。

    ```sh
    sudo apt install ros-foxy-crane-plus
    ```
