Steps followed to create this project:

First create a brand new Rails project

```shell
rails new devise_example -D postgres && cd devise_example
rake db:create
rake db:migrate
```

Scaffold a product model, and set root to `products#index`.

```shell
rails generate scaffold product title:string description:text
```