---
title: ROS / ROS 2のインストール
robot: Raspberry Pi Mouse
---

# ROS / ROS 2のインストール

このページでは、以下の2つのデバイスへのROSのインストール方法を説明します。

* Ubuntuインストール済みのノートパソコン等のPC
* Ubuntuインストール済みのRaspberry Pi

なお、ROSをすでにインストール済みの場合はこのページの手順は不要です。


## 使用機材 {: #requirements}


* 組み立て済みRaspberry Pi Mouse本体
    * [製品マニュアル](https://rt-net.jp/products/raspberrypimousev3/#downloads)を読んで組み立て済みの状態を前提としています
    * OS（**Ubuntu Server**）がインストール済みであることを前提としています
        * `ROS 2 Jazzy`を使用する場合: **Ubuntu Server 24.04**
        * `ROS 2 Humble`を使用する場合: **Ubuntu Server 22.04**
        * `ROS Noetic`を使用する場合: **Ubuntu Server 20.04**
        * Raspberry Pi OSでのROSの動作は確認していません
* Raspberry Pi Mouse用電源
    * バッテリでも電源変換ケーブルつきACアダプタでも可
* ノートパソコン等のPC
    * OS（**Ubuntu Desktop**）がインストール済みであることを前提としています
        * `ROS 2 Jazzy`を使用する場合: **Ubuntu Desktop 24.04**
        * `ROS 2 Humble`を使用する場合: **Ubuntu Desktop 22.04**
        * `ROS Noetic`を使用する場合: **Ubuntu Desktop 20.04**

!!! info
    `ROS 2 Foxy`は2023年6月にEOL（サポート終了）を迎えたため、`ROS 2 Jazzy`、`ROS 2 Humble`の使用を推奨しています。

## ROS / ROS 2のインストール（公式のドキュメントに沿って進める場合） {: #official-document}

=== "ROS"
    [https://wiki.ros.org/noetic/Installation/Ubuntu](https://wiki.ros.org/noetic/Installation/Ubuntu){target=_blank rel=noopener}
    を参考に、`ROS Noetic`をインストールします。

    GUIを使用する場合は`Desktop-Full`を、 使用しない場合は`ROS-Base`パッケージをインストールします。

=== "ROS 2 Jazzy（推奨）"
    [https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debs.html](https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debs.html){target=_blank rel=noopener}
    を参考に、`ROS 2 Jazzy`をインストールします。

    GUIを使用する場合は`Desktop`を、 使用しない場合は`ROS-Base`パッケージをインストールします。

    [https://docs.ros.org/en/humble/Tutorials/Colcon-Tutorial.html](https://docs.ros.org/en/humble/Tutorials/Colcon-Tutorial.html){target=_blank rel=noopener}
    を参考に、パッケージビルドツールの`colcon`をインストールします。
    
=== "ROS 2 Humble（推奨）"
    [https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html){target=_blank rel=noopener}
    を参考に、`ROS 2 Humble`をインストールします。

    GUIを使用する場合は`Desktop`を、 使用しない場合は`ROS-Base`パッケージをインストールします。

    [https://docs.ros.org/en/humble/Tutorials/Colcon-Tutorial.html](https://docs.ros.org/en/humble/Tutorials/Colcon-Tutorial.html){target=_blank rel=noopener}
    を参考に、パッケージビルドツールの`colcon`をインストールします。

## ROS / ROS 2のインストール（インストールスクリプトを使う場合） {: #install-script}

### ノートパソコン等のPC

非公式のインストールスクリプトを使うことで簡単にROS / ROS 2をインストールできます。

=== "ROS"
    このROSインストールスクリプトは`curl`を使用します。以下のコマンドでインストールします。
    
    ```sh
    $ sudo apt install -y curl
    ```
    
    以下のコマンドでROSインストールスクリプトを実行します。  
    環境にもよりますが完了までは10分以上かかる場合があります。
    
    ```sh
    $ git clone https://github.com/Tiryoh/ros_setup_scripts_ubuntu.git
    $ cd ros_setup_scripts_ubuntu
    $ ./ros-noetic-desktop-main.sh
    ```
    
    スクリプトが問題なく実行できれば以下のメッセージが表示されます。
    
    ```txt
    Success installing ROS noetic
    Run 'source ~/.bashrc'
    
    If any error occurs, please refer to the following URL.
    https://github.com/Tiryoh/ros_setup_scripts_ubuntu/
    ```
    
    以下のコマンドでインストールした設定を読み込みます。
    
    ```sh
    $ source ~/.bashrc
    ```
=== "ROS 2 Humble（推奨）"
    このROS 2インストールスクリプトは`curl`と`git`を使用します。以下のコマンドでインストールします。
    
    ```sh
    $ sudo apt install -y curl git
    ```
    
    以下のコマンドでROS 2インストールスクリプトを実行します。  
    環境にもよりますが完了までは10分以上かかる場合があります。
    
    ```sh
    $ git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git
    $ cd ros2_setup_scripts_ubuntu
    $ ./ros2-humble-desktop-main.sh
    ```
    
    スクリプトが問題なく実行できれば以下のメッセージが表示されます。
    
    ```txt
    Success installing ROS humble
    Run 'source ~/.bashrc'
    ```
    
    以下のコマンドでインストールした設定を読み込みます。
    
    ```sh
    $ source ~/.bashrc
    ```

### Raspberry Pi

非公式のインストールスクリプトを使うことで簡単にROS / ROS 2をインストールできます。

=== "ROS"
    このROSインストールスクリプトは`curl`を使用します。以下のコマンドでインストールします。
    
    ```sh
    $ sudo apt install -y curl
    ```
    
    以下のコマンドでROSインストールスクリプトを実行します。  
    環境にもよりますが完了までは10分以上かかる場合があります。
    
    ```sh
    $ git clone https://github.com/Tiryoh/ros_setup_scripts_ubuntu.git
    $ cd ros_setup_scripts_ubuntu
    $ ./ros-noetic-ros-base-main.sh
    ```
    
    スクリプトが問題なく実行できれば以下のメッセージが表示されます。
    
    ```txt
    Success installing ROS noetic
    Run 'source ~/.bashrc'
    
    If any error occurs, please refer to the following URL.
    https://github.com/Tiryoh/ros_setup_scripts_ubuntu/
    ```
    
    以下のコマンドでインストールした設定を読み込みます。
    
    ```sh
    $ source ~/.bashrc
    ```

=== "ROS 2 Humble（推奨）"
    このROS 2インストールスクリプトは`curl`と`git`を使用します。以下のコマンドでインストールします。
    
    ```sh
    $ sudo apt install -y curl git
    ```
    
    以下のコマンドでROS 2インストールスクリプトを実行します。  
    環境にもよりますが完了までは10分以上かかる場合があります。
    
    ```sh
    $ git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git
    $ cd ros2_setup_scripts_ubuntu
    $ ./ros2-humble-ros-base-main.sh
    ```
    
    スクリプトが問題なく実行できれば以下のメッセージが表示されます。
    
    ```txt
    Success installing ROS humble
    Run 'source ~/.bashrc'
    ```
    
    以下のコマンドでインストールした設定を読み込みます。
    
    ```sh
    $ source ~/.bashrc
    ```
