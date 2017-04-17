Rails.application.routes.draw do
  resources :trabalhos do
    get 'prazo_encerrado', on: :collection
  end
  resources :minicursos do
    get 'prazo_encerrado', on: :collection
    resources :inscricoes
  end
  namespace :admin do
    resources :participantes do
      get 'credenciar'
      get 'aprovar_nota_empenho'
      get 'avaliar_isencao'
    end
    resources :organizadores
    resources :trabalhos do
      get 'avaliar'
      resources :avaliacoes, controller: 'avaliacoes_trabalhos'
    end
    resources :minicursos do
      resources :avaliacoes, controller: 'avaliacoes_minicursos'
    end
  end

  resources :sessions
  resources :participantes do
    get 'pagar'
  end

  resources :certificados
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'participantes#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  get 'cidades' => 'cidades#index', as: :cidades
  get 'login' => 'sessions#new', as: :login
  get 'logout' => 'sessions#destroy', as: :logout
  get 'admin' => 'admin#index', as: :admin
  get 'participacao' => 'participantes#participacao', as: :participacao
  get 'inscricoes_encerradas' => 'participantes#inscricoes_encerradas', as: :inscricoes_encerradas
  get 'conta' => 'usuarios#conta', as: :conta
  patch 'atualizar' => 'usuarios#atualizar', as: :atualizar_conta
  get 'recuperar_senha' => 'usuarios#recuperar_senha', as: :recuperar_senha
  post 'recuperacao_senha' => 'usuarios#recuperacao_senha', as: :recuperacao_senha
  get 'redefinir_senha' => 'usuarios#redefinir_senha', as: :redefinir_senha
  patch 'atualizar_senha' => 'usuarios#atualizar_senha', as: :atualizar_senha
  get "test_exception_notification" => "application#test_exception_notification"
  post 'pagamentos/:pagamento_id/notificar' => 'pagamentos#notificar', as: :notificar_pagamento
  get 'pagamentos/processando'
  get 'pagamentos/aprovado'
  get 'pagamentos/falhou'
  get 'inscricoes' => 'inscricoes#index', as: :inscricoes
  get 'minicursos/inscricoes/cancelar' => 'inscricoes#cancelar', as: :cancelar_inscricao

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
