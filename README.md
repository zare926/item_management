# Shoes_Management
靴を長持ちさせるためのアプリ

## Description
靴は履いてから中2日間休息させることで、長持ちさせられます。
靴の休息日を忘れず管理できます。
天気予報を確認し、その日に最適の靴を選べます。
登録しているユーザーの所持している靴を見れます。
どの靴をはいたか確認ができます。


## Features
  - haml/SASS記法と、命名規則BEMを使ったマークアップ
  - ウィザード形式を用いたユーザー登録フォーム
  - capistranoによるAWS EC2への自動デプロイ
  - AWS S3への画像アップロード
  - OpenWeatherMapをAPIとして使用
  - RSpecで単体テスト
  - お気に入り機能実装
  - コメント機能実装、絵文字も利用可能

## Contributors
  - https://github.com/zare926

## ER図

## URL：http://54.178.124.177/users/sign_in
Basic認証をかけているため、以下のID/PASSを入力してください。

### ID/PASS
- ID：admin
- PASS：3333

## テストアカウント
- メール：hogehoge@gmail.com
- パスワード：hogehoge

## 制作背景
たくさん靴を所持していると何日前に何を履いたか忘れてしまう時があり、しっかりと休息をさせられず同じ靴を履いてしまうことがありました。
このアプリに所持している靴を登録すれば、現在使用可能な靴と休息中の靴を分けることができます。
靴を使用するボタンを押すと使用した靴は休息エリアに入り、休息中の靴は時間が経過すれば使用可能なエリアに移ります。
また、個人的な理由ですが、内廊下の集合住宅に住んでいるので、雨の日に晴れている時にしか履かない靴を履いてしまい、エントランスを出て雨に気づき部屋に戻ることも多々あり、時間を無駄にしてしまうため、靴を選ぶ際に天気を確認できるようにしました。

## GIF
https://gyazo.com/c7afd97a002a96222af218788238772e

## 実装予定
  - Dockerの使用
  - Twitterカードの使用（adidas,NIKEなどシューズメーカーのツイート？）
  - 独自ドメイン
  - CircleCI
  - 

## 工夫したポイント
メイン機能は1ページで完結できるようにしました。

## 使用技術
  - 言語・フレームワーク等：HTML(Haml)/CSS(scss)/Ruby/Ruby on Rails/JavaScript/jQuery/MySQL/Github/AWS/Visual Studio Code/API
  - タスク管理：Trello

## DB設計

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|mysize|integer|
|iconimage|text|

#### association
  - has_many :items
  - has_many :comments

### itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|status|integer|default: 0|
|image|text|null: false|
|size|string|
|limit|integer|default: 4320|
|text|string|
|user_id|integer|null: false|
|favorite|integer|default: 0|
|brand|string|

#### association
  - belongs_to :user
  - has_many :comments


### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|
|user_id|integer|
|item_id|integer|

#### association
  - belongs_to :user
  - belongs_to :item