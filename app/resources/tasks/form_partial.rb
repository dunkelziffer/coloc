class Tasks::FormPartial < Phlex::HTML
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::Label
  include Phlex::Rails::Helpers::Pluralize
  include Phlex::Rails::Helpers::TextField

  attr_accessor :task

  def initialize(task:)
    @task = task
  end

  def view_template
    form_with(model: task, class: "contents") { |form|
      if task.errors.any?
        div(id: "error_explanation", class: "bg-red-50 text-red-500 px-3 py-2 font-medium rounded-md mt-3") {
          h2 {
            pluralize(task.errors.count, "error")
            plain " prohibited this task from being saved:"
          }
          ul(class: "list-disc ml-6") {
            task.errors.each do |error|
              li { error.full_message }
            end
          }
        }
      end

      div(class: "my-5") {
        form.label :description
        form.text_field :description, class: ["block shadow-sm rounded-md border outline-hidden px-3 py-2 mt-2 w-full", feedback_classes(task.errors[:description])]
      }

      div(class: "my-5") {
        form.label :done
        form.checkbox :done, class: ["block shadow-sm rounded-md border outline-hidden mt-2 h-5 w-5", feedback_classes(task.errors[:done])]
      }

      div(class: "inline") {
        form.submit class: "rounded-md px-3.5 py-2.5 bg-blue-600 hover:bg-blue-500 text-white inline-block font-medium cursor-pointer"
      }
    }
  end

  private

  def feedback_classes(errors)
    {
      "border-gray-400 focus:outline-blue-600": errors.none?,
      "border-red-400 focus:outline-red-600": errors.any?
    }
  end
end
