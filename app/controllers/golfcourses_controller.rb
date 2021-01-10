class GolfcoursesController < ApplicationController

  def search
    @golfcoursename_all  = Golfcourse.all
                                      .page(params[:page]).per(10) #ページネーション
    @search_golfcoursename = Golfcourse.search(params[:search])
                                        .page(params[:page]).per(10) #ページネーション
  end

  def round_start
    @score = Score.new(new_score_params)
    @score.user_id = current_user.id
    @score.status = 0
    if @score.save
      flash[:success] = 'ラウンド開始！！'
      redirect_to golfcourse_play_path(id: @score.id)
      puts params[:played_date]
    else
      flash.now[:danger] = '何かがおかしいです'
      render :root_path
    end
  end

  def play
    @score = Score.find(params[:id])
    
    if @score.update(hole1_score: params[:hole1_score])
      # flash[:edit_success] = 'スコアが編集されました'
      # redirect_to golfcourse_play_path
    else
      flash.now[:danger] = 'スコアが編集されませんでした'
      render golfcourse_play_path
    end



    # リーダーボード関係
    playing_course = Score.find(params[:id])
    @current_course_score = Score.where(golfcourse_id: playing_course.golfcourse_id)
                                  .where(played_date: playing_course.played_date) 
                                  .includes([:user])

    # play_date = Score.where(:round_id => params[:round_id]).first
    # @ou = Score.where(played_date: playing_course.played_date)
    #             .where(golfcourse_id: playing_course.golfcourse_id)
                
    #             .group(:id)
    #             .select("score.total_score as overunder")
    #             .order("overunder")
                              

    # メッセージボード関係
    @current_course_message = Message.where(golfcourse_id: playing_course.golfcourse_id).includes([:user])


      
  end

  def finish
    @score = Score.find(params[:id])
    @score.status = 1
    if @score.save
      flash[:success] = 'ラウンド完了！！'
      redirect_to root_path
    else
      flash.now[:danger] = '何かがおかしいです'
      render :root_path
    end

  end





  def get
    require 'net/http'
    require 'json'
    require 'uri'
  
    base_url = "https://app.rakuten.co.jp/services/api/Gora/GoraGolfCourseSearch/20170623"

    #1.総ページ数	(pageCount)を取得
    params = {
      'format'        => 'json',
      'applicationId' => '1083401508369226218',
      'hits'          => 30,
      
    }
    uri = URI(base_url + '?' + params.map { |k,v| "#{k}=#{v}" }.join('&'))
    puts uri
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.open_timeout = 5
      http.read_timeout = 10
      http.get(uri.request_uri)
    end
    json = JSON.parse(response.body)
    # @json = JSON.parse(response.body)

    puts json["pageCount"]
    pagecount = json["pageCount"]

    
    #2.全てのゴルフ場情報をループさせて取得
    # (1..3).each do|page|
    (1.. pagecount.to_i).each do|page|
      uri = URI(base_url + '?' + params.map { |k,v| "#{k}=#{v}" }.join('&') + "&page=" + page.to_s)
      puts uri
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.open_timeout = 5
        http.read_timeout = 10
        http.get(uri.request_uri)
      end
      
      json = JSON.parse(response.body)
      @json = JSON.parse(response.body)

      json["Items"].each do|golf_course_hash|
        api_golf_course_id = golf_course_hash["Item"]["golfCourseId"]
        api_golf_course_name = golf_course_hash["Item"]["golfCourseName"]
        api_golf_course_abbr = golf_course_hash["Item"]["golfCourseAbbr"]
        api_golf_course_name_kana = golf_course_hash["Item"]["golfCourseNameKana"]
        api_golf_course_caption = golf_course_hash["Item"]["golfCourseCaption"]
        api_golf_course_addres = golf_course_hash["Item"]["address"]
        db_golf_course = Golfcourse.find_by(golfcourseid: api_golf_course_id)
        if db_golf_course.blank?
          # ゴルフ場の情報がDBにないので新規作成
          Golfcourse.create(golfcourseid: api_golf_course_id, 
                            golfcoursename: api_golf_course_name,
                            golfcourseabbr: api_golf_course_abbr,
                            golfcoursenamekana: api_golf_course_name_kana,
                            golfcoursecaption: api_golf_course_caption,
                            address: api_golf_course_addres)
          puts "idが存在しなかったので、新規保存します"
          
        elsif db_golf_course.golfcoursename != api_golf_course_name
          db_golf_course.update(golfcourseid: api_golf_course_id, 
                                golfcoursename: api_golf_course_name,
                                golfcourseabbr: api_golf_course_abbr,
                                golfcoursenamekana: api_golf_course_name_kana,
                                golfcoursecaption: api_golf_course_caption,
                                address: api_golf_course_addres)
          puts "idは存在しているが、nameが変更されているので、更新します"
          # ゴルフ場の名前がDBに登録されている名前と異なるので更新
        end
      end
    end
  end 


  private

  def new_score_params
    params.permit(:golfcourse_id, :published, :played_date)
  end

end

