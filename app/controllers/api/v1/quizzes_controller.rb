class Api::V1::QuizzesController < Api::ApiController
  def gk_quiz
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Quiz.where(added_date: Date.today).limit(10).map(&:to_hash)
    render_response(result)
  end

  def cricket_quiz
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = CricketQuiz.where(added_date: Date.today).limit(10).map(&:to_hash)
    render_response(result)
  end

  def bollywood_quiz
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = Bollywood.where(added_date: Date.today).limit(10).map(&:to_hash)
    render_response(result)
  end

  def movies_quiz
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = MovieQuiz.where(added_date: Date.today).limit(10).map(&:to_hash)
    render_response(result)
  end

  def technology_quiz
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = BooleanQuiz.where(added_date: Date.today).limit(10).map(&:to_hash)
    render_response(result)
  end

  def image_boolean_one
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageBoolean.where(added_date: Date.today).limit(10).map(&:to_hash)
    render_response(result)
  end

  def image_boolean_two
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = ImageQuiz.where(added_date: Date.today).limit(10).map(&:to_hash)
    render_response(result)
  end

  def swipe_celebrity
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = SwipeQuiz.where(added_date: Date.today).limit(10).map(&:to_hash)
    render_response(result)
  end

  def swipe_knowledge
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = SwipeOne.where(added_date: Date.today).limit(10).map(&:to_hash)
    render_response(result)
  end

  def swipe_insta
    result = {
      quiz: [],
      status:    200,
      message:   "Success"
    }
    result[:quiz] = SwipeInstum.where(added_date: Date.today).limit(10).map(&:to_hash)
    render_response(result)
  end
end
