# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Aesoft::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address  => "smtp-out.xnet.cz",
    :port => 25,
    :domain => "www.aesoft.cz"
}