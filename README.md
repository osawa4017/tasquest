# Design of DataBase

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
|classification_id|integer   |null: false                   |
|point            |integer   |null: false                   |
|deadline         |datetime  |null: false                   |
|is_complete      |boolean   |null: false, default: false   |

### Association
belongs_to :user
