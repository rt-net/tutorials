---
title: ROS / ROS 2のインストール
robot: Raspberry Pi Mouse
---

# ROS / ROS 2のインストール

このページでは、以下の2つのデバイスへのROSのインストール方法を説明します。

* Ubuntuインストール済みのノートパソコン等PC
* Ubuntuインストール済みのRaspberry Pi

なお、ROSをすでにインストール済みの場合はこのページの手順は不要です。

## 前提条件 {: #requirements}

* ノートパソコン等PC
    * OS（**Ubuntu Desktop 20.04**）がインストール済みであること

* Raspberry Pi
    * OS（**Ubuntu Server 20.04**）がインストール済みであること
        * Raspberry Pi OSでのROSの動作は確認していません。

## ROS / ROS 2のインストール（公式のドキュメントに沿って進める場合） {: #official-document}

=== "ROS"
    [https://wiki.ros.org/noetic/Installation/Ubuntu](https://wiki.ros.org/noetic/Installation/Ubuntu){target=_blank rel=noopener}
    を参考に、`ROS Noetic`をインストールします。

    GUIを使用する場合は`Desktop-Full`を、 使用しない場合は`ROS-Base`パッケージをインストールします。

=== "ROS 2"
    [https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html](https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html){target=_blank rel=noopener}
    を参考に、`ROS 2 Foxy`をインストールします。

    GUIを使用する場合は`Desktop`を、 使用しない場合は`ROS-Base`パッケージをインストールします。

    [https://docs.ros.org/en/foxy/Tutorials/Colcon-Tutorial.html](https://docs.ros.org/en/foxy/Tutorials/Colcon-Tutorial.html){target=_blank rel=noopener}
    を参考に、パッケージビルドツールの`colcon`をインストールします。

## ROS / ROS 2のインストール（インストールスクリプトを使う場合） {: #install-script}

### ノートパソコン等PC

非公式のインストールスクリプトを使うことで簡単にROS / ROS 2をインストールできます。

=== "ROS"
    今回使用するROSのインストーラは`curl`を使用します。以下のコマンドでインストールします。
    
    ```sh
    $ sudo apt install -y curl
    ```
    
    以下のコマンドを実行してインストーラでROSをインストールします。  
    環境にもよりますが完了までは10分以上かかる場合があります。
    
    ```sh
    $ bash -c "$(curl -SsfL u.ty0.jp/ros-noetic-desktop)"
    ```
    
    インストーラが問題なく実行できれば以下のメッセージが表示されます。
    
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
=== "ROS 2"
    今回使用するROS 2のインストーラは`curl`と`git`を使用します。以下のコマンドでインストールします。
    
    ```sh
    $ sudo apt install -y curl git
    ```
    
    以下のコマンドを実行してインストーラでROS 2をインストールします。  
    環境にもよりますが完了までは10分以上かかる場合があります。
    
    ```sh
    $ git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git
    $ cd ros2_setup_scripts_ubuntu
    $ ./ros2-foxy-desktop-main.sh
    ```
    
    スクリプトが問題なく実行できれば以下のメッセージが表示されます。
    
    ```txt
    Success installing ROS foxy
    Run 'source ~/.bashrc'
    ```
    
    以下のコマンドでインストールした設定を読み込みます。
    
    ```sh
    $ source ~/.bashrc
    ```

### Raspberry Pi

公式の方法ではありませんが、インストールスクリプトを使うことで簡単にインストールを済ませることもできます。

=== "ROS"
    今回使用するROSのインストーラは`curl`を使用します。以下のコマンドでインストールします。
    
    ```sh
    $ sudo apt install -y curl
    ```
    
    以下のコマンドを実行してインストーラでROSをインストールします。  
    環境にもよりますが完了までは10分以上かかる場合があります。
    
    ```sh
    $ bash -c "$(curl -SsfL u.ty0.jp/ros-noetic-ros-base)"
    ```
    
    スクリプトが問題なく実行できれば以下のメッセージが表示されます。
    
    ```txt
    Success installing ROS melodic
    Run 'source ~/.bashrc'
    
    If any error occurs, please refer to the following URL.
    https://github.com/Tiryoh/ros_setup_scripts_ubuntu/
    ```
    
    以下のコマンドでインストールした設定を読み込みます。
    
    ```sh
    $ source ~/.bashrc
    ```
=== "ROS 2"
    今回使用するROS 2のインストーラは`curl`と`git`を使用します。以下のコマンドでインストールします。
    
    ```sh
    $ sudo apt install -y curl git
    ```
    
    以下のコマンドを実行してインストーラでROS 2をインストールします。  
    環境にもよりますが完了までは10分以上かかる場合があります。
    
    ```sh
    $ git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git
    $ cd ros2_setup_scripts_ubuntu
    $ ./ros2-foxy-ros-base.sh
    ```
    
    インストーラが問題なく実行できれば以下のメッセージが表示されます。
    
    ```txt
    Success installing ROS foxy
    Run 'source ~/.bashrc'
    ```
    
    以下のコマンドでインストールした設定を読み込みます。
    
    ```sh
    $ source ~/.bashrc
    ```
