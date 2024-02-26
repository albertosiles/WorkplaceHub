# config/initializers/cloudinary.rb
Cloudinary.config do |config|
  config.cloud_name = 'dhyyrfxic' # Replace 'alberto' with your actual Cloudinary cloud name
  config.api_key = '438692253685768' # Replace '438692253685768' with your actual Cloudinary API key
  config.api_secret = 'lzZV1_Z2zmMDiBpX6V0VtLYjK3Q' # Replace '438692253685768' with your actual Cloudinary API secret
  config.secure = true
  config.cdn_subdomain = true
end
