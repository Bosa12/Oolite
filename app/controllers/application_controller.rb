class ApplicationController < ActionController::Base
  include MetaTags::ControllerHelper
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

end
