module Api::V1
  class MobilitiesController < BaseController
    api! '모빌리티 데이터 조회'
    formats ['query']
    param :northeast_lat, String, :desc => '북동쪽 위도', meta: ['37.48219'], :required => true
    param :southwest_lat, String, :desc => '남서쪽 위도', meta: ['37.48158'], :required => true
    param :northeast_lng, String, :desc => '북동쪽 경도', meta: ['127.1253'], :required => true
    param :southwest_lng, String, :desc => '남서쪽 경도', meta: ['127.1240'], :required => true
    param :ride_type, %w[bicycle e_bicycle wheel kick_board], :desc => "모빌리티 타입"
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
        payload: ActiveModel::Serializer::CollectionSerializer.new(mobilities, serializer: Api::V1::MobilitySerializer)
    end
  end
end