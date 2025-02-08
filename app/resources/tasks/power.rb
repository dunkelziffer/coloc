class Tasks::Power < ApplicationPower
  def self.visible
    Tasks::Form.all
  end

  def self.editable
    Tasks::Form.all
  end

  def self.permitted_params
    [:description, :done]
  end
end
