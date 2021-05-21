---
title: ROS サンプル集の実行
robot: Raspberry Pi Mouse
---

# ROS サンプル集の実行

このページでは
[rt-net/raspimouse_ros2_examples](https://github.com/rt-net/raspimouse_ros2_examples)
のサンプル実行方法を説明します。

サンプルを実行する場合は下記コマンドを実行し、
ROS 2とパッケージを読み込んでください。

```sh
$ source /opt/ros/foxy/setup.bash
$ source ~/ros2_ws/install/setup.bash
```

## Raspberry PiとPC間のROSネットワークを接続する

PCとRaspberry Piに同じ環境変数`ROS_DOMAIN_ID`を設定することで、
PCからネットワークを介してRaspberry Pi側のトピックやサービスにアクセスできます。

下記コマンドでは、PCとRaspberry Piにそれぞれ`ROS_DOMAIN_ID=22`を設定します。

```sh
# Raspberry Pi側
$ export ROS_DOMAIN_ID=22

# PC側
$ export ROS_DOMAIN_ID=22
```

ネットワーク接続を切る場合は、
`ROS_DOMAIN_ID`を削除します。

```sh
$ unset ROS_DOMAIN_ID
```

## ジョイスティックコントローラで操縦する

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros2_examples#joystick_control)です。
PCから操縦する場合はネットワークと環境変数を設定してください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/GswxdB8Ia0Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## カメラで物体追跡する

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros2_examples#object_tracking)です。
物体検出画像をPCで表示する場合はネットワークと環境変数を設定してください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/U6_BuvrjyFc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## ライントレース

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros2_examples#line_follower)です。
PCから操縦する場合はネットワークと環境変数を設定してください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/oPm0sW2V_tY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## LiDARでSLAM

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros2_examples#slam)です。
SLAMパッケージをPCで起動する場合はネットワークと環境変数を設定してください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/gWozU47UqVE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/hV68UqAntfo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## IMUで角度制御

実行手順は[こちら](https://github.com/rt-net/raspimouse_ros2_examples#direction_controller)です。

<iframe width="560" height="315" src="https://www.youtube.com/embed/LDpC2wqIoU4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
