namespace :heroku do
  desc "generate database.yml"
  task :database_yml do
    # ref. https://github.com/heroku/heroku-buildpack-ruby/blob/154fab366ff2a611893a825eff33d537d717a350/lib/language_pack/ruby.rb#L636-L692
    File.open("config/database.yml", "w") do |file|
      file.puts <<-DATABASE_YML
<%
require 'cgi'
require 'uri'
begin
  uri = URI.parse(ENV["DATABASE_URL"])
rescue URI::InvalidURIError
  raise "Invalid DATABASE_URL"
end
raise "No RACK_ENV or RAILS_ENV found" unless ENV["RAILS_ENV"] || ENV["RACK_ENV"]
def attribute(name, value, force_string = false)
  if value
    value_string =
      if force_string
        '"' + value + '"'
      else
        value
      end
    "\#{name}: \#{value_string}"
  else
    ""
  end
end
adapter = uri.scheme
adapter = "postgresql" if adapter == "postgres"
database = (uri.path || "").split("/")[1]
username = uri.user
password = uri.password
host = uri.host
port = uri.port
params = CGI.parse(uri.query || "")
%>
<%= ENV["RAILS_ENV"] || ENV["RACK_ENV"] %>:
  <%= attribute "adapter",  adapter %>
  <%= attribute "database", database %>
  <%= attribute "username", username %>
  <%= attribute "password", password, true %>
  <%= attribute "host",     host %>
  <%= attribute "port",     port %>
<% params.each do |key, value| %>
  <%= key %>: <%= value.first %>
<% end %>
      DATABASE_YML
    end
    puts "Write config/database.yml"
  end
end
