fetch('/cards').then(resp => resp.json()).then(cards => {
    document.querySelector('#cardsDiv').innerHTML = listCards(cards);
});

function listCards(json) {
    return `${json.map(listCard).join('\n')}`;
}

let listCard = function(card) {
    return '<p>' + card.cardId + ": " + card.cost + ": " + card.typeId + ": " + card.name + '</p>';
}

function postCard() {
    let card = {
        "cardId": document.getElementById("cardId").value,
        "cost": document.getElementById("cost").value,
        "typeId": document.getElementById("typeId").value,
        "name": document.getElementById("name").value
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