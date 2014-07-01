class Document < ActiveRecord::Base
  attr_accessible :attacment

  has_attached_file :attachment
end
