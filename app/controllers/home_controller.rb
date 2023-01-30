# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    ViewCount.increment('/')
  end
end
