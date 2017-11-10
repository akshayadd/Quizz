class Api::V1::ImageQuizzesController < Api::ApiController
  def page_one
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end

  def page_two
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10).offset(10)
    render_response(result)
  end

  def page_three
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10).offset(20)
    render_response(result)
  end

  def page_four
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10).offset(30)
    render_response(result)
  end

  def page_five
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10).offset(40)
    render_response(result)
  end

  def page_six
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10).offset(50)
    render_response(result)
  end

  def page_seven
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10).offset(60)
    render_response(result)
  end

  def page_eight
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10).offset(70)
    render_response(result)
  end

  def page_nine
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10).offset(80)
    render_response(result)
  end

  def page_ten
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10).offset(90)
    render_response(result)
  end
end
