class TasksPower < ApplicationPower
  def self.visible
    TasksForm.all
  end

  def self.editable
    TasksForm.all
  end

  def self.permitted_params
    [:description, :done]
  end
end
