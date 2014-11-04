require File.expand_path("../boot.rb", __FILE__)

# Loads the Padrino applications mounted within the project.
Padrino.mounted_apps.each do |app|
  logger.info "=> Loading Padrino Application : #{app.app_class}"
  app.app_obj.setup_application!
end
