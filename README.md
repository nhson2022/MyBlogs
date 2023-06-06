# MyBlogs

## Create new project
```bash
rails new MyBlogs
```
## Run app
```bash
rails s
rails start
```
## Create model About
```bash
rails g model About ten:string dia_chi:string dien_thoai:string tieu_su:text nam_sinh:integer
rails db:migrate
```
## Create seeds.rb
```rb
About.create(nam_sinh: 1985, ten: "Ruby Dev", dia_chi: "Vinh Long", dien_thoai: "0389141150",tieu_su: "")
```
## Run seed
```bash
rails db:seed
```
## Create controller pages about
```bash
rails g controller pages about
```
## Update routes.rb
```rb
Rails.application.routes.draw do
    get '/about' => 'pages#about', as: :pages_about
end
```
## Create controller home
```rb
class PagesController < ApplicationController
  ...
  def home
  end
end
```
## Update routes.rb
```rb
root "pages#home"
```
## Style Bootstrap
```Gemfile
gem 'sassc-rails'
gem 'bootstrap', '~>5.3.0.alpha3'
gem 'jquery-rails'
```
**Call bundle when update Gemfile**
```bash
bundle install
```
**Rename to app/assets/stylesheets/application.scss and add command**
```scss
@import "bootstrap";
```
**Re-run app (Ctrl+C to Stop)**
```bash
rails s
```
**Add library js**
```bash
./bin/importmap pin bootstrap jquery
```
**Config javascript/application.js**
```js
import jQuery from 'jquery'
window.$ = jQuery
```
**Check jQuery by on Inspect/Console**
```
Right-click and choose Inspect/Console, type $().jquery
```
## Style for Homepage
```
Use Bootstrap/Examples
Open index.html, copy code for header -> menu
Don't use fixed-top 
```
## Partial layouts/_header.html.erb
```html
<header data-bs-theme="dark">
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">My Blogs</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="<%= root_path %>">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Articles</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Category</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="<%= pages_about_path %>">About</a>
					</li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
</header>
```
## Create Category by scaffold
```bash
rails g scaffold Category ten mo_ta:text
```
## Create Articles by scaffold
```bash
rails g scaffold Article ten noi_dung:text trang_thai:boolean category:references
```
**Update model article.rb**
```rb
belongs_to :category, optional: true
```
**Update model category.rb**
```rb
has_many :articles
```
**Update migration for db/migrate/20230605135510_create_articles.rb**
```rb
t.references :category, null: true, foreign_key: true
# category for one article can be empty
```
**Update routes.rb**
```rb
Rails.application.routes.draw do
  root "pages#home"
  resources :articles
  resources :categories

  get "/about" => "pages#about", as: :pages_about
end
# Thu tu uu tien tu tren xuong duoi
```
**Update header use href of routes.rb**
```rb
	<li class="nav-item">
		<a class="nav-link" href="<%= articles_path %>">Articles</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%= categories_path %>">Category</a>
	</li>
```
## Create footer
**app/views/layouts/application.html.erb**
```rb
<div class="mt-2">
	<%= render 'layouts/footer' %>
</div>
```
**app/views/layouts/_footer.html.erb**
```rb
<footer class="py-5 text-center text-body-secondary bg-body-tertiary">
  <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
  <p class="mb-0">
    <a href="#">Back to top</a>
  </p>
</footer>
```
## Style for Category and Articles by Bootstrap

