## users

|Column             |Type  |Options    |
|-------------------|------|-----------|
|nickname           |string|null: false|
|email              |string|null: false|
|encrypted_password |string|null: false|
|birthday           |date  |null: false|

### Association
has_many :items
has_many :buy_records

## items

|Column          |Type  |Options    |
|----------      |----  |-----------|
|surname         |string|null: false|
|name            |string|null: false|
|surname_furigana|string|null: false|
|name_furigana   |string|null: false|
|category        |string|null: false|
|price           |integer|null: false|
|seller          |string|null: false|
|users_id        |string|null: false|

### Association
has_one :buy_record
belongs_to :user

## buy_records

|Column          |Type      |Options    |
|------          |----------|-----------|
|users_id        |string    |null: false|
|items_id        |string    |null: false|


### Association
has_one :street_add
belongs_to :user
belongs_to :item

## street_add

|Column       |Type       |Options                       |
|-------------|-----------|------------------------------|
|postal cord  |numeric    |null: false, foreign_key: true|
|prefectures  |string     |null: false, foreign_key: true|
|municipality |string     |null: false, foreign_key: true|
|address      |string     |null: false, foreign_key: true|
|buildingname |string     |null: false, foreign_key: true|
|phone number |numeric    |null: false, foreign_key: true|


### Association
belongs_to :buy_record