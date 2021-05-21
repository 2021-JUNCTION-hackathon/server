class HomesController < ApplicationController
  api! '(기본) 성공응답'
  def index
    standard_render_send :status_case => :success,
      payload: { is_good: true },
      meta: { message: 'hello, world!' }
  end
  
  api! '(기본) 에러응답'
  def res_raise
    raise Errors::Normal, '이것은 raise 에러입니다'
  end
  
  api! '(기본) 실패응답'
  def res_fail
    standard_render_send :status_case => :error,
      message: { meta: '이것은 Fail 응답입니다.' },
      meta: { is_error: true }
  end
end
