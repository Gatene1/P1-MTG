let canvas = document.getElementById('addCardCanvas');
let canvasWidth = window.innerWidth * .40;
let canvasHeight = window.innerHeight * .50;
let ctx = canvas.getContext("2d");

let exCardImg = document.getElementById('exCardImg');
let count = 0;

let exCardSettle = false;

let exCardImageLeft = -15;

fetch('/cards').then(resp => resp.json()).then(cards => {
    document.querySelector('#cardsDiv').innerHTML = listCards(cards);
});

window.onload = function() {
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;

    let fps = 30;
    setInterval(DrawImage, 1000/fps);
}

function ColorRect (leftX, topY, boxWidth, boxHeight, fillColor) {
    if (fillColor != "Clear") {
        ctx.fillStyle = fillColor;
        ctx.fillRect(leftX, topY, boxWidth, boxHeight);
    } else
        ctx.reset();
}

function DrawImage() {

    if (!exCardSettle) {
        // if Example Card hasn't settled into place on the canvas.
        ColorRect(0,0, canvasWidth, canvasHeight, "Clear");
        ctx.drawImage(exCardImg, exCardImageLeft, window.innerHeight * .1);
        exCardImageLeft += 15;
        exCardSettle = exCardImageLeft >= 300;
    }
}

function listCards(json) {
    return `${json.map(listCard).join('\n')}`;
}

let listCard = function(card) {
    // return '<image src="https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid='+card.multiverse+'&type=card">';
    // return '<p>' + card.cardId + ": " + card.cost + ": " + card.typeId + ": " + card.name + ": " + card.artist + ": " +
    //     card.colorIdentity + ": " + card.multiverse + ": " + card.rarity + ": " + card.power + ": " + card.toughness + '</p>';
}

function addCardButton(gotoURL) {
    window.location.href = gotoURL;
}

function postCard() {
    let card = {
        "cardId": document.getElementById("cardId").value,
        "cost": document.getElementById("cost").value,
        "typeId": document.getElementById("typeId").value,
        "name": document.getElementById("name").value,
    }
    console.log(card);
    fetch("/cards", {
        method: "POST",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(card)
    }).then((result) => {
        if (result.status != 200) {
            throw new Error("Bad Server Response");
        }
        console.log(result.text());
    }).catch((error) => { console.log(error); })
    fetch('/cards').then(resp => resp.json()).then(cards => {
            document.querySelector('#cardsDiv').innerHTML = listCards(cards);
        }
    );
    window.document.location.reload();
}