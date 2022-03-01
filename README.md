# アプリ名
Travelands

## サイト概要
旅行先で撮影した写真の共有、相互評価サイト

### サイトテーマ
旅行先の楽しかった体験をシェア、評価を見て旅行先を決められるサイト。
旅行先で最高の体験をして、その興奮をぶつけられる。そんなサイトを目指します。

### テーマを選んだ理由
旅行先を検索する時、多くの場合は旅行会社のサイトを見ることになります。
しかしこの場合、ツアーの紹介ばかりが表示されてしまい、個人の評価を含めた情報を探すのは大変です。
特に海外旅行は個人の評価が見つけにくく、情報もあまり多くありません。
ガイド本やツアー内容にも記載されていない"隠れたおすすめポイント"も、このサイトを通じて紹介し合えます。
不安の多い海外旅行でも、個人の評価を見てから行き先を決めることで安心して旅行ができると考えました。

#主な機能
旅行先の写真にコメントを付けて投稿できる機能(gem: :ActiveStorage)
コメント時に、自身の評価を付けられる機能(JS: raty.js)
他の利用者がその投稿を評価する機能
評価の高い投稿をソートできる機能
タグ検索機能(gem: acts-as-taggable-on)

#その他
権限管理機能(gem: cancancan)
環境変数化(gem: dotenv-rails)
マップ機能(google API)

### ターゲットユーザ
旅行先を決める時に悩んでいる方
ツアーではなく、自身でスケジュールや行き先を決定したい方
自分の知っている"おすすめポイント"を共有したい方

### 主な利用シーン
"旅行に行きたいけど、他人の経験を参考に決めたいな"という時や、
"行きたい場所は決まっているけど、他にいい所はあるかな？"と思った時に利用できます。
他にも、"自分が住んでいる所のおすすめの場所を紹介したい"という人や、
"みんなが知らないベストプレイスを自慢したい"という方にも。

## 設計書
<>

## チャレンジ要素一覧
<https://docs.google.com/spreadsheets/d/1uBs6aF5u2kMA59FSB6smA0Kzuo6Wlpric0-9QPXzE4E/edit#gid=0>

## 開発環境
- OS：Windows 10
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery,JavaScript
- IDE：Cloud9

## 使用素材
- 外部サービスの画像素材・音声素材を使用した場合は、必ずサービス名とURLを明記してください。
- 使用しない場合は、使用素材の項目をREADMEから削除してください。