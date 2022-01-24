---
title: ROSサンプル集の実行
robot: Jetson Nano Mouse
---

# ROSサンプル集の実行


=== "ROS"
    このページでは以下の3つのサンプル実行方法を説明します。

    * Raspberry Pi Mouseと共通のROSサンプル集（[rt-net/raspimouse_ros_examples](https://github.com/rt-net/raspimouse_ros_examples/tree/melodic-devel){target=_blank rel=noopener}）
    * Jetson Nano Mouse用のROSサンプル集（[rt-net/jnmouse_ros_examples](https://github.com/rt-net/jnmouse_ros_examples/){target=_blank rel=noopener}）
    * SLAM/ナビゲーション用のROSサンプル集（[rt-net/raspimouse_slam_navigation_ros](https://github.com/rt-net/raspimouse_slam_navigation_ros/tree/melodic-devel){target=_blank rel=noopener}）

    サンプルを実行する場合は下記コマンドを実行し、
    ROSとパッケージを読み込んでください。

    ```sh
    $ source /opt/ros/melodic/setup.bash
    $ source ~/catkin_ws/devel/setup.bash
    ```

## Jetson NanoとPC間のROSネットワークを接続する {: #robot-and-pc-ros-network}

=== "ROS"
    環境変数`ROS_IP`、`ROS_MASTER_URI`を設定することで、
    PCからネットワークを介してJetson Nano側のトピックやサービスにアクセスできます。

    Jetson NanoのIPアドレスが`192.168.11.89`、
    PCのIPアドレスが`192.168.11.100`のとき、
    下記コマンドで環境変数を設定します。

    ```sh
    # Jetson Nano側
    $ export ROS_IP=192.168.11.89
    $ export ROS_MASTER_URI=http://192.168.11.89:11311/

    # PC側
    # ROS_MASTER_URIにはJetson NanoのIPアドレスを入力する
    $ export ROS_IP=192.168.11.100
    $ export ROS_MASTER_URI=http://192.168.11.89:11311/
    ```

    ネットワーク接続を切る場合は、
    `ROS_MASTER_URI`をデフォルトの`http://localhost:11311/`に戻します。

## raspimouse_ros_examples {: #raspimouse-ros-examples}
### キーボードで操縦する {: #teleop-keyboard}

=== "ROS"
    実行手順は[ROS サンプル集のkeyboard_control](https://github.com/rt-net/raspimouse_ros_examples/tree/melodic-devel#keyboard_control){target=_blank rel=noopener}
    を参照してください。
    PCから操縦する場合はネットワークと環境変数を設定してください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/Obc3jPLZqv8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### ジョイスティックコントローラで操縦する {: #teleop-joystick}

=== "ROS"
    実行手順は[ROS サンプル集のjoystick_control](https://github.com/rt-net/raspimouse_ros_examples/tree/melodic-devel#joystick_control){target=_blank rel=noopener}
    を参照してください。
    PCから操縦する場合はネットワークと環境変数を設定してください。

※動画はRaspberry Pi MouseですがJetson Nano Mouseでも同様です。

<iframe width="560" height="315" src="https://www.youtube.com/embed/GswxdB8Ia0Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### IMUで角度制御 {: #imu-direction-control}

=== "ROS"
    実行手順は[ROS サンプル集のdirection_control](https://github.com/rt-net/raspimouse_ros_examples/tree/melodic-devel#direction_control){target=_blank rel=noopener}
    を参照してください。

※動画はRaspberry Pi MouseですがJetson Nano Mouseでも同様です。  
※LiDARマウントはJetson Nano Mouse用のものを用意してください。（[ショップページ](https://www.rt-shop.jp/index.php?main_page=product_info&cPath=1348_1&products_id=4032)）

<iframe width="560" height="315" src="https://www.youtube.com/embed/LDpC2wqIoU4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## jnmouse_ros_examples {: #jnmouse-ros-examples}
### ライントレース {: #line-following}

=== "ROS"
    実行手順は[サンプル集パッケージ](https://github.com/rt-net/jnmouse_ros_examples#line_following){target=_blank rel=noopener}を参照してください。  
    詳細は[ブログ（https://rt-net.jp/mobility/archives/15597）](https://rt-net.jp/mobility/archives/15597)に記載しています。

<iframe width="560" height="315" src="https://www.youtube.com/embed/sNLJu0p-CBg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### スマホVRでJetson Nano Mouseを操作 {: #teleop-vr}

=== "ROS"
    実行手順は[サンプル集パッケージ](https://github.com/rt-net/jnmouse_ros_examples#teleop_vr){target=_blank rel=noopener}を参照してください。  
    詳細は[ブログ（https://rt-net.jp/mobility/archives/16161）](https://rt-net.jp/mobility/archives/16161)に記載しています。

<img src="https://rt-net.github.io/images/jetson-nano-mouse/jnmouse_vr.jpg" width="560">

### ステレオカメラ画像の歪み補正とステレオ平行化 {: #image-undistortion}

=== "ROS"
    実行手順は[サンプル集パッケージ](https://github.com/rt-net/jnmouse_ros_examples#image_undistortion){target=_blank rel=noopener}を参照してください。  
    詳細は[ブログ（https://rt-net.jp/mobility/archives/17588）](https://rt-net.jp/mobility/archives/17588)に記載しています。

<img src="https://rt-net.github.io/images/jetson-nano-mouse/jnmouse_ros_examples_image_undistortion_screenshot.png" width="560">

<iframe width="560" height="315" src="https://www.youtube.com/embed/UCUh3qVYNZs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### ステレオカメラ画像からの深度推定 {: #stereo-depth-estimation}

=== "ROS"
    実行手順は[サンプル集パッケージ](https://github.com/rt-net/jnmouse_ros_examples#stereo_depth_estimation){target=_blank rel=noopener}を参照してください。  
    詳細は[ブログ（https://rt-net.jp/mobility/archives/18036）](https://rt-net.jp/mobility/archives/18036)に記載しています。

<iframe width="560" height="315" src="https://www.youtube.com/embed/gMpKKTsPKec" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## raspimouse_slam_navigation_ros {: #raspimouse-slam-navigation}
### LiDARでSLAM {: #lidar-slam}

=== "ROS"
    実行手順は[SLAMパッケージ](https://github.com/rt-net/raspimouse_slam_navigation_ros#raspimouse_slam){target=_blank rel=noopener}
    を参照してください。
    SLAMパッケージをPCで起動する場合はネットワークと環境変数を設定してください。

※動画はRaspberry Pi MouseですがJetson Nano Mouseでも同様です。  
※LiDARマウントはJetson Nano Mouse用のものを用意してください。（[ショップページ](https://www.rt-shop.jp/index.php?main_page=product_info&cPath=1348_1&products_id=4032)）

<iframe width="560" height="315" src="https://www.youtube.com/embed/gWozU47UqVE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/hV68UqAntfo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### LiDARでナビゲーション {: #lidar-navigation}

=== "ROS"
    実行手順は[ナビゲーションパッケージ](https://github.com/rt-net/raspimouse_slam_navigation_ros#raspimouse_navigation){target=_blank rel=noopener}
    を参照してください。
    ナビゲーションパッケージをPCで起動する場合はネットワークと環境変数を設定してください。

※動画はRaspberry Pi MouseですがJetson Nano Mouseでも同様です。  
※LiDARマウントはJetson Nano Mouse用のものを用意してください。（[ショップページ](https://www.rt-shop.jp/index.php?main_page=product_info&cPath=1348_1&products_id=4032)）

<iframe width="560" height="315" src="https://www.youtube.com/embed/xSMtBZYmhFw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
