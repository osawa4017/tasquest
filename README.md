# アプリケーション名
tasquest

# キャッチコピー
現実世界のタスクを管理しながら最強の勇者を育成しよう！

# 製作背景
- スケジュール帳やふせんを使ってやるべきことを管理しているがいつまでにやるべきかが見えにくい
- タスクをこなすとポイントがもらえて勇者が強くなればタスク管理が楽しくなるのでは？

# アプリ開発を通して学ぶこと
- APIを使ってGoogleカレンダーと連携する
- APIを使ってスプレッドシートでガントチャートを吐き出す
- gem wheneverを使って毎日決まった時間にDBを更新させる
- そのほかにも思いついたことがあればどんどん実装してみる！

# URL
http://52.194.69.16/

## テスト用アカウント
- Email: test@gmail.com
- Password: testtest

このメールアドレスはこのアプリケーションにログインするための架空のものです

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
- ルーティンの作成編集削除機能
- ルーティンタスクの自動更新機能(登録したルーティンが毎日DBに自動で追加される)

## 今後実装していく内容
- 勇者のステータス割り振り
- 勇者の装備
- 勇者を敵と戦わせるバトル機能
- 登録したタスクをGoogleカレンダーに反映する
- 直近のタスクのガントチャートをスプレッドシートで出力する

# データベース設計

## ER図
![01_erd_tasquest](https://user-images.githubusercontent.com/64793100/92329734-80893580-f0a4-11ea-91c1-efbee50ff3e2.png)

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
- has_many :tasks
- has_many :routines
- has_one  :status

## tasksテーブル
|Column           |Type      |Options                       |
|-----------------|----------|------------------------------|
|user             |references|null: false, foreign_key: true|
|content          |string    |null: false                   |
|classification_id|integer   |null: false                   |
|point            |integer   |null: false                   |
|deadline         |datetime  |null: false                   |
|is_complete      |boolean   |null: false, default: false   |

### Association
- belongs_to :user

## routinesテーブル
|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|user       |references|null: false, foreign_key: true|
|content    |string    |null: false                   |

### Association
belongs_to :user

## statusesテーブル
|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|heart  |integer   |null: false                   |
|attack |integer   |null: false                   |
|defense|integer   |null: false                   |

### Association
- belongs_to :user
