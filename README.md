アプリケーション名：　original　calendar

アプリケーション概要	通常カレンダーのように予定の登録・表示、ToDoリストの作成、その日を振り返る意味での日記を残す事ができる

利用方法	
目指した課題解決	

洗い出した要件	  カレンダー機能
              日記機能
              Todo
              
実装した機能についてのGIFと説明	

[![Image from Gyazo](https://i.gyazo.com/681073d2be4c6be07eb653a9102ded0d.png)](https://gyazo.com/681073d2be4c6be07eb653a9102ded0d)

トップページはこのように直近３日間の予定と期限の近い順でToDoが表示されます


[![Image from Gyazo](https://i.gyazo.com/95b83210be6929793e59c7b37f399a38.png)](https://gyazo.com/95b83210be6929793e59c7b37f399a38)

予定を保存するページに関しては上に間近の予定５件を表示し、カレンダーの中には予定が表示されるようになっており、したに表示されているフォームから直接保存できるようになっています


[![Image from Gyazo](https://i.gyazo.com/4c39162483cce235ed7c649476269344.png)](https://gyazo.com/4c39162483cce235ed7c649476269344)

日記機能に関しても同様にカレンダーに表示され、したのフォームから保存されます。
カレンダーに表示されているタイトルをクリックすると詳細を見ることもできます。



データベース設計	
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


ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。
