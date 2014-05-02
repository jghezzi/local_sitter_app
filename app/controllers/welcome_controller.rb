class WelcomeController < ApplicationController
  skip_filter :ensure_current_sitter
  def index
  end
end
