## users

|Column   |Type  |Options    |
|---------|------|-----------|
|nickname |string|null: false|
|email    |string|null: false|
|password |string|null: false|
|birthday |string|null: false|

### Association
has_many :items
has_many :buy_records

## items

|Column    |Type  |Options    |
|----------|----  |-----------|
|item_name |string|null: false|
|category  |string|null: false|
|price     |string|null: false|
|seller    |string|null: false|


### Association
has_one :buy_record

## buy_records

|Column|Type      |Options                       |
|------|----------|------------------------------|
|when  |references|null: false, foreign_key: true|
|who   |references|null: false, foreign_key: true|
|Which |references|null: false, foreign_key: true|


### Association
has_one :street_add
belongs_to :user
belongs_to :item

## street_add

|Column       |Type       |Options                       |
|-------------|-----------|------------------------------|
|postal cord  |references |null: false, foreign_key: true|
|prefectures  |references |null: false, foreign_key: true|
|municipality |references |null: false, foreign_key: true|
|address      |references |null: false, foreign_key: true|
|buildingname |references |null: false, foreign_key: true|
|phone number |references |null: false, foreign_key: true|


### Association
belongs_to :buy_record