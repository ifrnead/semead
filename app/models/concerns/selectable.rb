module Selectable
  extend ActiveSupport::Concern

  module ClassMethods
    def select
      options = Array.new
      self.all.each do |element|
        options << [element.nome, element.id]
      end
      return options
    end
  end
end
