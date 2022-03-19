let canvas = document.getElementById('addCardCanvas');
let canvasWidth = window.innerWidth * .40;
let canvasHeight = window.innerHeight * .50;
let ctx = canvas.getContext("2d");

let exCardImg = document.getElementById('exCardImg');
let parchmentImg = document.getElementById('parchmentNote');
let count = 0;

let exCardSettle = false;
let exCardPhase1 = false;
let exCardPhase2 = false;
let exCardPhase3 = false;
let parchmentPhase1 = false;

let exCardImageLeft = -15;
let parchmentImgLeft = -220;

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

    ColorRect(0,0, canvasWidth, canvasHeight, "Clear");
    ctx.drawImage(parchmentImg, parchmentImgLeft, window.innerHeight * .1435);
    ctx.drawImage(exCardImg, exCardImageLeft, window.innerHeight * .1);

    if (!exCardSettle && !exCardPhase1 && !exCardPhase2) {
        // if Example Card hasn't settled into place on the canvas.
        exCardImageLeft += 15;
        if (exCardImageLeft >= 300) {
            exCardSettle = true;
            exCardImageLeft -= 20;
        }
    }

    if (exCardSettle && !exCardPhase1 && !exCardPhase2) {
        // if exCard has gone as far from left as intended, but not gone toward left yet.
        exCardImageLeft -= 5;
        if (exCardImageLeft <= 230) {
            exCardPhase1 = true;
            exCardImageLeft += 8;
        }
    }

    if (exCardSettle && exCardPhase1 && !exCardPhase2) {
        // If card has gone as far from the left as intended, has gone a little more toward the left, but not travelled back.
        exCardImageLeft += 7;
        if (exCardImageLeft >= 300)
            exCardPhase2 = true;
    }

    if (exCardSettle && exCardPhase1 && exCardPhase2 && !exCardPhase3) {
        // If card has finished the longer routes, and needs to settle 3 points behind
        exCardImageLeft -= 5;
        if (exCardImageLeft <= 280) {
            exCardPhase3 = true;
            parchmentImgLeft = exCardImageLeft;
        }
    }

    if (exCardPhase3 && !parchmentPhase1) {
        parchmentImg.style.opacity += .25;
        parchmentImgLeft += 15;
        if (parchmentImgLeft >= 500)
            parchmentPhase1 = true;
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