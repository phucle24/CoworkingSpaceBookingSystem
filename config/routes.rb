Rails.application.routes.draw do
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
  scope "(:locale)", locale: /en|vi/ do
  end
end
