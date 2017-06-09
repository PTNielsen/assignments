Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blog_posts#index'
  
  # BlogPost routes
  get '/blogs',      to: 'blog_posts#index', as: 'blog_posts'
  get '/blog/:slug', to: 'blog_posts#show',  as: 'blog_post'
end
