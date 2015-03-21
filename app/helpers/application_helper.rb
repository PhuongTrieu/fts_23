module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Framgia Test"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def link_to_remove_fields(name, f, name_of_function)
    f.hidden_field(:_destroy) + link_to_function(name, name_of_function)
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    if name == "Add Question"
      4.times { new_object.options.build }
    end
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
end
