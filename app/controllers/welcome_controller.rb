class WelcomeController < ApplicationController
  before_filter :require_authentication
end
