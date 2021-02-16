const { $ } = require("@rails/ujs");

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