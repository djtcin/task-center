Rails.application.config.middleware.use OmniAuth::Builder do
  provider :redu,  'CEg7NoeB11hR0yEcS8jbHVjZrbys3ijDdJkoV6is', 'iSnmYf4Z3PKD6JeuXa3XKoeJ3jKoAT8SOE77qDcb'

  OmniAuth.config.logger = Rails.logger
  on_failure do |env|
    [200, {}, [env['omniauth.error'].inspect]]
  end
end
