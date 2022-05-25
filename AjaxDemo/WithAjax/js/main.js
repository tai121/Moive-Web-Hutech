function clickHandler() {
    let xhr = new XMLHttpRequest();

    xhr.open('GET', "Server/sayHello.txt", true)

    xhr.onreadystatechange = function() {
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