Rails.application.routes.draw do
  # Built-in health check (already present)
  get "up" => "rails/health#show", as: :rails_health_check

  # Define a simple root path for test verification and uptime monitoring
  root "rails/health#show"
end
