# README

This is to document my first time using Ruby on Rails. I started by following the official guide:
https://guides.rubyonrails.org/getting_started.html

After setting up the ability to create, read, update and delete articles, I decided to deviate from the guide and add some styling to my app.

Run using `bin/dev` in WSL console.



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

### Displaying articles
13. Add a new route to view a single article using `get "/articles/:id", to "articles#show`

14. Add show action to articles controller.

15. Add show view to `app/views/articles/`.

16. Update the routing to use the rails `resources` method.

17. Check which routes this has added by running `ruby cin/rails routes`.

18. Tidy up links in view using `article_path`.

    `href="/articles/<%= article.id %>"` will become `href="<%= article_path(article) %>"`

19. Tidy up even further using `link_to`.

### Creating new articles
20. Add `new` and `create` actions to articles controller.

21. Create `new` view using the rails form builder.

22. Use strong parameters to specify which parameters can be saved or updated.

23. Add validation to the article model.

24. Add error messages from validation to the form.

### Updating existing articles
25. Add actions in article controller for edit and update.

26. Refactor new article form into generic article form partial which can then be used for new and edit views.

27. Link to edit view from show view.

28. Add destroy action to controller.

29. Link the destroy action to the show view using Turbo attributes to create a confirmation dialog and a DELETE request.

## Notes
> In the development environment, Rails does not generally require you to restart the server; changes you make in files will be automatically picked up by the server.

- Routes map an incoming HTTP request to a specific controller action.

-  When an action does not explicitly render a view (or otherwise trigger an HTTP response), Rails will automatically render a view that matches the name of the controller and action.

> Application classes and modules are available everywhere, you do not need and should not load anything under app with require.

>  partials are named with a leading underscore to distinguish them from regular views, even though they are referred to without the underscore.
