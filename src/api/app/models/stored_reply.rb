# TODO: Please overwrite this comment with something explaining the model target
class StoredReply < ApplicationRecord
  #### Includes and extends

  #### Constants

  #### Self config

  #### Attributes

  #### Associations macros (Belongs to, Has one, Has many)
  
  #### Callbacks macros: before_save, after_save, etc.

  #### Scopes (first the default_scope macro if is used)

  #### Validations macros

  #### Class methods using self. (public and then private)

  #### To define class methods as private use private_class_method
  #### private


  #### Instance methods (public and then protected/private)

  #### Alias of methods
  
end

# == Schema Information
#
# Table name: stored_replies
#
#  id      :integer          not null, primary key
#  reply   :string(255)
#  user_id :integer          indexed
#
# Indexes
#
#  fk_rails_c006a3a4e3  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
