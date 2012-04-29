add_import_path "/Users/nebelschwade/Repositories/webgefrickel/scss"

http_path = "/"
css_dir = "css"
sass_dir = "scss"
images_dir = "img"
javascripts_dir = "js"

relative_assets = true

# Options avaiable :expanded :nested :compact :compressed
# if there is no .env-local file in the root-dir overwrite compile settings
if File.exist?("../../../.env-local")
  output_style = :expanded 
  line_comments = true
else 
  output_style = :compressed
  line_comments = false
end
