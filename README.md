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

### Making a Model
10. Generate a model using `ruby bin/rails generate model Article title:string body:text`.

11. Use the rails console to create a new article.

12. Update article view to show a list of titles of all articles.

### CRUD (Create, Read, Update, Delete)
13. Add a new route to view a single article using `get "/articles/:id", to "articles#show`

14. Add show action to articles controller.

15. Add show view to `app/views/articles/`.

16. Update the routing to use the rails `resources` method.

17. Check which routes this has added by running `ruby cin/rails routes`.

18. Tidy up links in view using `article_path`.

    `href="/articles/<%= article.id %>"` will become `href="<%= article_path(article) %>"`

19. Tidy up even further using `link_to`.

## Notes
> In the development environment, Rails does not generally require you to restart the server; changes you make in files will be automatically picked up by the server.

- Routes map an incoming HTTP request to a specific controller action.

-  When an action does not explicitly render a view (or otherwise trigger an HTTP response), Rails will automatically render a view that matches the name of the controller and action.

> Application classes and modules are available everywhere, you do not need and should not load anything under app with require.