TrafikskolaApp::Application.routes.draw do
	
  resources :schools, :path => "trafikskola" do
    member do 
      put 'submit'
    end
    resources :reviews
  end    
  root to: 'static_pages#home'

  match 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcement'

  # faceboook omniauth login/signout
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'auth/signout', to: 'sessions#destroy', as: 'signout'
end
