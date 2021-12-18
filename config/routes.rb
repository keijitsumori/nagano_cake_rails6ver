Rails.application.routes.draw do
  devise_for :admin, skip: [:passwords,:registrations], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

end
