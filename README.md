# アプリケーション名
tasquest

# キャッチコピー
現実世界のタスクを管理しながら最強の勇者を育成しよう！

# 製作背景
- スケジュール帳やふせんを使ってやるべきことを管理しているがいつまでにやるべきかが見えにくい
- タスクをこなせばポイントがもらえて勇者が強くなればタスク管理が楽しくなるのでは？

# アプリ開発を通して学ぶこと
- APIを使ってGoogleカレンダーと連携する
- APIを使ってスプレッドシートでガントチャートを吐き出す
- gem wheneverを使って毎日決まった時間にDBを更新させる
- そのほかにも思いついたことがあればどんどん実装してみる！

# URL
http://52.194.69.16/

# 開発環境
- Ruby (ver.2.5.1)
- Ruby on Rails (ver.5.0.7.2)
- MySQL (ver.14.14)
- unicorn
- Nginx
- capistrano
- haml
- sass
- git (ver.2.26.2)
- github
- AWS(EC2)

# 機能

## 実装済み
- ユーザ登録機能
- ToDoタスクの追加編集削除機能
- ToDOタスクの一覧表示機能(ransackによる検索可)

## 今後実装していく内容
- ルーティンタスクの作成編集削除機能
- ルーティンタスクの自動更新機能(登録した内容が毎日DBに自動で追加される)
- 勇者のステータス割り振り
- 勇者の装備
- 勇者を敵と戦わせるバトル機能
- 登録したタスクをGoogleカレンダーに反映する
- 直近のタスクのガントチャートをスプレッドシートで出力する

# データベース設計

## ER図
あとで作成する

## usersテーブル
|Column                |Type    |Options                                            |
|----------------------|--------|---------------------------------------------------|
|nickname              |string  |null: false, default: "", limit: 10                |
|email                 |string  |null: false, default: "", index: true, unique: true|
|encrypted_password    |string  |null: false, default: ""                           |
|reset_password_token  |string  |index: true, unique: true                          |
|reset_password_sent_at|datetime|                                                   |
|remember_created_at   |datetime|                                                   |

### Association
has_many :tasks

## tasksテーブル
|Column           |Type      |Options                       |
|-----------------|----------|------------------------------|
|user             |references|null: false, foreign_key: true|
|content          |string    |null: false                   |
|point            |integer   |null: false                   |
|deadline         |datetime  |null: false                   |
|is_complete      |boolean   |null: false, default: false   |

### Association
belongs_to :user
