![LOGO](https://user-images.githubusercontent.com/73353020/135114462-cca78827-45a7-4c64-a9cf-5d3c32f0548e.png)

## :bookmark: アプリURL

http://ec2-35-76-104-102.ap-northeast-1.compute.amazonaws.com/


## :pushpin: アプリ概要

「 都市型のダイビングショップで働くプロダイバーのための海況共有アプリ 」

目的のダイビングサイトが海況が悪くクローズしてしまった時、
どのダイビングサイトなら楽しませつつ安全に潜ることができるか？
その判断に必要な情報を一覧で見ることができ、時間短縮することができます


## :speech_balloon: 開発背景

実際にプロダイバーとして10年以上働いていた経験から、プロダイバーの負担を軽くできるアプリを作りたいと考えました。

関東近辺の都市型のプロダイバーは、静岡・神奈川・千葉に点在する多くのダイビングサイトの中から、ダイビングツアーの目的地を決定しています。
その日に参加するお客様のレベルに合わせて安全に、かつ楽しめる場所を選ぶこともプロダイバーの大事な仕事の一つです。

自然相手の仕事なので、出発の朝に急な海況悪化に見舞われることも少なくありません。
その場合、各ダイビングポイントのHPを1つずつ見て海況を把握しなくてはならず、その作業はトイレ休憩で立ち寄ったサービスエリアなどネットワーク環境の悪い中で行っていました。またその最中にもお客様のお相手もしなくてはならないという状況になることが多々あり、プロダイバーへの負担は大きいものでした。

その経験から、その日の海況が一覧でパッと確認できる機能があれば、かなりの時間短縮になると思いそこに重点を置き開発しました。


## :pencil2: 開発言語

* Ruby 2.6.5
* Rails 5.2.5


## :zap: 使用Gem

* devise
* omniauth
* carrierwave
* streamio-ffmpeg
* kaminari
* gon
* capistrano
* unicorn
* whenever


## :zap: 就業Termの技術

* devise
* OAuth認証
* フォロー機能
* お気に入り機能
* Ajax
* AWS EC2


## :zap: カリキュラム外の技術

* Maps JavaScript API
* seedデータの定期実行(cron)
* 動画ファイルのスクリーンショット作成


## :rocket: 実行手順

```shell
$ git clone git@github.com:sachio-portfolio/prodive.git
$ cd prodive
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```

## :memo: 資料一覧

#### カタログ設計:

[カタログ設計共有リンク](https://docs.google.com/spreadsheets/d/1AY3INxswIw8aCZM5NPOUZ_2eTNjEHSc35VDY_JFjl58/edit?usp=sharing "Googleスプレッドシートへ")

#### テーブル定義書:

[テーブル定義書共有リンク](https://docs.google.com/spreadsheets/d/1AY3INxswIw8aCZM5NPOUZ_2eTNjEHSc35VDY_JFjl58/edit?usp=sharing "Googleスプレッドシートへ")

#### ワイヤーフレーム:

[ワイヤーフレーム共有リンク](https://cacoo.com/diagrams/xto9GIk9M80VectF/B3049 "Cacooのサイトへ")

#### ER図

<img width="823" alt="ER図" src="https://user-images.githubusercontent.com/73353020/135113649-d42d63b7-428f-4239-9963-ce4c6e69ff96.png">

#### 画面遷移図

<img width="1227" alt="画面遷移図" src="https://user-images.githubusercontent.com/73353020/135113820-50aa8232-5c2a-4057-b3ee-930bf69d7a32.png">
