# SOLOGOL
SOLOGOL (ソロゴル)とは、「お一人様ゴルフ」でも、寂しい思いをすることなく、楽しくゴルフをプレーすることをサポートするアプリケーションです。

## URL
[sologol.work](https://sologol.work/)

## 制作に至った背景
現在のコロナ禍において、ゴルフ業界は外出自粛によって経営的に大打撃を受けています。
そんなゴルフ業界の打開策として、３密を生まない「お一人様ゴルフ」なるものを始めるゴルフ場も増えてきています。
ただ、ゴルフは気の合う仲間と複数人でプレーするのが楽しいものです。なかなか1人でラウンドしようとは思わないという方も多いかと思います。
ゴルフを愛する者としては、このままの経営悪化状況が続き、ゴルフ場が減ってしまうことはとても悲しいことです。少しでもお一人様ゴルフをする方が増えて、
ゴルフ業界にとっての危機的状況からの脱却への一助となればと思い、制作に至りました。

![スクリーンショット 2021-03-01 12 04 24](https://user-images.githubusercontent.com/69664323/109450744-08b62980-7a8f-11eb-8107-aac3aa383d7f.png)

## このアプリを使用するメリット
* リーダーボード(スコアのランキング)機能を使って、知らない方同士とスコアを競い合うことが出来る。
* フォローしているユーザーのラウンド情報をタイムラインで知ることが出来る。
* ゴルフ版SNSとして、ゴルフ仲間を作ることができる。
* 各ゴルフ場の掲示板で、ゴルフ場の口コミ等、生の情報を得られる。
* スコア解析機能で、過去のスコアを解析することができる。
 

## 工夫した点
* APIからのゴルフ場情報の取得とDBへの登録
  スコア等の諸々のデータとゴルフ場名を紐付けしようとすると、ゴルフ場名に一意性がなければ成立しない。そこで、楽天ゴルフ場詳細APIを使用してゴルフ場情報を取得し、gem wheneverを使用して週に一回情報の自動更新する機能を実装した。
* スコア入力のし易さ
  スコア入力画面は、ゴルフ場にてスマートフォンからの入力を想定し、大きなボタンで入力のし易さに配慮した。
* スコア非公開機能
  自分のゴルフスコアを公開せず、スコア解析機能のみ使用したい方のために、スコア非公開機能を実装した。
* AWS CloudFrontと、gem mini_magickを使用して、画像の表示を高速化し、ユーザーにストレスを与えにくくした。

## 機能一覧

### ユーザー関係
* ユーザー登録・編集・削除（deviseのgemを使用)
* 登録不要のゲストログイン
* プロフィール画像の登録・編集（carrierwave使用）
* ユーザーのフォロー・フォロー解除
* フォロー中のユーザーとフォロワーの一覧表示
* フォローしているユーザーの最近のラウンド情報をタイムライン表示

### メッセージ投稿関係
* 各ゴルフ場の掲示板へのメッセージ投稿(非同期通信)
* メッセージ削除機能(非同期通信)
* 各メッセージへのいいね機能(非同期通信)
* いいねしたユーザー一覧表示機能
* 画像投稿機能(carrierwave、非同期通信)

### ゴルフスコア関係
* スコア入力、集計機能
* リーダーボード機能（同一プレー日、同一ゴルフ場でのスコアランキング表示）
* スコア非公開機能
* プレイ終了後スコア編集機能
* スコア解析機能（期間絞り込み機能）

### ゴルフ場情報関係
* 楽天GORAゴルフ場検索API (version:2017-06-23より取得)
* ゴルフ場キーワード検索機能(日本全国全てのゴルフ場)
* gem  wheneverによる週一回の自動更新機能

### その他
* レスポンシブ対応
* テスト（20 examples）

## 使用技術

### フロントエンド
* html
* Sass
* JavaScript（ES6、一部jQuery）
* bootstrap

### バックエンド
* Ruby 2.6.6
* Rails 6.0.3.5

### データベース
* MySQL2 8.0.23

### テスト
* RSpec3.9
* FactoryBot 4.11

### 開発環境
* Docker
* RuboCop 1.10.0
* bullet 6.1.3

### 本番環境
* AWS(VPC、EC2、S3、Route53、IAM)
* Nginx、Unicorn
* Capistrono 3.15.0

### その他
* 

## データベース
![er](https://user-images.githubusercontent.com/69664323/109645709-8f0b6200-7b9a-11eb-91e7-db2a45f49f95.png)
