<h2>紹介するサンプルについて</h2>

今回はNVIDIA社が公開しているAIロボットキットである<a href="https://www.nvidia.com/ja-jp/autonomous-machines/embedded-systems/jetbot-ai-robot-kit/" target="_blank" rel="noopener">JetBot</a>のプロジェクトをベースに作成したサンプルを紹介します。機械学習を利用したプログラムでロボットを動かす<b><a href="https://jupyter.org/" target="_blank" rel="noopener">Jupyter Notebook</a></b>のサンプルです。
Jupyter Notebookを使うと<b>コードとドキュメントが一体化</b>した「ノートブック形式」でコードとドキュメントを保存できます。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/9ebeab3675a72f80ee6366f60c59a821.png" alt="ノートブック形式" width="1920" height="1080" class="alignnone size-full wp-image-14957" />

コードはテキストエディタやIDEで書いて、ドキュメントは別で用意することは一般的でしたが、Jupyter Notebookが使える場合にはコードを対話的に実行して動作確認し、<b>ドキュメントを一緒につけて保存</b>することができます。
Jupyter Notebookを活用した教材もあり、たとえば、千葉工業大学の上田隆一先生の「<a href="https://www.kspub.co.jp/book/detail/5170069.html" target="_blank" rel="noopener">詳解　確率ロボティクス</a>」ではJupyter Notebookでロボットのシミュレーションとアルゴリズムの解説をしています。

今回はこのプロモーション動画の1:03以降で動かしているプログラムを動かすまでを紹介します。

https://www.youtube.com/watch?v=KIklhoDDCD0

<h3>このサンプルの実行に必要なもの</h3>

このサンプルの実行には以下のものと<b>十分な実験スペース</b>が必要です。

<ol>
<li>Jetson Nano Mouse本体</li>
<li>Jetson Nano Mouse用電源（バッテリでも電源変換ケーブルつきACアダプタでも可）</li>
<li>NVIDIA Jetson Nano 開発者キット B01 ※1</li>
<li>microSDカード ※2</li>
<li>HDMI入力付きのモニタ</li>
<li>USBキーボードとマウス</li>
<li>USB接続の無線LANアダプタ（オプション） ※3</li>
<li>操作用ノートパソコン</li>
</ol>

詳しくはこのあと説明します。

※1 Jetson Nanoについて
Jetson Nano開発者キットには以下の2種類が存在します。
<ul>
<li>現行モデルのCSIカメラを2つ搭載できる「NVIDIA Jetson Nano 開発者キット B01」</li>
<li>旧モデルでCSIカメラを1台のみ搭載できる「NVIDIA Jetson Nano 開発者キット A01」</li>
</ul>
2020年9月7日現在、新品で販売されているJetson Nanoの大半はCSIカメラを2つ搭載できる「NVIDIA Jetson Nano 開発者キット B01」ですが、予め確認した上でのご購入をおすすめします。

<div class="information-box">
以前発売されていたモデルの「NVIDIA Jetson Nano 開発者キット A01」でもJetson Nano Mouse自体は制御可能です。
ただし、Jetson Nano Mouseについている2台のカメラのうちの1台のみの接続となります。
2020年10月5日に発表されたメモリ2GBのJetson Nano 開発者キットについては未確認です。
</div>

※2 microSDカードについて
Jetson Nano用です。書き込むイメージが約20GB程度あるので32GB以上必須です。余裕を持って使うには64GB以上を推奨します。

※3 無線LANアダプタについて
無線LANアダプタはTP-Link社の<a href="https://www.tp-link.com/jp/home-networking/adapter/tl-wn725n/" rel="noopener" target="_blank">TL-WN725N</a>で動作確認をしています。

<h2>Jetson Nano Mouseをセットアップする</h2>

Jetson Nano Mouseを制御できるように<b>Jetson Nanoをセットアップ</b>する方法を紹介します。
購入後、開封してJetson Nanoをセットし、<b>電源を繋げばロボットは動かせる</b>ようになっています。購入時に付属する製品マニュアル（PDF）に動作確認方法はスクリーンショットつきで細かく解説されています。
今回は機体の動作確認だけでなく、<b>Jupyter Notebookを用いた機械学習のサンプルプログラムを動かせる</b>ところまで確認できるソフトウェアのセットアップ方法を紹介します。

<h3>Jetson Nanoのイメージをダウンロード＆書き込み</h3>

ベースとなるJetson Nano用のOS、L4Tをダウンロードし、開発用のPCからmicroSDへ書き込みます。NVIDIA社が公開しているAIロボットキットである<a href="https://www.nvidia.com/ja-jp/autonomous-machines/embedded-systems/jetbot-ai-robot-kit/" target="_blank" rel="noopener">JetBot</a>用のイメージでは機械学習ライブラリの<a href="https://pytorch.org/" target="_blank" rel="noopener">PyTorch</a>や<a href="https://www.tensorflow.org/?hl=ja" target="_blank" rel="noopener">TensorFlow</a>、プログラム実行環境のJupyter Lab（後ほど説明します）等があらかじめインストールされているのでこのイメージを使用します。イメージファイルは以下のURLからjetbot_image_v0p4p0.zipという名前の7GB程度の圧縮ファイルでダウンロードできます。
<a href="https://drive.google.com/open?id=1G5nw0o3Q6E08xZM99ZfzQAe7-qAXxzHN" target="_blank" rel="noopener">https://drive.google.com/open?id=1G5nw0o3Q6E08xZM99ZfzQAe7-qAXxzHN</a>

このjetbot_image_v0p4p0.zipは<b>JetPack 4.3</b>がベースとなっています。
JetBot用イメージ作成用スクリプト：<a href="https://github.com/NVIDIA-AI-IOT/jetcard" rel="noopener" target="_blank">https://github.com/NVIDIA-AI-IOT/jetcard</a>

JetBotのセットアップ方法は<b>GitHub上に公開されています</b>ので、イメージの詳細について、イメージの最新の情報について知りたい場合はNVIDIAのGitHubリポジトリを参照してください。
JetBotのセットアップ方法（英語）：<a href="https://github.com/NVIDIA-AI-IOT/jetbot/wiki/software-setup" rel="noopener" target="_blank">https://github.com/NVIDIA-AI-IOT/jetbot/wiki/software-setup</a>

<a href="https://www.balena.io/etcher/" target="_blank" rel="noopener">balenaEtcher</a>等を用いてmicroSDカードにイメージを書き込みます。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/75cb799bd850f71d34f4f877c16c990e.gif" alt="Jetson Nanoのイメージをダウンロード＆書き込み" width="796" height="478" class="alignnone size-full wp-image-14964" />

書き込みが無事に完了したらmicroSDカードをJetson Nanoに差し込み、起動します。

※より詳しい書き込み方を知りたい場合は<a href="https://rt-net.jp/products/jetson-nano-mouse#downloads">製品マニュアル</a>をご覧ください。

<h3>Jetson Nanoのネットワーク設定</h3>

ここからはJetson Nano Mouseに搭載されたJetson Nanoで操作します。
SSHやVNCでログインしたり、HDMI接続ができるモニタとキーボードを繋ぐ方法とありますが、今回は<b>モニタとキーボードを繋いでネットワークの設定</b>まで行い、その後SSHでログインします。

JetBotのイメージの場合は<b>ユーザ名とデフォルトパスワードが「jetbot」</b>となっています。自動ログインになっていると思いますが、もしパスワードを聞かれたら、「jetbot」を入力します。

HDMI接続ができるモニタとUSBキーボード、マウスを接続します。今回は無線で使いたいので<b>さらに無線LANアダプタを接続</b>します。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/jetson_nano_setup_connect_accessory.png" alt="無線LANアダプタを接続" width="888" height="888" class="alignnone size-full wp-image-15407" />

無線LANアダプタを接続すると近くのアクセスポイントが見えるようになるので接続します。このとき、操作するノートパソコンとJetson Nanoが<b>同じネットワークに接続</b>されるようにしてください。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/d979281e3b6d5b7c8b6d07e9c5d31771-e1599216131479.png" alt="ネットワークに接続" width="1200" height="662" class="alignnone size-full wp-image-14969" />

Connection InformationからIPアドレスをメモしておきます。
この例では<code>192.168.100.3</code>です。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/537f95e39847b7c423e2d270c83b044b-e1599216519667.png" alt="Connection Information" width="796" height="590" class="alignnone size-full wp-image-14970" />

この段階で自動でソフトウェアがアップデートされないよう、パッケージマネージャの設定を変更しておきます。
ソフトウェアのアップデートによってバージョンの不一致で動かなくなるソフトウェアもまれにあるためです。
<code>git</code>コマンドで <a href="https://github.com/rt-net/jnmouse_utils" rel="noopener" target="_blank">rt-net/jnmouse_utils@GitHub</a> をダウンロードし設定用のスクリプトを実行します。パスワードを聞かれたら「jetbot」を入力します。

<pre>git clone https://github.com/rt-net/jnmouse_utils.git
./jnmouse_utils/scripts/disable-auto-apt-upgrade.sh</pre>

以上でモニタを接続した作業は終了です。モニタ、キーボード、マウスは外します。無線LANのアダプタは外さないように注意してください。

<h3>Jetson Nano Mouse用のデバイスドライバのインストール</h3>

ここからはJetson Nano Mouseに搭載されたJetson Nanoで操作します。

今回はUbuntu 18.04がインストールされたノートパソコンから操作します。
デスクトップパソコンでも問題ありませんが、移動ロボットの場合は近くで操作できたほうが何かと便利なのでノートパソコンをおすすめします。

 <span class="keyboard-key">Ctrl</span> + <span class="keyboard-key">Alt</span> + <span class="keyboard-key">T</span>で端末を起動します。
以後、基本的にはコマンドはこの端末から実行します。

先程メモしたIPアドレスを指定してSSHでログインします。先程も軽く触れましたが、<b>JetBotのイメージを使っている場合はユーザ名とパスワードともに「jetbot」</b>です。
今回は先程メモしたIPアドレスが<code>192.168.100.3</code>だったので以下のコマンドでログインできます。

<pre>ssh jetbot@192.168.100.3</pre>

以後、Jetson Nano MouseのIPアドレスを<code>ssh jetbot@$ROBOTIP</code>のように<code>$ROBOTIP</code>と表記します。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/Screenshot-from-2020-09-04-20-07-42.png" alt="Jetson Nano MouseのIPアドレス" width="734" height="488" class="alignnone size-full wp-image-14975" />

Jetson NanoのGPIOを設定するためのツールであるJetson-IOを使ってSPI1を有効にしてJetson NanoとJetson Nano Mouseの基板が通信できるようにします。
次のコマンドでJetson-IOを起動します。

<pre>sudo /opt/nvidia/jetson-io/jetson-io.py</pre>

Jetson-IOが起動できない場合は<a href="https://github.com/rt-net/jnmouse_utils/blob/master/scripts/fix-jetsonio-r3231.sh">修正用スクリプト</a>を実行するために以下のコマンドを実行してみてください。

<pre>~/jnmouse_utils/scripts/fix-jetsonio-r3231.sh</pre>

<code>Configure 40-pin expansion header</code>を選択し、<code>spi1</code>を有効にするfunctionとして選択します。
<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/68747470733a2f2f692e6779617a6f2e636f6d2f65396464623039613863343437343035613563386266653139643939333761632e706e67.png" alt="Configure 40-pin expansion header" width="914" height="776" class="alignnone size-full wp-image-14984" />
<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/68747470733a2f2f692e6779617a6f2e636f6d2f35666330393961306633656438653065346361626564656432623264656536382e706e67.png" alt="Configure 40-pin expansion header" width="914" height="776" class="alignnone size-full wp-image-14985" />


function選択後は<code>Back</code>を選び、メニューに戻ります。

<code>Select one of the following options:</code>と言われるので、<code>Save and reboot to reconfigure pins</code>を選択して再起動します。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/68747470733a2f2f692e6779617a6f2e636f6d2f36333861653834336531336533306231306164373130616462303162363830312e706e67.png" alt="Save and reboot to reconfigure pins" width="914" height="776" class="alignnone size-full wp-image-14991" />

操作1ステップずつのスクリーンショットつきの詳しい説明およびエラーごとの対処法は以下のページに記載しています。
<a href="https://github.com/rt-net/JetsonNanoMouse/wiki/" rel="noopener" target="_blank">https://github.com/rt-net/JetsonNanoMouse/wiki/</a>

再起動後、先程と同様にSSHでログインします。

<code>git</code>コマンドで <a href="https://github.com/rt-net/JetsonNanoMouse" rel="noopener" target="_blank">rt-net/JetsonNanoMouse@GitHub</a> をダウンロードし、そのディレクトリに移動します。

<pre>git clone https://github.com/rt-net/JetsonNanoMouse.git
cd JetsonNanoMouse</pre>

次のコマンドでデバイスドライバをインストールします。

<pre>make
sudo make install</pre>

特にエラーが出なければインストール完了です。
以下のコマンドを実行してみて、ブザーが2秒間鳴ればデバイスドライバは正常に動いています。

<pre>echo 400 > /dev/rtbuzzer0 && sleep 2 && echo 0 > /dev/rtbuzzer0</pre>

<h3>Jetson Nano Mouse用のJupyter Notebookのダウンロードとインストール</h3>

<code>git</code>コマンドで <a href="https://github.com/rt-net/jnm_jupyternotebook" rel="noopener" target="_blank">rt-net/jnm_jupyternotebook@GitHub</a> をダウンロードし、そのディレクトリに移動します。

<pre>git clone https://github.com/rt-net/jnm_jupyternotebook.git
cd jnm_jupyternotebook</pre>

つぎにJetson Nano Mouse制御用のPythonパッケージ、「jnmouse」をインストールします。
このパッケージは<b>「<a href="https://github.com/NVIDIA-AI-IOT/jetbot" rel="noopener" target="_blank">jetbot</a>」とある程度互換性が保たれるように実装</b>されています。

<pre>sudo python3 setup.py install</pre>

次にダウンロードしてきたJupyter Notebookを<code>~/Notebooks</code>ディレクトリにコピーします。
JetBotのイメージでは起動時に<code>~/Notebooks</code>ディレクトリでJupyter Lab（Jupyter Notebookを拡張したもの）のサーバが8888番ポートで立ち上がるようになっています。

<pre>./scripts/copy_notebook.sh</pre>

ここまでできれば先程紹介したサンプルプログラムを動かすためのJetson Nanoのセットアップは概ね完了です。