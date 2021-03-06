## users

|Column             |Type  |Options    |
|-------------------|------|-----------|
|surname            |string|null: false|
|name               |string|null: false|
|surname_furigana   |string|null: false|
|name_furigana      |string|null: false|
|nickname           |string|null: false|
|email              |string|null: false|
|encrypted_password |string|null: false|
|birthday           |date  |null: false|

### Association
has_many :items
has_many :buy_records

## items

|Column               | Type       |Options                         |
|----------------------|-----------|--------------------------------|
|name                  |string     |null: false                     |
|explanation           |text       |null: false                     |
|category_id           |integer    |null: false                     |
|status_id             |integer    |null: false                     |
|shipping_fee_burden_id|integer    |null: false                     |
|prefecture_id         |integer    |null: false                     |
|days_to_ship_id       |integer    |null: false                     |
|price                 |integer    |null: false                     |
|user                  |references |null: false, foreign_key: true  |



### Association
has_one :buy_record
belongs_to :user

## buy_records

|Column|Type       |Options                        |
|------|-----------|-------------------------------|
|user  |references |null: false, foreign_key: true |
|item  |references |null: false, foreign_key: true |


### Association
has_one :street_add
belongs_to :user
belongs_to :item

## street_add

|Column       |Type         |Options                         |
|-------------|-------------|--------------------------------|
|postal_cord  |string       |null: false                     |
|prefecture_id|integer      |null: false                     |
|municipality |string       |null: false                     |
|address      |string       |null: false                     |
|buildingname |string       ||
|phone_number |string       |null: false                     |
|buy_record   |references   |null: false, foreign_key: true  |


### Association
belongs_to :buy_record

