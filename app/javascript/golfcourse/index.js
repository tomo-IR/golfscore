const { $, confirm } = require("@rails/ujs");

// ゴルフ場選択ページにて、ラジオボタンを何も選択しなかった時のバリデーション処理
document.addEventListener("turbolinks:load", function() {
    // ゴルフ場選択ページに遷移時、何も表示させない処理
    var urlParam = location.search.substring(1);
    console.log("パラメータは" + urlParam)
    if (urlParam == "search=&commit=Search" || urlParam == "") {
        console.log("paramsカラです")
        document.getElementById("search_result").style.display = "none"
        document.getElementById("golfcourse_select").style.display = "none"
    } else {
        console.log("params有り")
    }

    var submit_button = document.getElementById("golfcourse_select");
    submit_button.addEventListener('click', () => {
        console.log("送信ボタンクリックした");
        var flag = false; // 選択されているか否かを判定するフラグ
        // ラジオボタンの数だけ判定を繰り返す（ボタンを表すインプットタグがあるので１引く）
        radio_count = document.getElementsByName("golfcourse_id").length;
        console.log(radio_count);
        if (radio_count == 1) {
            console.log(document.select_course_form.golfcourse_id)
            if (document.select_course_form.golfcourse_id.checked) {
                flag = true;
            } else {
                console.log("チェックなし")
            }
        } else {
            for (var i = 0; i < radio_count; i++) {
                // i番目のラジオボタンがチェックされているかを判定
                console.log(document.select_course_form.golfcourse_id[i])
                if (document.select_course_form.golfcourse_id[i].checked) {
                    flag = true;
                } else {
                    console.log("チェックなし")
                }
            }
        }
        // 何も選択されていない場合の処理
        if (!flag) {
            alert("ゴルフ場が選択されていません。");
        }
    });


});