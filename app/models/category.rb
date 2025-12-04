class Category < ApplicationRecord
  # Keep associations simple for now – no join table
  # Add them later if you really need many-to-many

  def self.ransackable_attributes(auth_object = nil)
    # List only safe fields you want ActiveAdmin to search/filter by
    %w[id name created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    # We don't need any associations for filters right now
    []
  end
end
