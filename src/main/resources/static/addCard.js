let nameBoxOnCard = document.getElementById("name");
let nameBoxInDiv = document.getElementById("cardName");
let manaCostInDiv = document.getElementById("cardManaCost");
let manaOnCard1 = document.getElementById("mana1");
let manaOnCard2 = document.getElementById("mana2");
let manaOnCard3 = document.getElementById("mana3");
let manaOnCard4 = document.getElementById("mana4");
let manaOnCard5 = document.getElementById("mana5");
let flavorTextInDiv = document.getElementById('cardDescription');
let flavorTextOnCard = document.getElementById('frame-text-box');
let cardTypeOnCard = document.getElementById('typeOfCard');
let cardTypeInDiv = document.getElementById('cardType');
let cardBgOnCard = document.querySelector('cardBg');
let cardBgInDiv = document.getElementById('cardBgDiv');

let blueMana = '9bc5ef';
let blackMana = 'e1d5d9';
let redMana = 'f8ac95';
let greenMana = 'ADD3AC';
let whiteMana = 'fffff1';

window.onload = function() {
    flavorTextInDiv.value = flavorTextOnCard.innerHTML;
    cardTypeInDiv.value = cardTypeOnCard.innerHTML;
    nameBoxInDiv.value = nameBoxOnCard.innerHTML;
    alert(window.getComputedStyle(cardBgOnCard, false).backgroundImage);
}

function ChangeNameOnCard() {
    nameBoxOnCard.innerHTML = nameBoxInDiv.value;

}
function ChangeFlavorText() {
    // let lines = flavorTextInDiv.value.split('\n');
    // for (let i=0; i < lines.length; i++)
    flavorTextOnCard.innerHTML = flavorTextInDiv.value;
}

function ChangeCardType() {
    cardTypeOnCard.innerHTML = cardTypeInDiv.value;
}

function ChangeColor() {
    switch (cardBgInDiv.value) {
        case "Red":
            alert("changed to red");
            cardBgOnCard.src="red-background.jpg";
            break;
    }
}

