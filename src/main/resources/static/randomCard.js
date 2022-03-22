
// simple math expression that allows the Math.random() function to have a min-max window.
// In other words it is equivalent to Math.random(min,max)
let min = 479500;
let max =479800;
let multiverseId = Math.floor(Math.random() * (max-min) + min);
// let multiverseId = Math.floor(Math.random()*15000)+1;


// fetches the json data from /cards, then prints out the
fetch('/cards').then(card => {
    document.querySelector('#cardsDiv').innerHTML = listCard();
});

// lists the cards in the database to the screen by using the cards unique multiverse id in the url. Prints imagine of the card.
let listCard = function() {
    return '<img class="imageShadow" src="https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid='+multiverseId+'&type=card">'
    // return '<img src="https://scryfall.com/card/unf/"'+multiverseId+'>'
}

function goToButton(goToUrl) {
    window.location.href=goToUrl;
}