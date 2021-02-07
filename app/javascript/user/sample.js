console.log("hoge")

document.addEventListener("DOMContentLoaded", function() {
    var hoge = document.getElementById("eagle");
    hoge.addEventListener('click', () => {
        console.log('Hello');
    });
}, false);