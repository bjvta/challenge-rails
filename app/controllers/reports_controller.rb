# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    tags = params[:tag]
    @profiles = Profile.all.includes(:repositories)
    if tags.present?
      repositories = Repository.where("tags like ?", "%#{tags}%")
      @profiles = Profile.where(id: repositories.map{ |r| r.profile_id }.compact)
    end
  end
end
