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