---
title: ROS 2のインストール
robot: CRANE+ V2
---

# ROS 2のインストール

このページではROS 2のインストール方法を説明します。

## 使用機材 {: #requirements}

* 設置済みCRANE+ V2本体
    * [製品マニュアル](https://rt-net.jp/products/cranev2/)を読んで設置済みの状態を前提としています
* ノートパソコン等のPC
    * OS（**Ubuntu Desktop**）がインストール済みであることを前提としています
        * `ROS 2 Humble`を使用する場合（推奨）: **Ubuntu Desktop 22.04**
        * `ROS 2 Foxy`を使用する場合（非推奨）: **Ubuntu Desktop 20.04**

!!! info
    `ROS 2 Foxy`は2023年6月にEOL（サポート終了）を迎えたため、`ROS 2 Humble`の使用を推奨しています。

## ROS 2のインストール（公式のドキュメントに沿って進める場合） {: #official-document}

=== "ROS 2 Humble（推奨）"

    [https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html){target=_blank rel=noopener}
    を参考に、`ROS 2 Humble`をインストールします。

    GUIを使用する場合は`Desktop`を、 使用しない場合は`ROS-Base`パッケージをインストールします。

    [https://docs.ros.org/en/humble/Tutorials/Colcon-Tutorial.html](https://docs.ros.org/en/humble/Tutorials/Colcon-Tutorial.html){target=_blank rel=noopener}
    を参考に、パッケージビルドツールの`colcon`をインストールします。

=== "ROS 2 Foxy（非推奨）"

    [https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html](https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html){target=_blank rel=noopener}
    を参考に、`ROS 2 Foxy`をインストールします。

    GUIを使用する場合は`Desktop`を、 使用しない場合は`ROS-Base`パッケージをインストールします。

    [https://docs.ros.org/en/foxy/Tutorials/Colcon-Tutorial.html](https://docs.ros.org/en/foxy/Tutorials/Colcon-Tutorial.html){target=_blank rel=noopener}
    を参考に、パッケージビルドツールの`colcon`をインストールします。

## ROS 2のインストール（インストールスクリプトを使う場合） {: #install-script}

非公式のインストールスクリプトを使うことで簡単にROS 2をインストールできます。

=== "ROS 2 Humble（推奨）"

    このROS 2インストールスクリプトは`curl`と`git`を使用します。以下のコマンドで
    インストールします。

    ```sh
    sudo apt install -y curl git
    ```

    以下のコマンドでROS 2インストールスクリプトを実行します。
    環境にもよりますが完了までは10分以上かかる場合があります。

    ```sh
    git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git
    cd ros2_setup_scripts_ubuntu
    ./ros2-humble-desktop-main.sh
    ```

    スクリプトが問題なく実行できれば以下のメッセージが表示されます。

    ```txt
    Success installing ROS humble
    Run 'source ~/.bashrc'
    ```

    以下のコマンドでインストールした設定を読み込みます。

    ```sh
    source ~/.bashrc
    ```

=== "ROS 2 Foxy（非推奨）"

    このROS 2インストールスクリプトは`curl`と`git`を使用します。以下のコマンドで
    インストールします。

    ```sh
    sudo apt install -y curl git
    ```

    以下のコマンドでROS 2インストールスクリプトを実行します。
    環境にもよりますが完了までは10分以上かかる場合があります。

    ```sh
    git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git
    cd ros2_setup_scripts_ubuntu
    ./ros2-foxy-desktop-main.sh
    ```

    スクリプトが問題なく実行できれば以下のメッセージが表示されます。

    ```txt
    Success installing ROS foxy
    Run 'source ~/.bashrc'
    ```

    以下のコマンドでインストールした設定を読み込みます。

    ```sh
    source ~/.bashrc
    ```

