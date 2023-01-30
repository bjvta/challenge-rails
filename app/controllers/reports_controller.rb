# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @profiles = Profile.all
  end
end
