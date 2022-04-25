module QuestionsHelper
  def hide_the_question
    if @question.hidden?
      button_to fa_icon('eye-slash'), hide_question_path(@question), method: :put, title: 'Вопрос скрыт. Показать?'
    else
      button_to fa_icon('eye'), hide_question_path(@question), method: :put, title: 'Вопрос виден. Скрыть?'
    end
  end
end
