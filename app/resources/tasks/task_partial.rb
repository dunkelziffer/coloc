class Tasks::TaskPartial < Phlex::HTML
  include Phlex::Rails::Helpers::DOMID

  attr_accessor :task

  def initialize(task:)
    @task = task
  end

  def view_template
    div(id: dom_id(task)) {
      p(class: "my-5") {
        strong(class: "block font-medium mb-1") { "Description:" }
        plain(task.description)
      }
      p(class: "my-5") {
        strong(class: "block font-medium mb-1") { "Done:" }
        plain(task.done.to_s)
      }
    }
  end
end
