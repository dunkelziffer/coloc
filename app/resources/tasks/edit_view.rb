class Tasks::EditView < ApplicationView
  controller_variable :task

  def view_template
    content_for :title, "Editing task"

    div(class: "md:w-2/3 w-full") {
      h1(class: "font-bold text-4xl") { "Editing task" }
      render Tasks::FormPartial.new(task: @task)
      link_to "Show this task", @task, class: "ml-2 rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 inline-block font-medium"
      link_to "Back to tasks", tasks_path, class: "ml-2 rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 inline-block font-medium"
    }
  end
end
