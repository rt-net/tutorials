# ROS サンプル集の実行

このページでは
[rt-net/raspimouse_ros_examples](https://github.com/rt-net/raspimouse_ros_examples)
のサンプル実行方法を説明します。

サンプルを実行する場合は下記コマンドを実行し、
ROSとパッケージを読み込んでください。

```sh
$ source /opt/ros/noetic/setup.bash
$ source ~/catkin_ws/devel/setup.bash
```

## Raspberry PiとPC間のROSネットワークを接続する

環境変数`ROS_IP`、`ROS_MASTER_URI`を設定することで、
PCからネットワークを介してRaspberry Pi側のトピックやサービスにアクセスできます。

Raspberry PiのIPアドレスが`192.168.11.89`、
PCのIPアドレスが`192.168.11.100`のとき、
下記コマンドで環境変数を設定します。

```sh
# Raspberry Pi側
$ export ROS_IP=192.168.11.89
$ export ROS_MASTER_URI=http://192.168.11.89:11311/

# PC側
# ROS_MASTER_URIにはRaspberry PiのIPアドレスを入力する
$ export ROS_IP=192.168.11.100
$ export ROS_MASTER_URI=http://192.168.11.89:11311/
```

ネットワーク接続を切る場合は、
`ROS_MASTER_URI`をデフォルトの`http://localhost:11311/`に戻します。

## キーボードで操縦する

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros_examples#keyboard_control)です。
PCから操縦する場合はネットワークと環境変数を設定してください。

## ジョイスティックコントローラで操縦する

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros_examples#joystick_control)です。
PCから操縦する場合はネットワークと環境変数を設定してください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/GswxdB8Ia0Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## カメラで物体追跡する

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros_examples#object_tracking)です。
物体検出画像をPCで表示する場合はネットワークと環境変数を設定してください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/U6_BuvrjyFc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## ライントレース

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros_examples#line_follower)です。
PCから操縦する場合はネットワークと環境変数を設定してください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/oPm0sW2V_tY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## LiDARでSLAM

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros_examples#slam)です。
SLAMパッケージをPCで起動する場合はネットワークと環境変数を設定してください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/gWozU47UqVE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/hV68UqAntfo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## IMUで角度制御

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros_examples#direction_control)です。

<iframe width="560" height="315" src="https://www.youtube.com/embed/LDpC2wqIoU4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
