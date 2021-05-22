class Mobility < ApplicationRecord
  TYPE = {
    bicycle: '일반자전거',
    e_bicycle: '전기자전거',
    wheel: '휠체어',
    e_wheel: '전동 휠체어',
    kick_board: '킥보드',
    e_kick_board: '전동 킥보드'
  }.freeze
  
  module LevelType
    CAREFUL = :careful
    WARNING = :warning
    DANGER = :danger
  end
  
  LEVEL = {
    LevelType::CAREFUL => { text: '경미', level: 1 }, # range: '1.0~3.99'
    LevelType::WARNING => { text: '조심', level: 2 }, # range: '4.0~7.99'
    LevelType::DANGER => { text: '경고', level: 3 } # range: '8.0~10.0'
  }.freeze
  
  validates :ride_type, inclusion: { in: TYPE.stringify_keys }
end
