class RoundsController < ApplicationController
    require 'securerandom'
    
    def index
      
    end
    def select_course
      
        @todoufukens = {
            0	=> "全地域",
            101	=> "北海道・東北のすべて",
            1	=> "北海道",
            2	=> "青森県",
            3	=> "岩手県",
            4	=> "宮城県",
            5	=> "秋田県",
            6	=> "山形県",
            7	=> "福島県",
            102	=> "関東のすべて",
            8	=> "茨城県",
            9	=> "栃木県",
            10	=> "群馬県",
            11	=> "埼玉県",
            12	=> "千葉県",
            13	=> "東京都",
            14	=> "神奈川県",
            19	=> "山梨県",
            20	=> "長野県",
            22	=> "静岡県",
            103	=> "北陸のすべて",
            15	=> "新潟県",
            16	=> "富山県",
            17	=> "石川県",
            18	=> "福井県",
            104	=> "中部のすべて",
            21	=> "岐阜県",
            23	=> "愛知県",
            24	=> "三重県",
            105	=> "近畿のすべて",
            25	=> "滋賀県",
            26	=> "京都府",
            27	=> "大阪府",
            28	=> "兵庫県",
            29	=> "奈良県",
            30	=> "和歌山県",
            106	=> "中国のすべて",
            31	=> "鳥取県",
            32	=> "島根県",
            33	=> "岡山県",
            34	=> "広島県",
            35	=> "山口県",
            107	=> "四国のすべて",
            36	=> "徳島県",
            37	=> "香川県",
            38	=> "愛媛県",
            39	=> "高知県",
            108	=> "九州・沖縄のすべて",
            40	=> "福岡県",
            41	=> "佐賀県",
            42	=> "長崎県",
            43	=> "熊本県",
            44	=> "大分県",
            45	=> "宮崎県",
            46	=> "鹿児島県",
            47	=> "沖縄県",
            109	=> "海外"
          }
    end

    def search
        require 'net/http'
        require 'json'
        require 'uri'
        @round_id = params[:golfCourseName]
         @todoufukens = {
          0	=> "全地域",
          101	=> "北海道・東北のすべて",
          1	=> "北海道",
          2	=> "青森県",
          3	=> "岩手県",
          4	=> "宮城県",
          5	=> "秋田県",
          6	=> "山形県",
          7	=> "福島県",
          102	=> "関東のすべて",
          8	=> "茨城県",
          9	=> "栃木県",
          10	=> "群馬県",
          11	=> "埼玉県",
          12	=> "千葉県",
          13	=> "東京都",
          14	=> "神奈川県",
          19	=> "山梨県",
          20	=> "長野県",
          22	=> "静岡県",
          103	=> "北陸のすべて",
          15	=> "新潟県",
          16	=> "富山県",
          17	=> "石川県",
          18	=> "福井県",
          104	=> "中部のすべて",
          21	=> "岐阜県",
          23	=> "愛知県",
          24	=> "三重県",
          105	=> "近畿のすべて",
          25	=> "滋賀県",
          26	=> "京都府",
          27	=> "大阪府",
          28	=> "兵庫県",
          29	=> "奈良県",
          30	=> "和歌山県",
          106	=> "中国のすべて",
          31	=> "鳥取県",
          32	=> "島根県",
          33	=> "岡山県",
          34	=> "広島県",
          35	=> "山口県",
          107	=> "四国のすべて",
          36	=> "徳島県",
          37	=> "香川県",
          38	=> "愛媛県",
          39	=> "高知県",
          108	=> "九州・沖縄のすべて",
          40	=> "福岡県",
          41	=> "佐賀県",
          42	=> "長崎県",
          43	=> "熊本県",
          44	=> "大分県",
          45	=> "宮崎県",
          46	=> "鹿児島県",
          47	=> "沖縄県",
          109	=> "海外"
        }
        base_url = "https://app.rakuten.co.jp/services/api/Gora/GoraGolfCourseSearch/20170623"
          
        k = params[:keyword]
        t = params[:todoufuken]

        params = {
          'keyword'       => URI.encode(k),
          'areaCode'      => t,
          'format'        => 'json',
          'applicationId' => '1083401508369226218',
          'hits'          => 30
        }
          
        uri = URI(base_url + '?' + params.map{|k,v| "#{k}=#{v}"}.join('&'))
        puts uri
        
        # begin
        response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.open_timeout = 5
          http.read_timeout = 10
          http.get(uri.request_uri)
        end
    
        # case response
          # when Net::HTTPSuccess
            @json = JSON.parse(response.body)
        # end
    
        # rescue => e
        #   Rails.logger.error(e.message)
        #   raise e
        # end
    end
    def show #　1〜18H分ゴルフ場の名前をpostし、レコードを生成する処理（hole_scoreはNull）
      @coursename = params[:golfCourseName]
      @round_id = Message.where(course: params[:course])
      round_id = SecureRandom.hex(8)
      # hoge = params[:round_id]
      [*1..18].each do|num|
        Score.create!(course: params[:course],hole_number: num,user_id: 1,round_id: round_id,hole_score: 0)    
      end      
      @round_id = round_id
      redirect_to round_play_path(course: params[:course], round_id: @round_id)
      
    end
    def play
      @coursename = params[:round_id]
      @score_card_score = Score.where(round_id: params[:round_id]) #ホールごとのスコアを取得
      @score_card_course = Score.where(round_id: params[:round_id]).first #ラウンドしたコース、日付を取得
      @score_sum = Score.where(round_id: params[:round_id]).sum(:hole_score)
     
      #ランキング関係
      today_same_course = Score.where("created_at >= ?", Date.today).where(course: params[:course])
      @over_under = today_same_course
        .group(:round_id)
        .group(:course)
        .group(:user_id)
        .sum(:hole_score)
        

        # .select("user_id,sum(hole_score - par) as overunder").order("overunder")
    # 　@sum_score = Score.group(:round_id).select("round_id,sum(hole_score) as sum_score ").order("sum_score")

    end

end