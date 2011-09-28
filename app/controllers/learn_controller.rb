class LearnController < ApplicationController
  def index
  end

  def random
    @entries = current_user.entries.find(:all, order: "score ASC").first
  end

end
