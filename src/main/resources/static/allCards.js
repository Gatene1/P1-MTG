// let welcomeMsg = 'Magic the Gathering Database';
// document.querySelector('h1').innerText = welcomeMsg;

// fetches the json data from /cards, then prints out the
fetch('/cards').then(resp => resp.json()).then(cards => {
    document.querySelector('#cardsDiv').innerHTML = listCards(cards);
});

function listCards(json) {
    return `${json.map(listCard).join('\n')}`;
}
// lists the cards in the database to the screen by using the cards unique multiverse id in the url. Prints imagine of the card.
let listCard = function(card) {
    return '<a href="/viewCard.html?scryfallId='+card.scryfallId+'"><img src="https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid='+card.multiverse+'&type=card"></a>';
}

function goToButton(goToUrl) {
    window.location.href=goToUrl;
}