fetch('/cards').then(resp => resp.json()).then(cards => {
    document.querySelector('#cardsDiv').innerHTML = listCards(cards);
});

function listCards(json) {
    return `${json.map(listCard).join('\n')}`;
}

let listCard = function(card) {
    return '<image src="https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid='+card.multiverse+'&type=card">';
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