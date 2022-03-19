let min = 479525;
let max =479800;

let multiverseId = Math.floor(Math.random() * (max-min) + min);
// let multiverseId = Math.floor(Math.random()*15000)+1;
// fetches the json data from /cards, then prints out the
fetch('/cards').then(resp => resp.json()).then(cards => {
    document.querySelector('#cardsDiv').innerHTML = listCard();
});


function listCards(json) {
    return `${json.map(listCard).join('\n')}`;
}
// lists the cards in the database to the screen by using the cards unique multiverse id in the url. Prints imagine of the card.
let listCard = function() {
    return '<img src="https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid='+multiverseId+'&type=card">'
    // return '<img src="https://scryfall.com/card/unf/"'+multiverseId+'>'
}
//https://scryfall.com/card/unf/277/hallowed-fountain