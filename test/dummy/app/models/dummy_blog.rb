# == Schema Information
#
# Table name: dummy_blogs
#
#  id           :bigint(8)        not null, primary key
#  title        :string
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class DummyBlog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
end
