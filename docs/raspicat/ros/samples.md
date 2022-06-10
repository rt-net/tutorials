---
title: ROSの実行
robot: Raspberry Pi Mouse
---

# ROSを使用してRaspberry Pi Catの制御

このページでは
マッピングからナビゲーションまでの実行方法を説明します。

サンプルを実行する場合は下記コマンドを実行し、
ROSとパッケージを読み込んでください。

```sh
$ source /opt/ros/melodic/setup.bash
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

実行手順はhogehoge
を参照してください。
PCから操縦する場合はネットワークと環境変数を設定してください。

## ジョイスティックコントローラで操縦する

実行手順はhogehoge
を参照してください。
PCから操縦する場合はネットワークと環境変数を設定してください。

実行手順はhgehoge
を参照してください。
PCから操縦する場合はネットワークと環境変数を設定してください。

## LiDARでSLAM

実行手順はhogehoge
を参照してください。
SLAMパッケージをPCで起動する場合はネットワークと環境変数を設定してください。

## LiDARでナビゲーション

実行手順はhogehoge
を参照してください。
ナビゲーションパッケージをPCで起動する場合はネットワークと環境変数を設定してください。