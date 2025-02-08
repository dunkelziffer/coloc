class Tasks::IndexView < ApplicationView
  controller_variable :tasks

  def view_template
    content_for :title, "Tasks"

    div(class: "w-full") {
      if notice.present?
        p(id: "notice", class: "py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-md inline-block") {
          notice
        }
      end
      div(class: "flex justify-between items-center") {
        h1(class: "font-bold text-4xl") { "Tasks" }
        link_to "New task", new_task_path, class: "rounded-md px-3.5 py-2.5 bg-blue-600 hover:bg-blue-500 text-white block font-medium"
      }
      div(id: "tasks", class: "min-w-full") {
        if @tasks.any?
          @tasks.each do |task|
            render Tasks::TaskPartial.new(task: task)
            p {
              link_to "Show this task", task, class: "ml-2 rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 inline-block font-medium"
            }
          end
        else
          p(class: "text-center my-10") { "No tasks found." }
        end
      }
    }
  end
end
