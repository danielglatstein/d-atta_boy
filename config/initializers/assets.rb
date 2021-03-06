# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( Chart.js )
Rails.application.config.assets.precompile += %w( strikeout_leaders.js )
Rails.application.config.assets.precompile += %w( top_home_run_hitters.js )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( pitch_distribution.js )
Rails.application.config.assets.precompile += %w( ops_leaders.js )
# =======
# Rails.application.config.assets.precompile += %w( vjs.eot )
# Rails.application.config.assets.precompile += %w( vjs.woff )
# Rails.application.config.assets.precompile += %w( vjs.ttf )
# Rails.application.config.assets.precompile += %w( video-js.swf )
# Rails.application.config.assets.precompile += %w( homepage.js )
# >>>>>>> 12b289555f3d71fff3a56df45de2fde8b0432627
