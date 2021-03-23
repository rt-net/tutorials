# ROS パッケージのインストール

このページでは、Raspberry Pi MouseのROSサンプル集のインストール方法を説明します。

## ROSのインストール

[http://wiki.ros.org/melodic/Installation/Ubuntu](http://wiki.ros.org/melodic/Installation/Ubuntu)
を参考に、`ROS Melodic`をインストールします。

## ROSパッケージのインストール

制御用のパッケージである
[ryuichiueda/raspimouse_ros_2](https://github.com/ryuichiueda/raspimouse_ros_2)
と、サンプル集パッケージ
[rt-net/raspimouse_ros_examples](https://github.com/rt-net/raspimouse_ros_examples)
をダウンロードしてインストールします。

```sh
$ cd ~/catkin_ws/src
# Clone ROS packages
$ git clone https://github.com/ryuichiueda/raspimouse_ros_2
$ git clone https://github.com/rt-net/raspimouse_ros_examples 
# For direction control example
$ git clone https://github.com/rt-net/rt_usb_9axisimu_driver

# Install dependencies
$ rosdep install -r -y --from-paths . --ignore-src      

# make & install
$ cd ~/catkin_ws && catkin_make
$ source devel/setup.bash
```
