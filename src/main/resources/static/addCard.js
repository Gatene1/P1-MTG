let nameBoxOnCard = document.getElementById("name");
let nameBoxInDiv = document.getElementById("cardName");
let flavorTextInDiv = document.getElementById('cardDescription');
let flavorTextOnCard = document.getElementById('frame-text-box');
let cardTypeOnCard = document.getElementById('typeOfCard');
let cardTypeInDiv = document.getElementById('cardType');
let cardBgOnCard = document.getElementById('cardBg');
let cardBgInDiv = document.getElementById('cardBgDiv');
let backgroundImage = window.getComputedStyle(cardBgOnCard, false).backgroundImage;
let splitBackgroundImage = backgroundImage.slice(27, -1).replace(/"/g, "");
let manaCostInDiv = document.getElementById("cardManaCost");
let manaOnCard1 = document.getElementById("mana1");
let manaOnCard2 = document.getElementById("mana2");
let manaOnCard3 = document.getElementById("mana3");
let manaOnCard4 = document.getElementById("mana4");
let manaOnCard5 = document.getElementById("mana5");
let cardAddTextArea = document.getElementById('cardAddStartDiv');
let cardTypeTranslated;
let colorIdentityTranslated = 0;


let blueMana = '9bc5ef';
let blackMana = 'e1d5d9';
let redMana = 'f8ac95';
let greenMana = 'ADD3AC';
let whiteMana = 'fffff1';

window.onload = function() {
    flavorTextInDiv.value = flavorTextOnCard.innerHTML;
    cardTypeInDiv.value = cardTypeOnCard.innerHTML;
    nameBoxInDiv.value = nameBoxOnCard.innerHTML;

    switch(splitBackgroundImage) {
        case "red-background.jpg":
            cardBgInDiv.value = "0";
            break;
        case "black-background.jpg":
            cardBgInDiv.value = "1";
            break;
        case "blue-background.jpg":
            cardBgInDiv.value = "2";
            break;
        case "green-background.jpg":
            cardBgInDiv.value = "Green";

            break;
        case "white-background.jpg":
            cardBgInDiv.value = "4";
            break;
    }
}

function submitCard() {
    alert(cardCount.value);
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
    //alert(window.getComputedStyle(cardBgOnCard, false).backgroundImage);
    switch (cardBgInDiv.value) {
        case "Red":
            cardBgOnCard.style.background = "url('red-background.jpg') no-repeat";
            cardBgOnCard.style.backgroundSize = "cover";
            break;
        case "Green":
            cardBgOnCard.style.background = "url('green-background.jpg') no-repeat";
            cardBgOnCard.style.backgroundSize = "cover";
            break;
        case "Blue":
            cardBgOnCard.style.background = "url('blue-background.jpg') no-repeat";
            cardBgOnCard.style.backgroundSize = "cover";
            break;
        case "Black":
            cardBgOnCard.style.background = "url('black-background.jpg') no-repeat";
            cardBgOnCard.style.backgroundSize = "cover";
            break;
        case "White":
            cardBgOnCard.style.background = "url('white-background.jpg') no-repeat";
            cardBgOnCard.style.backgroundSize = "cover";
            break;
    }
}

function ChangeManaPool() {
//manaCostInDiv.value
    //blueMana

    let manaOnCard1 = document.getElementById("mana1");
    let manaOnCard2 = document.getElementById("mana2");
    let manaOnCard3 = document.getElementById("mana3");
    let manaOnCard4 = document.getElementById("mana4");
    let manaOnCard5 = document.getElementById("mana5");
    let forManaCount = manaCostInDiv.value.toString().length;

    for (let i=1; i <= forManaCount; i++){
        switch (forManaCount) {

        }
    }

    switch(manaCostInDiv.value.toString().length) {
        case 1:
            ChangeMana1();
            break;
        case 2:
            ChangeMana1();
            ChangeMana2();
            break;
        case 3:
            ChangeMana1();
            ChangeMana2();
            ChangeMana3();
            break;
        case 4:
            ChangeMana1();
            ChangeMana2();
            ChangeMana3();
            ChangeMana4();
            break;
        case 5:
            ChangeMana1();
            ChangeMana2();
            ChangeMana3();
            ChangeMana4();
            ChangeMana5();
    }

}

function ChangeMana1(){
    alert(manaCostInDiv.value.toString().substring(manaCostInDiv.value.toString().length - 1));
    switch (manaCostInDiv.value.toString().substring(manaCostInDiv.value.toString().length - 1)) {
        case "U":
            manaOnCard5.setAttribute("class","mana-iconBlue");
            manaOnCard5.src="u.png";
            manaOnCard1.setAttribute("class","");
            manaOnCard1.src="";
            manaOnCard2.setAttribute("class","");
            manaOnCard2.src="";
            manaOnCard3.setAttribute("class","");
            manaOnCard3.src="";
            manaOnCard4.setAttribute("class","");
            manaOnCard4.src="";
            break;
        case "R":
            manaOnCard5.setAttribute("class","mana-iconRed");
            manaOnCard5.src="r.png";
            manaOnCard1.setAttribute("class","");
            manaOnCard1.src="";
            manaOnCard2.setAttribute("class","");
            manaOnCard2.src="";
            manaOnCard3.setAttribute("class","");
            manaOnCard3.src="";
            manaOnCard4.setAttribute("class","");
            manaOnCard4.src="";
            break;
        case "B":
            manaOnCard5.setAttribute("class","mana-iconBlack");
            manaOnCard5.src="b.png";
            manaOnCard1.setAttribute("class","");
            manaOnCard1.src="";
            manaOnCard2.setAttribute("class","");
            manaOnCard2.src="";
            manaOnCard3.setAttribute("class","");
            manaOnCard3.src="";
            manaOnCard4.setAttribute("class","");
            manaOnCard4.src="";
            break;
        case "G":
            manaOnCard5.setAttribute("class","mana-iconGreen");
            manaOnCard5.src="g.png";
            manaOnCard1.setAttribute("class","");
            manaOnCard1.src="";
            manaOnCard2.setAttribute("class","");
            manaOnCard2.src="";
            manaOnCard3.setAttribute("class","");
            manaOnCard3.src="";
            manaOnCard4.setAttribute("class","");
            manaOnCard4.src="";
            break;
        case "W":
            manaOnCard5.setAttribute("class","mana-iconWhite");
            manaOnCard5.src="w.png";
            manaOnCard1.setAttribute("class","");
            manaOnCard1.src="";
            manaOnCard2.setAttribute("class","");
            manaOnCard2.src="";
            manaOnCard3.setAttribute("class","");
            manaOnCard3.src="";
            manaOnCard4.setAttribute("class","");
            manaOnCard4.src="";
            break;
    }
}
function ChangeMana2(){
    alert(manaCostInDiv.value.toString().substring(manaCostInDiv.value.toString().length-2).substring(0,1));
    switch (manaCostInDiv.value.toString().substring(manaCostInDiv.value.toString().length-2).substring(0,1)) {
        case "U":
            manaOnCard4.setAttribute("class","mana-iconBlue");
            manaOnCard4.src="u.png";
            break;
        case "R":
            manaOnCard4.setAttribute("class","mana-iconRed");
            manaOnCard4.src="r.png";
            break;
        case "B":
            manaOnCard4.setAttribute("class","mana-iconBlack");
            manaOnCard4.src="b.png";
            break;
        case "G":
            manaOnCard4.setAttribute("class","mana-iconGreen");
            manaOnCard4.src="g.png";
            break;
        case "W":
            manaOnCard4.setAttribute("class","mana-iconWhite");
            manaOnCard4.src="w.png";
            break;
    }
}
function ChangeMana3(){
    alert(manaCostInDiv.value.toString().substring(manaCostInDiv.value.toString().length-3).substring(0,1));
    switch (manaCostInDiv.value.toString().substring(manaCostInDiv.value.toString().length-3).substring(0,1)) {
        case "U":
            manaOnCard3.setAttribute("class","mana-iconBlue");
            manaOnCard3.src="u.png";
            break;
        case "R":
            manaOnCard3.setAttribute("class","mana-iconRed");
            manaOnCard3.src="r.png";
            break;
        case "B":
            manaOnCard3.setAttribute("class","mana-iconBlack");
            manaOnCard3.src="b.png";
            break;
        case "G":
            manaOnCard3.setAttribute("class","mana-iconGreen");
            manaOnCard3.src="g.png";
            break;
        case "W":
            manaOnCard3.setAttribute("class","mana-iconWhite");
            manaOnCard3.src="w.png";
            break;
    }
}
function ChangeMana4(){
    alert(manaCostInDiv.value.toString().substring(manaCostInDiv.value.toString().length-4).substring(0,1));
    switch (manaCostInDiv.value.toString().substring(manaCostInDiv.value.toString().length-4).substring(0,1)) {
        case "U":
            manaOnCard2.setAttribute("class","mana-iconBlue");
            manaOnCard2.src="u.png";
            break;
        case "R":
            manaOnCard2.setAttribute("class","mana-iconRed");
            manaOnCard2.src="r.png";
            break;
        case "B":
            manaOnCard2.setAttribute("class","mana-iconBlack");
            manaOnCard2.src="b.png";
            break;
        case "G":
            manaOnCard2.setAttribute("class","mana-iconGreen");
            manaOnCard2.src="g.png";
            break;
        case "W":
            manaOnCard2.setAttribute("class","mana-iconWhite");
            manaOnCard2.src="w.png";
            break;
    }
}
function ChangeMana5(){
    alert(manaCostInDiv.value.toString().substring(manaCostInDiv.value.toString().length-5).substring(0,1));
    switch (manaCostInDiv.value.toString().substring(manaCostInDiv.value.toString().length-5).substring(0,1)) {
        case "U":
            manaOnCard1.setAttribute("class","mana-iconBlue");
            manaOnCard1.src="u.png";
            break;
        case "R":
            manaOnCard1.setAttribute("class","mana-iconRed");
            manaOnCard1.src="r.png";
            break;
        case "B":
            manaOnCard1.setAttribute("class","mana-iconBlack");
            manaOnCard1.src="b.png";
            break;
        case "G":
            manaOnCard1.setAttribute("class","mana-iconGreen");
            manaOnCard1.src="g.png";
            break;
        case "W":
            manaOnCard1.setAttribute("class","mana-iconWhite");
            manaOnCard1.src="w.png";
            break;
    }
}

function postCreation() {



    switch(cardTypeInDiv.value) {
        case "White":
            colorIdentityTranslated = 1;
            break;
        case "Black":
            colorIdentityTranslated = 2;
            break;
        case "Red":
            colorIdentityTranslated = 3;
            break;
        case "Blue":
            colorIdentityTranslated = 4;
            break;
        case "Green":
            colorIdentityTranslated = 5;
            break;
    }

    if (cardTypeInDiv.value.toString().includes("Creature")) cardTypeTranslated = 1;
    if (cardTypeInDiv.value.toString().includes("Artifact")) cardTypeTranslated = 2;
    if (cardTypeInDiv.value.toString().includes("Instant")) cardTypeTranslated = 3;
    if (cardTypeInDiv.value.toString().includes("Planeswalker")) cardTypeTranslated = 4;
    if (cardTypeInDiv.value.toString().includes("Sorcery")) cardTypeTranslated = 5;
    if (cardTypeInDiv.value.toString().includes("Enchantment")) cardTypeTranslated = 6;
    if (cardTypeInDiv.value.toString().includes("Land")) cardTypeTranslated = 7;

    fetch('/cards').then(resp => resp.json()).then(cards => {
        document.querySelector('#cardAddStartText').innerHTML = ListCards(cards);
    });

    let ListCards = function(card) {
        return '<p>' + card.cardId + ": " + card.name + '</p>';
    }

// These fields come from the Class' class variables.
    let cardToAdd = {
        "cardId": 97,
        "typeId": cardTypeTranslated,
        "cost": manaCostInDiv.value,
        "name": nameBoxInDiv.value,
        "artist": "Add-A-Card",
        "colorIdentity": colorIdentityTranslated,
        "multiverse": 0,
        "rarity": 4,
        "scryfallId": "0"

    };
    fetch("/cards", {
        method:"POST",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(cardToAdd)
    }).then((result) => {
        if (result.status != 200) {
            throw new Error("Bad Server Response.");
        }
    }).catch((error) => { console.log(error); })
    fetch('/cards').then(resp => resp.json()).then(cards => {
        document.querySelector('#cardAddStartText').innerHTML = ListCards(cards);
    });

    //window.document.location.reload();

}


function goToButton(goToUrl) {
    window.location.href=goToUrl;
}

//manaOnCard1.setAttribute("class", "mana-iconBlue");

