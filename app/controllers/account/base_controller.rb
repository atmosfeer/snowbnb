module Account
  class BaseController < ApplicationController
    before_action :autenticate_user!
  end

end