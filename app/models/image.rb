class Image < ActiveRecord::Base
  attr_accessible :file
  
  has_attached_file :file,
      :styles => { :thumbnail => "260x180>", :full => "860>" },
      :convert_options => {:thumbnail => "-gravity center -extent 260x180"}

  belongs_to :owner, class_name: "User"
end
