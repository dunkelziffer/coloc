class Tasks::ShowView < ApplicationView
  controller_variable :task

  def view_template
    content_for :title, "Showing task"

    div(class: "md:w-2/3 w-full") {
      if notice.present?
        p(id: "notice", class: "py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-md inline-block") {
          notice
        }
      end
      h1(class: "font-bold text-4xl") { "Showing task" }
      render Tasks::TaskPartial.new(task: @task)
      link_to "Edit this task", edit_task_path(@task), class: "mt-2 rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 inline-block font-medium"
      link_to "Back to tasks", tasks_path, class: "ml-2 rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 inline-block font-medium"
      div(class: "inline-block ml-2") {
        button_to "Destroy this task", @task, method: :delete, class: "mt-2 rounded-md px-3.5 py-2.5 text-white bg-red-600 hover:bg-red-500 font-medium"
      }
    }
  end
end
