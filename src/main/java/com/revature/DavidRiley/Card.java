package com.revature.DavidRiley;

public class Card {
    private int cardId;
    private int cost;
    private int typeId;
    private String name;

    public Card(int cardId, int cost, int typeId, String name) {
        this.cardId = cardId;
        this.cost = cost;
        this.typeId = typeId;
        this.name = name;
    }

    public Card() {

    }

    @Override
    public String toString() {
        return "Card{" +
                "CardID='" + cardId + '\'' +
                ", cost=" + cost +
                ", typeId=" + typeId +
                "name='" + name + '\'' +
                '}';
    }

    public int getCardId() { return cardId; }
    public void setCardId(int cardId) { this.cardId = cardId; }
    public int getCost() { return cost; }
    public void setCost(int cost) { this.cost = cost; }
    public int getTypeId() { return typeId; }
    public void setTypeId(int typeId) { this.typeId = typeId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
