
<h2>Jupyter Notebookの実行</h2>
ここからはノートパソコンのWebブラウザから操作します。
なお、このJupyter NotebookはJetBotのものをベースとしており、<b>JetBotの解説を読みながら</b>理解をすすめることもできます。

<code>http://$ROBOTIP:8888</code>にアクセスします。ログイン画面では「jetbot」を入力します。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/Screenshot-from-2020-09-04-21-20-19.png" alt="http://$ROBOTIP:8888" width="1287" height="789" class="alignnone size-full wp-image-14989" />

ログインできると以下のようにJupyter Labの操作画面が表示されます。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/Screenshot-from-2020-09-04-21-20-34.png" alt="Jupyter Lab" width="1287" height="789" class="alignnone size-full wp-image-14990" />

今回はobject_followingのサンプルを実行します。

物体検出のための学習済みのモデルをダウンロードします。<a href="https://github.com/NVIDIA-AI-IOT/jetbot/wiki/examples#example-4---object-following" rel="noopener" target="_blank">JetBotのJupyter Notebookの使い方</a>で紹介されているモデルです。
<a href="https://drive.google.com/open?id=1KjlDMRD8uhgQmQK-nC2CZGHFTbq4qQQH" rel="noopener" target="_blank">ssd_mobilenet_v2_coco.engine</a>

ダウンロードしたモデルをJupyter Labのアップロードボタンから<code>Notebooks/object_following</code>にアップロートします。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/2269c4e596c6d9bf2f1027673fc39bf2.png" alt="Jupyter Lab" width="328" height="237" class="alignnone size-full wp-image-14994" />

以上でobject_followingのJupyter Notebookが実行できるようになりました。

<code>Notebooks/object_following/live_demo.ipynb</code>を開き、セルを1つずつ実行していきます。

実行例の動画です。学習済みモデルの読み込みには少し時間がかかる場合があります。

https://www.youtube.com/watch?v=7h1j4Cx99is

うまく実行できない場合はカーネルをリスタートするとよいかもしれません。

<img src="https://rt-net.jp/mobility/wp-content/uploads/2020/09/ccc003207db2da0ded75d3f28059a038-e1599223496848.png" alt="" width="508" height="230" class="alignnone size-full wp-image-14996" />


その他のサンプルについては以下のページに詳しく説明されていますのでこちらをご覧ください。

https://github.com/NVIDIA-AI-IOT/jetbot/wiki/examples


<h2>どうしてもうまくいかないとき</h2>

よく起きるミス（開発中に頻繁に遭遇したミス）や便利スクリプトについてGitHub上でまとめています。

https://github.com/rt-net/jnmouse_utils

カメラの映像が映らいないなどJupyter Notebookが思ったように動かない場合、よくある問題であれば上記ページを参照すると解決する場合があります。
この情報が何かの役に立てば幸いです。

<b>※Jetson Nano Mouseのソフトウェアは基本的にオープンソースソフトウェアとして「AS IS」（現状有姿のまま）で提供しています。本ソフトウェアに関する無償サポートはありません。</b>
バグの修正や誤字脱字の修正に関するリクエストは常に受け付けていますが、それ以外の機能追加等のリクエストについては社内のガイドラインを優先します。

<h2>まとめ</h2>

今回は連載の第1回目で連載の概要とJetson Nano Mouseのセットアップ方法をご紹介しました。
またセットアップ後の動作確認としてJetBotで使用されているものと同等のサンプルをJetson Nano Mouseで実際に動かしてみました。
Jupyter Notebookのコンテンツについては今後も充実させていく予定です。
本記事の執筆時点（2020年9月7日）ではまだJupyter Notebookの中に書かれている説明が英語ですが、日本語での解説についても計画しています。
ぜひご購入をご検討ください！

https://rt-net.jp/products/jetson-nano-mouse

https://www.rt-shop.jp/index.php?main_page=product_info&cPath=1348_1&products_id=3891

<h2>謝辞</h2>

今回紹介したソフトウェアはMITライセンスで公開されているNVIDIAの<a href="https://github.com/NVIDIA-AI-IOT/jetbot" rel="noopener" target="_blank">jetbot</a>をベースとしています。

<pre>
Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</pre>