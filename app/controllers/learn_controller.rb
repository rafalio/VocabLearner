class LearnController < ApplicationController
  def index
  end

  def random
    @entry = current_user.entries.find(:all, order: "RANDOM()").first
  end

  def yes
    @entry = current_user.entries.where(:id => params[:id]).first
    @entry.yes += 1

    respond_to do |format|
      if @entry.save
        format.html { redirect_to random_path }
      end
    end

  end

  def no
    @entry = current_user.entries.where(:id => params[:id]).first
    @entry.no += 1

    logger.debug @entry.inspect

    respond_to do |format|
      if @entry.save
        format.js
        format.html { redirect_to random_path }
      end
    end

  end

end
