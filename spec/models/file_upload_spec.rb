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
require 'rails_helper'

RSpec.describe FileUpload, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
