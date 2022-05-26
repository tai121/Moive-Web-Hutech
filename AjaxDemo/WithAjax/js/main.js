function clickHandler() {
    let xhr = new XMLHttpRequest();

    xhr.open('GET', "Server/sayHello.txt", true)
    xhr.onreadystatechange = function () {
        console.log(xhr.readyState)
        if (xhr.readyState == 3) {
            var result = document.getElementById('result')
            var text = document.createTextNode(xhr.responseText);
            result.appendChild(document.createElement('br'));
            result.appendChild(text);
            result.appendChild(document.createElement('br'));
        }
        // result.innerHTML = xhr.responseText
    }
    xhr.send();
}
// ------------------------------------------------------------
// userinterface tao event roi tao doi tuong xmlhttprequest gui len server  
// roi server tra ve ket qua 
// luu du lieu lai vao file 
// load lai trang web
// ------------------------------------------------------------
//**submit get data save it into txt file then show them in page but add load fuction */
// ------------------------------------------------------------
function clickHandlerButLoad() {
    // var txt = document.createTextNode("Hello World!!!");
    // resultNotAjax.appendChild(txt);
    var resultNotAjax = document.getElementById('resultNotAjax');
    resultNotAjax.innerHTML = "Hello World";
    resultNotAjax.style.color = "red";
    setTimeout(() => {
        window.location.reload();
    }, 2000);
}

// ------------------------------------------------------------
// cd index.html
// ------------------------------------------------------------


// ------------------------------------------------------------
// cd left right
var i = 0;
var x;
displayCD(i);

function displayCD(i) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            myFunction(this, i);
        }
    };
    xmlhttp.open("GET", "Server/cd_catalog.xml", true);
    xmlhttp.send();
}

function myFunction(xml, i) {
    var xmlDoc = xml.responseXML;
    x = xmlDoc.getElementsByTagName("CD");
    document.getElementById("showCD").innerHTML =
        "Artist: " +
        x[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue +
        "<br>Title: " +
        x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue +
        "<br>Year: " +
        x[i].getElementsByTagName("YEAR")[0].childNodes[0].nodeValue;
}

function next() {
    if (i < x.length - 1) {
        i++;
        displayCD(i);
    }
}

function previous() {
    if (i > 0) {
        i--;
        displayCD(i);
    }
}
// ------------------------------------------------------------
function loadXMLDoc() {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            myFunctionLoad(this);
        }
    };
    xmlhttp.open("GET", "Server/cd_catalog.xml", true);
    xmlhttp.send();
}
function myFunctionLoad(xml) {
    var i;
    var xmlDoc = xml.responseXML;
    var table = "<tr><th>Artist</th><th>Title</th></tr>";
    var x = xmlDoc.getElementsByTagName("CD");
    for (i = 0; i < x.length; i++) {
        table += "<tr><td>" +
            x[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue +
            "</td><td>" +
            x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue +
            "</td></tr>";
    }
    document.getElementById("demo").innerHTML = table;
}
