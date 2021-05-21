class Mobility < ApplicationRecord
  TYPE = {
    bicycle: '일반자전거',
    e_bicycle: '전기자전거',
    wheel: '휠체어',
    kick_board: '킥보드'
  }
  
  validates :ride_type, inclusion: { in: TYPE.keys }
end
