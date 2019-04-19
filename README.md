# README

## アプリ名: Libnode

## 概要
とあるプログラミングスクールやIT企業に社内ツールとして置かれる事を想定した、
技術書の管理・運用を支援するアプリケーションです。
自席から立ち上がらずとも目的の技術書があるかを簡単に調べる  ことができます。
貸出状況を管理することで返し忘れの防止や目的の本の在架情報の確認が可能になります。

## コンセプト
技術書を探す時間を無くし、その時間を技術をインプットする時間に回す。
スクール内(社内)の技術書を最大限活用する。

## バージョン
Ruby: 2.5.5
Rails: 5.2.3

## 機能一覧
- [ ] Googleアカウントを利用したログイン
- [ ] 書籍の貸出・返却
  - [ ] WEBカメラを利用したQRコード読み取り
  - [ ] 返却期限をメールでお知らせ
- [ ] 本の登録
  - [ ] ISBN番号をもとに、メタ情報を自動で取得
  - [ ] CSVファイルからの一括インポート
- [ ] ランキング
  - [ ] 貸出数によるランキング
  - [ ] お気に入り登録数によるランキング
- [ ] トレンドの技術書を表示
  - [ ] 管理者に対して購入リクエストを送信

## カタログ設計
https://docs.google.com/spreadsheets/d/1QziJiyCQ4xfVbiI1v1PZRJhEaKxkX9gLa7W4QbSxm5k/edit?usp=sharing

## テーブル設計
https://docs.google.com/spreadsheets/d/1F98cjpPIuXCuXT0U9IK1lEibMMp5sC4fGQvDOVMpA_k/edit?usp=sharing

## 画面ワイヤーフレーム
https://xd.adobe.com/view/2f831c81-5be2-4dd6-6508-d61386d92ce0-59b2/

## 使用予定gem
- dotenv-rails
- breakman
- sidekiq
- devise
- omniauth
- fog-aws
- chart-js-rails
- carrierwave
- minimagic
- mechanize
- ransack
- gon
