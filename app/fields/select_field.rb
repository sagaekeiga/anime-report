require "administrate/field/base"

class SelectField < Administrate::Field::Base
  def to_s
    data
  end

  # 追加！
  def choices
    choices = options.fetch(:choices)
    if choices.is_a? Hash
      choices
    else
      choices.zip(choices)
    end
  end

  # 追加！
  def with_blank
    options[:with_blank]
  end

  # 追加！
  def selected_choice
    data
  end
  
end
