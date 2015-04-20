module Account
  class BaseController < ApplicationController
    layout 'account'
    before_action :autenticate_user!
  end

end