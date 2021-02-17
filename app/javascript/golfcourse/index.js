const { $, confirm } = require("@rails/ujs");

// ゴルフ場選択ページにて、ラジオボタンを何も選択しなかった時のバリデーション処理
document.addEventListener("turbolinks:load", function() {

    var submit_button = document.getElementById("golfcourse_select");
    submit_button.addEventListener('click', () => {
        console.log("送信ボタンクリックした");
        var flag = false; // 選択されているか否かを判定するフラグ
        // ラジオボタンの数だけ判定を繰り返す（ボタンを表すインプットタグがあるので１引く）
        for (var i = 0; i < document.select_course_form.golfcourse_id.length; i++) {
            // i番目のラジオボタンがチェックされているかを判定
            if (document.select_course_form.golfcourse_id[i].checked) {
                flag = true;
                // confirm("よろしいですか？")
            }
        }
        // 何も選択されていない場合の処理
        if (!flag) {
            alert("ゴルフ場が選択されていません。");
        }
    });

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
});