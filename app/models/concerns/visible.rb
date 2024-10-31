module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = [ "public", "private", "archived" ]

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
    after_initialize :set_default_status
  end

  class_methods do
    def public_count
      where(status: "public").count
    end
  end

  def public?
    status == "public"
  end

  def archived?
    status == "archived"
  end

  private

  def set_default_status
        self.status ||= "public"
  end
end
