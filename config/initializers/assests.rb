%w( analyses static_pages ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js.coffee", "#{controller}.css"]
end