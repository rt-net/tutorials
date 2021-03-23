# シミュレータの実行

このページでは、
[rt-net/raspimouse_sim](https://github.com/rt-net/raspimouse_sim)
パッケージを用いたシミュレーションの実行方法を説明します。

シミュレーション環境はUbuntu PC上に構築します。

## パッケージのダウンロードとインストール

次のコマンドを実行します。

```sh
# パッケージのダウンロード
$ cd ~/catkin_ws/src
$ git clone https://github.com/rt-net/raspimouse_sim.git

# 依存パッケージをインストール
$ git clone https://github.com/ryuichiueda/raspimouse_ros_2.git
$ git clone https://github.com/rt-net/raspimouse_description.git
$ rosdep install -r -y -i --from-paths raspimouse*

# パッケージをビルド
$ cd ~/catkin_ws && catkin_make
$ source ~/catkin_ws/devel/setup.bash

# Gazeboで使用するハードウェアモデルデータをダウンロード
$ rosrun raspimouse_gazebo download_gazebo_models.sh
```


