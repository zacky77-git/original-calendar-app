# README

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |

### Association

- has_many :events
- has_many :diaries
- has_many :tasks



## events テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| start_time      | datetime   | null: false                    |
| end_time        | datetime   | null: false                    |
| location        | text       |                                |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## diaries テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false,                   |
| content    |text        | null: false                    |
| start_time | datetime   | null: false,                   |
| user       | references | null: false, foreign_key: true |
| date       | date       | null: false, unique: true      |

### Association

- belongs_to :user



## tasks テーブル

| Orders       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| description  | text       | null: false                    |
| target_on    | datetime   | null: false                    |
| completed_at | datetime   | null: false                    |
| completed    | boolean    | null: false                    |
| user         | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## monthly_targets テーブル

| Orders  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| date    | date       | null: false                    |

### Association

- belongs_to :user

## weekly_targets テーブル

| Orders   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| date     | date       | null: false                    |

### Association

- belongs_to :user

## daily_targets テーブル

| Orders    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| date      | date       | null: false                    |

### Association

- belongs_to :user

