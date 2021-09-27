---
title: ROSサンプル集の実行
robot: Jetson Nano Mouse
---

# ROSサンプル集の実行


=== "ROS"
    このページでは
    [ROSサンプル集(rt-net/raspimouse_ros_examples)](https://github.com/rt-net/raspimouse_ros_examples/tree/melodic-devel){target=_blank rel=noopener}
    のサンプル実行方法を説明します。

    サンプルを実行する場合は下記コマンドを実行し、
    ROSとパッケージを読み込んでください。

    ```sh
    $ source /opt/ros/melodic/setup.bash
    $ source ~/catkin_ws/devel/setup.bash
    ```

## Jetson NanoとPC間のROSネットワークを接続する

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

## キーボードで操縦する

=== "ROS"
    実行手順は[ROS サンプル集のkeyboard_control](https://github.com/rt-net/raspimouse_ros_examples/tree/melodic-devel#keyboard_control){target=_blank rel=noopener}
    を参照してください。
    PCから操縦する場合はネットワークと環境変数を設定してください。

## ジョイスティックコントローラで操縦する

=== "ROS"
    実行手順は[ROS サンプル集のjoystick_control](https://github.com/rt-net/raspimouse_ros_examples/tree/melodic-devel#joystick_control){target=_blank rel=noopener}
    を参照してください。
    PCから操縦する場合はネットワークと環境変数を設定してください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/GswxdB8Ia0Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## LiDARでSLAM

=== "ROS"
    実行手順は[ROS サンプル集のSLAM](https://github.com/rt-net/raspimouse_ros_examples/tree/melodic-devel#slam){target=_blank rel=noopener}
    を参照してください。
    SLAMパッケージをPCで起動する場合はネットワークと環境変数を設定してください。

    ※LiDARマウントはJetson Nano Mouse用のものを用意してください。（[ショップページ](https://www.rt-shop.jp/index.php?main_page=product_info&cPath=1348_1&products_id=4032)）

<iframe width="560" height="315" src="https://www.youtube.com/embed/gWozU47UqVE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/hV68UqAntfo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## IMUで角度制御

=== "ROS"
    実行手順は[ROS サンプル集のdirection_control](https://github.com/rt-net/raspimouse_ros_examples/tree/melodic-devel#direction_control){target=_blank rel=noopener}
    を参照してください。

    ※LiDARマウントはJetson Nano Mouse用のものを用意してください。（[ショップページ](https://www.rt-shop.jp/index.php?main_page=product_info&cPath=1348_1&products_id=4032)）

<iframe width="560" height="315" src="https://www.youtube.com/embed/LDpC2wqIoU4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
