Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/answer', to: 'fortunes#answer'

    post '/event', to: 'fortunes#event'

    post '/dtmf', to: 'fortunes#dtmf'

    post '/caller_input', to: 'fortunes#caller_input'

    post '/event', to: 'fortunes#event'
end
