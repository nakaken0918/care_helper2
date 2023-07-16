# README

## users table
| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| name                | string  | null: false               |
| email               | string  | null: false               |
| encrypted_password  | string  | null: false               |
### Association
- has_many :profiles
- has_many :records

## profiles table
| Column              | Type        | Options                         |
| ------------------- | ----------- | ------------------------------- |
| patient             | string      | null: false                     |
| barth               | date        | null: false                     |
| gender_id           | integer     | null: false                     |
| blood_type          | string      | null: false                     |
| family              | string      | null: false                     |
| history             | text        | null: false                     |
| disease             | text        | null: false                     |
| medications         | text        | null: false                     |
| user_id             | integer     | null: false                     |
### Association
- belongs_to :user
- has_many :contacts
- has_many :records
- has_one_attached :image

## contacts table
| Column              | Type        | Options                         |
| ------------------- | ----------- | ------------------------------- |
| person              | string      | null: false                     |
| relationship        | string      | null: false                     |
| address             | string      | null: false                     |
| email               | string      | null: false                     |
| phone               | string      | null: false                     |
| patient_id          | integer     | null: false                     |
| profile             | references  | null: false, foreign_key: true  |
### Association
- belongs_to :profile

## records table
| Column              | Type        | Options                         |
| ------------------- | ----------- | ------------------------------- |
| date                | date        | null: false                     |
| text                | text        | null: false                     |
| category            | integer     | null: false                     |
| user_id             | integer     | null: false                     |
| profile_id          | references  | null: false, foreign_key: true  |
### Association
- belongs_to :user
- belongs_to :profile
