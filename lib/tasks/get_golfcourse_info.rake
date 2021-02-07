namespace :get_golfcourse_info do
  desc ' 楽天ゴルフAPIを週一回叩いて、変更があれば更新する'
  task get: :environment do
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
end
