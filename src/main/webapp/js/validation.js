let selectedButton = null;
function chooseX(button) {
    if (selectedButton !== null) {
        selectedButton.disabled = false;
    }
    selectedButton = button;
    selectedButton.disabled = true;
    document.getElementById("chosen-buttonX").value = button.value;
}

let selectedButton1 = null;
function chooseR(button) {
    if (selectedButton1 !== null) {
        selectedButton1.disabled = false;
    }
    selectedButton1 = button;
    selectedButton1.disabled = true;
    document.getElementById("chosen-buttonR").value = button.value;
}

let y = null
function validateY(){
    let yElem = document.getElementById("y");
    yElem.value= yElem.value.replace(",",".");
    let warning = document.getElementById("y-warning");
    if (isNaN(yElem.value) || yElem.value === "" || +yElem.value < -3 || 5 < +yElem.value) {
        warning.innerText = "Координата Y должна быть числом из диапазона (-3; 5)"
        warning.style.display = "inline-block"
        warning.style.color = "red"
        y = null
    } else {
        warning.style.display = "none"
        y = yElem.value
    }
}


function isCorrect() {
    let kx = document.getElementById("chosen-buttonX");
    let ky = document.getElementById("y");
    let kr = document.getElementById("chosen-buttonR");
    if (kx == null) return false;
    if (kr == null) return false;
    if (isNaN(kx.value) || kx.value === "") return false;
    if (isNaN(ky.value) || ky.value === "" || +ky.value < -3 || 5 < +ky.value) return false;
    return !(isNaN(kr.value) || kr.value === "" || +kr.value < 1 || 3 < +kr.value);

}


let svg = document.getElementById("svg")
let rWarning = document.getElementById("select-warning")
//let points = []

function svgClick(event, path) {
    let r = document.getElementById("chosen-buttonR").value;
    if (!isNaN(r) && r != null && r !== "") {
        let svgCoord = svg.getBoundingClientRect();
        rWarning.style.display = "none"

        let xPartOfSvg = (event.clientX - svgCoord.x)/svgCoord.width
        let yPartOfSvg = (event.clientY - svgCoord.y)/svgCoord.height
        drawPoint((xPartOfSvg) * 600, (yPartOfSvg) * 600)

        let x = (xPartOfSvg - 0.5) * 3 * r
        let y = -1 * (yPartOfSvg - 0.5) * 3 * r

        let xhr = new XMLHttpRequest();
        let url = new URL("http://localhost:8080" + path + "/ControllerServlet");
        url.searchParams.set("x", x.toString());
        url.searchParams.set("y", y.toString());
        url.searchParams.set("r", r.toString());
        url.searchParams.set("click", "click");
        xhr.open("POST", url, true);
        xhr.send();
        window.location.href = "http://localhost:8080" + path + "/index.jsp"

    } else {
        rWarning.innerText = "Невозможно определить координаты точек: выберите радиус"
        rWarning.style.display = "inline-block"
    }
}

function drawPoint(x, y){
    svg.innerHTML += "<circle cx='" + x + "' cy='" + y + "' r='7' fill='black'/>"
}

// Отправляем массив точек на сервер
/*function pointSubmit(path) {
    let r = document.getElementById("chosen-buttonR").value
    if (r != null) {
        let arr = JSON.stringify(points);
        let xhr = new XMLHttpRequest();
        let url = new URL("http://localhost:8080" + path + "/ControllerServlet");
        url.searchParams.set("points", arr);
        xhr.open("POST", url, false);
        xhr.send();
        window.location.href = "http://localhost:8080" + path + "/result.jsp"
    } else {
        rWarning.innerText = "Невозможно определить координаты точек: выберите радиус"
        rWarning.style.display = "inline-block"
    }

}*/
