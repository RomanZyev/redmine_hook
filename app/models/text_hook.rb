class TextHook < ActiveRecord::Base
  unloadable
  has_many :list_hook
end
