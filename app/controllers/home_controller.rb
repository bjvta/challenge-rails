# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    ViewCount.increment('/')
    @viewcounts = ViewCount.all
  end
end
