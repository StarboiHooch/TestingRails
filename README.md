# README

This is to document my first time using Ruby on Rails. I am following the official guide:
https://guides.rubyonrails.org/getting_started.html

## Guide contents summary

### Setup
1. Install Ruby and SQLite3
2. Install Rails using `gem install rails`
3. Create basic app template using `rails new blog`
4. Start web server locally using `ruby bin/rails server`

### Creating a new view
5. Create new route in `config/routes.rb` with:
    ```ruby
    get "/articles", to: "articles#index"
    ```
6. Create the controller using `ruby bin/rails generate controller Articles index --skip-routes`.

    This creates several files, including `app/controller/articles_controller.rb` which contains the index action.

7. Replace auto-generated content of `app/views/articles/index.html.erb` with:

    ```html
    <h1>Hello, Rails!</h1>
    ```
8. Save and visit /articles to see the new view!
9. Set the new view as the homepage by adding `root "articles#index"` to the top of `config/routes.rb`.


## Notes
> In the development environment, Rails does not generally require you to restart the server; changes you make in files will be automatically picked up by the server.

- Routes map an incoming HTTP request to a specific controller action.

-  When an action does not explicitly render a view (or otherwise trigger an HTTP response), Rails will automatically render a view that matches the name of the controller and action.