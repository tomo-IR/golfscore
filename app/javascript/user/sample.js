console.log("hoge")

document.addEventListener("turbolinks:load", function() {
    var eagle = document.getElementById("eagle");
    var birdie = document.getElementById("birdie");
    var par = document.getElementById("par");
    var boggy = document.getElementById("boggy");
    var double = document.getElementById("double_boggy");
    var triple = document.getElementById("triple-boggy");
    eagle.addEventListener('click', () => {
        document.getElementById("form_score").value = -2
    });
    birdie.addEventListener('click', () => {
        document.getElementById("form_score").value = -1
    });
    par.addEventListener('click', () => {
        document.getElementById("form_score").value = 0
    });
    boggy.addEventListener('click', () => {
        document.getElementById("form_score").value = 1
    });
    double_boggy.addEventListener('click', () => {
        document.getElementById("form_score").value = 2
    });
    triple_boggy.addEventListener('click', () => {
        document.getElementById("form_score").value = 3
    });
}, false);



document.addEventListener("turbolinks:load", function() {
    window.onload = function() {
        console.log("画面ロードされた")
        var urlParam = location.search.substring(1);
        console.log("パラメータは" + urlParam)
        if (urlParam == "search=&commit=Search" || urlParam == "") {
            console.log("paramsカラです")
            document.getElementById("search_result").style.display = "none"
        } else {
            console.log("params有り")
        }
    }
});