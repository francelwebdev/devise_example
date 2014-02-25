Steps followed to create this project:

## Setup

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

## Devise (Authentication)

Add `gem 'devise'` to your Gemfile, then

```shell
bundle install
rails generate devise:install
# Follow instructions
rails generate devise
rake db:migrate
```

Add "sign in" link in your `application.html.erb` layout:

```erb
<% if user_signed_in? %>
  Logged in as <strong><%= current_user.email %></strong>.
  <%= link_to 'Edit profile', edit_user_registration_path %> |
  <%= link_to "Logout", destroy_user_session_path, method: :delete  %>
<% else %>
  <%= link_to "Sign up", new_user_registration_path %> |
  <%= link_to "Login", new_user_session_path  %>
<% end %>
```

Protect your application controller:

```ruby
before_action :authenticate_user!
```

## Pundit (Authorization)

Add `gem 'pundit'` to your Gemfile, and add it to your `ApplicationController`

```ruby
class ApplicationController < ActionController::Base
  include Pundit
  # ...
end

And setup the default policy:

```shell
rails g pundit:install
```

Now you can add a policy for your product model:

```shell
rails g pundit:policy
```

And add the `authorize` method to the `new`, `create` and `set_product` methods

```rails
authorize @product
```

By default, users can't add / edit / destroy products.