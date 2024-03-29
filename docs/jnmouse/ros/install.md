---
title: ROSのインストール
robot: Jetson Nano Mouse
---

# ROSのインストール

このページでは、以下の2つのデバイスへのROSのインストール方法を説明します。

* Ubuntuインストール済みのノートパソコン等のPC
* JetPackインストール済みのJetson Nano

なお、以下の場合はこのページの手順は不要です。

* ノートパソコン等のPCへROSをすでにインストール済みの場合
* Jetson Nanoに[本チュートリアルで紹介しているJetPackイメージ](../driver/install.md)を書き込んだ場合

## 前提条件 {: #requirements}

* ノートパソコン等のPC
    * OS（**Ubuntu Desktop 18.04**）がインストール済みであること

* Jetson Nano
    * OS（**JetPack 4.5.1**）がインストール済みであること
        * インストール方法については[イメージファイルの書き込み](../driver/install.md)を参照してください

## Jetson Nano

=== "ROS"
    [本サイトで紹介しているイメージファイルの書き込み手順](../driver/install.md)でセットアップした場合は**`ROS Melodic`がインストール済みです**。

    
    手動でインストールする場合は、
    [https://wiki.ros.org/melodic/Installation/Ubuntu](https://wiki.ros.org/melodic/Installation/Ubuntu){target=_blank rel=noopener}
    を参考に、`ROS Melodic`をインストールします。
    GUIを使用する場合は`Desktop-Full`を、
    使用しない場合は`ROS-Base`パッケージをインストールします。

## ノートパソコン等のPC

### ROSのインストール（公式のドキュメントに沿って進める場合） {: #official-document}

=== "ROS"
    [https://wiki.ros.org/melodic/Installation/Ubuntu](https://wiki.ros.org/melodic/Installation/Ubuntu){target=_blank rel=noopener}
    を参考に、`ROS Melodic`をインストールします。

    GUIを使用する場合は`Desktop-Full`を、 使用しない場合は`ROS-Base`パッケージをインストールします。
### ROS / ROS 2のインストール（インストールスクリプトを使う場合） {: #install-script}

非公式のインストールスクリプトを使うことで簡単にROS / ROS 2をインストールできます。

=== "ROS"
    今回使用するROSのインストーラは`curl`を使用します。以下のコマンドでインストールします。
    
    ```sh
    $ sudo apt install -y curl
    ```
    
    以下のコマンドを実行してインストールスクリプトでROSをインストールします。  
    環境にもよりますが完了までは10分以上かかる場合があります。
    
    ```sh
    $ bash -c "$(curl -SsfL u.ty0.jp/ros-melodic-desktop)"
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
