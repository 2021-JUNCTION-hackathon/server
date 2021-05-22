module Api::V1
  class MobilitiesController < BaseController
    api! '모빌리티 데이터 조회 (화면에서 보여지는 지도 내)'
    formats ['query']
    param :northeast_lat, String, :desc => '북동쪽 위도', meta: ['37.48219'], :required => true
    param :southwest_lat, String, :desc => '남서쪽 위도', meta: ['37.48158'], :required => true
    param :northeast_lng, String, :desc => '북동쪽 경도', meta: ['127.1253'], :required => true
    param :southwest_lng, String, :desc => '남서쪽 경도', meta: ['127.1240'], :required => true
    param :ride_type, %w[bicycle kick_board], :desc => "모빌리티 타입"
    def index
      ne_lat = params[:northeast_lat].to_f
      ne_lng = params[:northeast_lng].to_f
      sw_lat = params[:southwest_lat].to_f
      sw_lng = params[:southwest_lng].to_f
      
      mobilities = Mobility.order('RANDOM()').where('lat >= ? AND lat <= ?', sw_lat, ne_lat).
        where('lng >= ? AND lng <= ?', sw_lng, ne_lng)
        
      mobilities = mobilities.where(ride_type: params[:ride_type]) if params[:ride_type]
      
      mobilities = mobilities.limit(1000)
        
      standard_render_send :status_case => :success,
        payload: ActiveModel::Serializer::CollectionSerializer.new(mobilities, serializer: Api::V1::MobilitySerializer),
        meta: { size: mobilities.size }
    end
    
    api! '모빌리티 데이터 조회 (나의 기준점으로 부터)'
    formats ['query']
    param :lat, String, :desc => '현재 나의 위치 (위도)', meta: ['37.4819'], :required => true
    param :lng, String, :desc => '현재 나의 위치 (경도)', meta: ['127.1240'], :required => true
    param :ride_type, %w[bicycle kick_board], :desc => "사용자가 이동 시 이용하는 모빌리티 타입"
    def from_my_position
      lat = params[:lat].to_f
      lng = params[:lng].to_f
      plus_alpha = 0.0005
      if params[:ride_type]
        plus_alpha = case params[:ride_type]
        when 'bicycle'
          0.001
        when 'e_bicycle'
          0.0030
        when 'wheel'
          0.0005
        when 'e_wheel'
          0.00010
        when 'kick_board'
          0.00005
        when 'e_kick_board'
          0.00040
        end
      end
      
      mobilities = Mobility.order('RANDOM()').where('lat >= ? AND lat <= ?', lat-plus_alpha, lat+plus_alpha).
        where('lng >= ? AND lng <= ?', lng-plus_alpha, lng+plus_alpha)
      
      mobilities = mobilities.limit(1000)
      avg_impulse = Mobility.where(id: mobilities.map(&:id)).average(:impulse).to_f
      
      avg_impulse = if avg_impulse >= 1.0 && avg_impulse <= 3.9
        Mobility::LEVEL[Mobility::LevelType::CAREFUL]
      elsif avg_impulse >= 4.0 && avg_impulse <= 7.9
        Mobility::LEVEL[Mobility::LevelType::DANGER]
      else
        Mobility::LEVEL[Mobility::LevelType::WARNING]
      end
        
      standard_render_send :status_case => :success,
        payload: ActiveModel::Serializer::CollectionSerializer.new(mobilities, serializer: Api::V1::MobilitySerializer),
        meta: { size: mobilities.size, plus_minus_aplha_distance: plus_alpha, avg_impulse_from_my_position: avg_impulse }
    end
    
    api! '두 포인트 지점 주변 위험지역 데이터 조회'
    formats ['query']
    param :lat_and_lng, String, :desc => '위도, 경도(2차원 배열 형태로)', meta: [['37.48158', '127.1240'], ['37.48219', '127.1253']], :required => true
    def obstacles_base_map_guide
      mobility_ids = []
      lat_and_lng = JSON.parse(params[:lat_and_lng])
      
      idx = 0
      (lat_and_lng.length - 1).times do
        current_idx = idx
        next_idx = current_idx + 1
        
        current_lat = lat_and_lng[current_idx][0]
        current_lng = lat_and_lng[current_idx][1]
        next_lat = lat_and_lng[next_idx][0]
        next_lng = lat_and_lng[next_idx][1]
        
        pt_middle_lat, pt_middle_lng = (current_lat+next_lat)/2, (current_lng+next_lng)/2
        range_current_middle_lat = (current_lat - pt_middle_lat).abs
        range_current_middle_lng = (current_lng - pt_middle_lng).abs
        
        mobility_ids << Mobility.where('lat >= ? AND lat <= ?', pt_middle_lat-range_current_middle_lat, pt_middle_lat+range_current_middle_lat).
          where('lng >= ? AND lng <= ?', pt_middle_lng-range_current_middle_lng, pt_middle_lng+range_current_middle_lng).pluck(:id)
        
        idx += 1
      end
      
      mobilities = Mobility.where(id: mobility_ids.flatten.uniq)
      
      standard_render_send :status_case => :success,
        payload: ActiveModel::Serializer::CollectionSerializer.new(mobilities, serializer: Api::V1::MobilitySerializer),
        meta: { size: mobilities.size }
    end
  end
end