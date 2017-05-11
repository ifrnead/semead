module Selectable
  extend ActiveSupport::Concern

  module ClassMethods
    def select(method: 'all')
      options = Array.new
      self.send(method).each do |element|
        options << [element.nome, element.id]
      end
      return options
    end
  end
end
