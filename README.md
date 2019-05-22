[![ruby version](https://img.shields.io/badge/Ruby-v2.5.5-green.svg)](https://www.ruby-lang.org/ja/)
[![rails version](https://img.shields.io/badge/Rails-v5.2.3-brightgreen.svg)](http://rubyonrails.org/)
[![CircleCI](https://circleci.com/gh/3isawa/Libnode.svg?style=svg)](https://circleci.com/gh/3isawa/Libnode)
# README

## アプリ名: Libnode
## URL: http://libnode.net
**動作確認用アカウント**  
本アプリケーションはGoogleアカウントを使用してログインする想定で作成しております。  
テスト用に管理者権限を付与したアカウントをご用意しましたので、
こちらのアカウントをご利用下さい。  
- メールアドレス: 3isawa.libnode[**at mark**]gmail.com  
- パスワード: thisismysecretpasswordthatisverysecure  
**動作確認済み環境**
- GoogleChrome(バージョン: 74.0.3729.131)

## アプリ概要
とあるプログラミングスクールやIT企業に社内ツールとして置かれる事を想定した、  
技術書などの蔵書を管理・運用する主にRuby on Railsで作成したオリジナルアプリケーションです。  
自席から立ち上がらずとも目的の技術書があるかを簡単に調べる  ことができます。  
貸出状況を管理することで返し忘れの防止や目的の本の在架情報の確認が可能になります。

<img src="https://i.gyazo.com/df003ac546e356cc340c7c9f1e1353b5.png" width="400px">

## 機能および使用した技術

- Googleアカウントを利用したログイン  
  - **devise**、**omniauth**を使用。
- 書籍の貸出・返却
  - **jsQR**ライブラリを用いることで、WEBカメラからQRコード読み取りが可能。
    - ※現在デプロイ先がhttps可していないことに関連して機能をお試し頂くことができません(現在https化対応中です)
    - テスト用QRコード(以下の様なQRコードを各書籍の裏側に貼り付ける事を想定しております)  
    半角数字で123456789という値をQRコードに変換しました。  
    (当該アプリケーションでは半角数字以外読み取り不可にしています)  
    https://i.gyazo.com/5833aeaa8889e1c61443189babf24c3b.png
  - **Action Mailer**と**whenever**を組み合わて、  
    1日に1度、書籍の返却期限が過ぎているユーザーに督促メールを送信。
- 書籍の登録
  - ISBN番号をもとに、メタ情報を自動で取得。
    - Rakuten Developersページで提供されている**楽天ブックス書籍検索API**を使用し、  
    ISBN番号のみを入力することで、書籍タイトルや著者情報などを自動的に入力可能。
  - CSVファイルからの一括インポート
    - **activerecord-import**を使用し、CSVファイルからの入力を実現。  
    CSVデータにもバリデーションを行い、全てのレコードがそれをパスした時のみDBに登録。
    - テスト用正規CSV https://drive.google.com/open?id=1eZZVb-HM5F1yyW5Js_-70_MlyLBhPF1s
    - テスト用不正(必須項目が欠落)CSV https://drive.google.com/open?id=1hGESGUZ2WLj9G0G_GrDu3KeJQnYxVLwi
- 書籍の検索
  - **ransack**を用いて機能を実現。
- 書籍へのいいね機能
  - **Ajax**を利用したいいね機能。直近にいいねした3人のプロフィール写真も表示。
- 貸出数、いいね数によるランキング  
  - **Chart.js**を使用して、情報を視覚的にわかりやすい形で図示。
- トレンド技術書の表示機能
  - 管理者に対して購入リクエストを送信  
    - トレンド技術書はAmazonのコンピュータサイエンスに関する本のランキングから  
    1時間に1回**スクレイピング**。トレンド技術書を基にユーザーがLibnode管理者に対して書籍購入リクエストを  出すことが可能。
- チュートリアル機能
  - **Intro.js**を使用したチュートリアルを作成。
  - **jquery.cookie.js**でcookieを扱い、初回ログイン時は自動的にチュートリアルを開始。
- CIを実践  
  - **CircleCIで**上で**rubocop**や**breakman**、**RSpec**でソースコードを解析。 
    - RSpecでは単体テスト及び統合テストを実施。

## 他に使用した技術
- フロントエンド
  - Slim
  - Scss
  - Bootstrap
  - jQuery
- サーバーサイド
  - Ruby version:2.5.5
  - Ruby on Rails version:5.2.3  
    - active model serializersを用いたJSON作成など
- データベース
  - PostgreSQL  
    - 一部uuidを用いたid管理
- インフラ
  - AWS EC2  
    - 独自ドメインにも対応
  - AWS S3
    - 画像クラウドストレージ
  - Nginx
  - Unicorn

## ER図
<img src="https://i.gyazo.com/e0b00b60938b7fef6c0b63d2bbf55bb2.png" width="600px">
