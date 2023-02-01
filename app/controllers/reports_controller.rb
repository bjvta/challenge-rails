# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    tags = params[:tag]
    @profiles = Profile.all.includes(:repositories)
    return unless tags.present?

    repositories = Repository.where('tags like ?', "%#{tags}%")
    @profiles = Profile.where(id: repositories.map(&:profile_id).compact)
  end

  def external
    @profiles = ReportService.new.generate
  end
end
