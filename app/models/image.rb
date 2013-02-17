class Image < ActiveRecord::Base
  attr_accessible :file
  has_attached_file :file,
      :styles => { :thumbnail => "260x180>", :full => "700>" },
      :convert_options => {:thumbnail => "-gravity center -extent 260x180"}

  belongs_to :user
end
