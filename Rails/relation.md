## 多対多関連の実装方法
### 1.テーブルの作成
それぞれのテーブルを普通に作成し、最後に中間テーブルに両方のテーブルの外部キーを定義して作成します。
Categoryモデルとcategoriesテーブルの作成します。

```sh
rails g model Category name:string
rake db:migrate
```

Productモデルとproductsテーブルの作成します。

```
rails g model Product name:string price:integer
rake db:migrate
```

`has_many`の場合、CategoryProductモデルとcategories_productsテーブルの作成します。

```
rails g model CategoryProduct category_id:integer product_id:integer
rake db:migrate
```

`has_and_belongs_to_many`の場合、categories_productsテーブルを作成します。

```
rails g migration create_categories_products category_id:integer product_id:integer
rake db:migrate
```
### 2. モデルに関連を定義する
各モデルファイルに多対多関連の宣言を追加します。
#### has_manyの場合

```ruby
# app/models/category.rb
class Category < ActiveRecord::Base
  has_many :category_products
  has_many :products, through: :category_products

  # throughオプションによりcategory_products経由でproductsにアクセスできるようになる
  # 具体的には、category.productsで商品にアクセスができる
end
```
```ruby
# app/models/category_product.rb
class CategoryProduct < ActiveRecord::Base
  belongs_to :category
  belongs_to :product
end
```
```ruby
# app/models/product.rb
class Product < ActiveRecord::Base
  has_many :category_products
  has_many :categories, through: :category_products

  # throughオプションによりcategory_products経由でcategoriesにアクセスできるようになる
  # 具体的には、product.categoriesでカテゴリにアクセスができる
end
```
has_manyメソッドには次のようなオプションを指定できます。

* class_nameオプションで関連するモデルのクラス名を指定でき、関連名と参照先のクラス名を異なるものにできできる。
* foreign_keyオプションで参照先を参照する外部キーの名前を指定できる。デフォルトは、参照先のモデル名_id
* dependentオプションで親オブジェクトが削除された時の扱いを指定できる。destroyとdelete_allなどが指定可能。
* asオプションでポリモフィック関連を定義できる。
* throughオプションでモデル接続の関連を設定できる。
など


#### has_and_belongs_to_manyの場合
```ruby
# app/models/category.rb
class Category < ActiveRecord::Base
  has_and_belongs_to_many :products
end
```
```ruby
# app/models/product.rb
class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
end
```
### 使えるようになるメソッド
これらを追加することで自動的に次のようなメソッドが使えるようになります。
#### has_manyの場合

```ruby
# 作成
category1 = Category.create(name: "カテゴリ1") # category単体で作成
product1 = Product.create(name: "商品1", price: 1000) # product単体で作成

category1.products.create(name: "商品2", price: 200) # category1に関係したproductを作成

# リレーション
category1.products.count # => 1
category1.products << product1 # product1をcategory1に関連させた
category1.products.count # => 2

product1.categories # => product1に関連しているcategoryの配列

# 中間テーブル
CategoryProduct.all # category_productsの全てのレコードを取得
# CategoryProductモデルが存在するため、中間テーブルのバリデーションや属性の追加などができる
```

#### has_and_belongs_to_manyの場合
```ruby
# 作成
category1 = Category.create(name: "カテゴリ1") # category単体で作成
product1 = Product.create(name: "商品1", price: 1000) # product単体で作成

category1.products.create(name: "商品2", price: 200) # category1に関係したproductを作成


# リレーション
category1.products.count # => 1
category1.products << product1 # product1をcategory1に関連させた
category1.products.count # => 2

product1.categories # => product1に関連しているcategoryの配列
```

## 参考サイト
* [20141204
Rails4で多対多のリレーションをモデルに実装する](http://ruby-rails.hatenadiary.com/entry/20141204/1417688260)