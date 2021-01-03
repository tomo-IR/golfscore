class GolfcoursesController < ApplicationController
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
    (1..3).each do|page|
    # (1.. pagecount.to_i).each do|page|
      uri = URI(base_url + '?' + params.map { |k,v| "#{k}=#{v}" }.join('&') + "&page=" + page.to_s)
      puts uri
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.open_timeout = 5
        http.read_timeout = 10
        http.get(uri.request_uri)
      end
      
      json = JSON.parse(response.body)
      @json = JSON.parse(response.body)
      # puts json
      json["Items"].each do|name|
        # golfcourse = Golfcourse.new(:golfcoursename => name["Item"]["golfCourseName"],
                                    #  :golfcourseid => name["Item"]["golfCourseId"])
        puts "DB側のgolfcourseIDは" + Golfcourse.find_by(golfcourseid: name["Item"]["golfCourseId"]).golfcourseid.to_s
        puts "API側のgolfcourseIDは" + name["Item"]["golfCourseId"].to_s
        
        puts "DB側のgolfcourseNameは" + Golfcourse.find_by(golfcourseid: name["Item"]["golfCourseId"]).golfcoursename.to_s
        puts "API側のgolfcourseNameは" + name["Item"]["golfCourseName"].to_s
        
        if (Golfcourse.find_by(golfcourseid: name["Item"]["golfCourseId"]).golfcourseid.to_s == name["Item"]["golfCourseId"].to_s) && (Golfcourse.find_by(golfcourseid: name["Item"]["golfCourseId"]).golfcoursename.to_s == name["Item"]["golfCourseName"].to_s)
          puts "idも存在していて、nameの変更もないので、なにもしません。"
        elsif (Golfcourse.find_by(golfcourseid: name["Item"]["golfCourseId"]).golfcourseid.to_s == name["Item"]["golfCourseId"].to_s) && (Golfcourse.find_by(golfcourseid: name["Item"]["golfCourseId"]).golfcoursename.to_s != name["Item"]["golfCourseName"].to_s)
            puts "idは存在しているが、nameが変更されているので、更新します"
        elsif Golfcourse.find_by(golfcourseid: name["Item"]["golfCourseId"]).golfcourseid.to_s == name["Item"]["golfCourseId"].to_s
          # .create
          puts "idが存在しなかったので、新規保存します"
        end


        # 保存の処理
        # if golfcourse.save 
        #     # redirect_to root_path
        # else
        #     flash.now[:danger] = '保存できませんでした'
        # end

      end
    end
  end 
end
