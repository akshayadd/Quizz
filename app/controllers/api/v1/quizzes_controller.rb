class Api::V1::QuizzesController < Api::ApiController
  def page_one
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end

  def page_two
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end

  def page_three
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end

  def page_four
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end

  def page_five
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end

  def page_six
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end

  def page_seven
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end

  def page_eight
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end

  def page_nine
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end

  def page_ten
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10)
    render_response(result)
  end
end
