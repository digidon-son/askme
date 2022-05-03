module QuestionsHelper
  def hide_question(question)
    if question.hidden?
      button_to fa_icon('eye-slash'), hide_question_path(question), method: :put, title: 'Вопрос скрыт. Показать?',
                class: 'mr-sm'
    else
      button_to fa_icon('eye'), hide_question_path(question), method: :put, title: 'Вопрос виден. Скрыть?',
                class: 'mr-sm'
    end
  end

  def author
    if current_user.present?
      current_user.id
    else
      @question.user_id
    end
  end
end
