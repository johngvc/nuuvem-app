# == Schema Information
#
# Table name: file_uploads
#
#  id         :bigint           not null, primary key
#  file       :binary
#  last_error :string
#  name       :string
#  processed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :file_upload do
    name { "MyString" }
    type { "" }
    file { "" }
  end
end
