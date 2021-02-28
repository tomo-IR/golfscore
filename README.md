# README

# SOLOGOL
SOLOGOL (ソロゴル)とは、お一人様ゴルフでも、寂しい思いをすることなく、楽しくゴルフをプレーすることをサポートするアプリです。

## URL
[sologol.work](https://sologol.work/)

## 制作に至った背景
現在のコロナ禍において、ゴルフ業界は外出自粛によって経営的に大打撃を受けています。
そんなゴルフ業界の打開策として、３密を生まない「お一人様ゴルフ」なるものを始めるゴルフ場も増えてきています。
ただ、ゴルフは気の合う仲間と複数人でプレーするのが楽しいものです。なかなか1人でラウンドしようとは思わないという方も多いかと思います。
ゴルフを愛する者としては、このままゴルフ場が減ってしまうことはとても悲しいことです。少しでもお一人様ゴルフをする方が増えて、
ゴルフ業界にとっての危機的状況からの脱却への一助となればと思い、制作に至りました。

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
