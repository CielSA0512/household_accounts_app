#テーブル設計

## users テーブル

| column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |

### Association

- has_many :spends

## spends テーブル

| column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| day                | date       | null: false |
| spend_id           | integer    | null: false |
| category_id        | integer    | null: false |
| memo               | text       |
| management_id      | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user