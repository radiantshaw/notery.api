Rails.application.config.middleware.use(Rack::Parser, parsers: {
  'application/json' => proc { |data| JSON.parse(data) }
})
