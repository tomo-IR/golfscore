const { $, confirm } = require("@rails/ujs");

// ゴルフ場選択ページにて、ラジオボタンを何も選択しなかった時のバリデーション処理
document.addEventListener("turbolinks:load", function() {
    // ゴルフ場選択ページに遷移時、何も表示させない処理
    var urlParam = location.search.substring(1);
    if (urlParam == "search=&commit=Search" || urlParam == "") {
        document.getElementById("search_result").style.display = "none"
        document.getElementById("golfcourse_select").style.display = "none"
    } else {}

    var submit_button = document.getElementById("golfcourse_select");
    submit_button.addEventListener('click', () => {
        var flag = false;
        radio_count = document.getElementsByName("golfcourse_id").length;
        if (radio_count == 1) {
            if (document.select_course_form.golfcourse_id.checked) {
                flag = true;
            } else {}
        } else {
            for (var i = 0; i < radio_count; i++) {
                // i番目のラジオボタンがチェックされているかを判定
                if (document.select_course_form.golfcourse_id[i].checked) {
                    flag = true;
                } else {}
            }
        }
        // 何も選択されていない場合の処理
        if (!flag) {
            alert("ゴルフ場が選択されていません。");
        }
    });
});