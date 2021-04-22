# ROS パッケージのインストール

このページでは、Raspberry Pi MouseのROSサンプル集のインストール方法を説明します。

## Raspberry PiにインストールするOSについて

Raspberry Pi OSでのROSの動作は確認していません。
**Ubuntu Serverのインストールを推奨します**。

## ROSのインストール

[http://wiki.ros.org/noetic/Installation/Ubuntu](http://wiki.ros.org/noetic/Installation/Ubuntu)
を参考に、`ROS Noetic`をインストールします。
Ubuntu ServerではGUIを使用しないため、`ROS-Base`パッケージをインストールします。

## ROSパッケージのインストール

制御用のパッケージである
[ryuichiueda/raspimouse_ros_2](https://github.com/ryuichiueda/raspimouse_ros_2)
と、サンプル集パッケージ
[rt-net/raspimouse_ros_examples](https://github.com/rt-net/raspimouse_ros_examples)
をダウンロードしてインストールします。

```sh
$ source /opt/ros/$ROS_DISTRO/setup.bash
$ mkdir -p ~/catkin_ws/src
$ cd ~/catkin_ws/src
# Clone ROS packages
$ git clone https://github.com/ryuichiueda/raspimouse_ros_2
$ git clone -b $ROS_DISTRO-devel https://github.com/rt-net/raspimouse_ros_examples 
# For direction control example
$ git clone https://github.com/rt-net/rt_usb_9axisimu_driver

# Install dependencies
$ rosdep install -r -y --from-paths . --ignore-src      

# make & install
$ cd ~/catkin_ws && catkin_make
$ source ~/catkin_ws/devel/setup.bash
```
