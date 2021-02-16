const { $ } = require("@rails/ujs");

document.addEventListener("turbolinks:load", function() {
    window.onload = function() {
        console.log("画面ロードされた");
        var submit_button = document.getElementById("golfcourse_select");
        submit_button.addEventListener('click', () => {
            console.log("送信ボタンクリックした");
            var flag = false; // 選択されているか否かを判定するフラグ
            // ラジオボタンの数だけ判定を繰り返す（ボタンを表すインプットタグがあるので１引く）
            for (var i = 0; i < document.select_course_form.golfcourse_id.length; i++) {
                // i番目のラジオボタンがチェックされているかを判定
                if (document.select_course_form.golfcourse_id[i].checked) {
                    flag = true;
                    alert("よろしいですか？")
                }
            }
            // 何も選択されていない場合の処理
            if (!flag) {
                alert("ゴルフ場が選択されていません。");
            }

        });
    };
});