class SessionTrimJob < ApplicationJob
  queue_as :default

  def perform
    ActiveRecord::SessionStore::Session.where("updated_at < ?", Rails.application.config.session_days.ago).delete_all
  end

  after_perform do |job|
    SessionTrimJob.set(wait: 1.day).perform_later
  end
end
