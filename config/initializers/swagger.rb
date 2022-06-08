#File config/initializers/swagger.rb
  Swagger::Docs::Config.register_apis({
  "1.0" => {
    :api_file_path => "public",
    # the URL base path to your API
    :base_path => "http://localhost:3000",
    # if you want to delete all .json files at each generation
    :clean_directory => true,
    #:parent_controller => ApplicationController,
    # add custom attributes to api-docs
    :attributes => {
      :info => {
        "title" => "FAQ",
        "description" => "Project Aplication"
       }
     }
  }
})
