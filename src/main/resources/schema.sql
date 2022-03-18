CREATE TABLE "types" (
    "TypesId" INT PRIMARY KEY NOT NULL,
    "Type"    VARCHAR NOT NULL
);

CREATE TABLE "coloridentity" (
     "TypesId" INT NOT NULL PRIMARY KEY,
     "Type" VARCHAR NOT NULL
);
CREATE TABLE "rarity" (
     "TypesId" INT NOT NULL PRIMARY KEY,
     "Type" VARCHAR NOT NULL
);

CREATE TABLE "cards" (
                         "CardId" INT NOT NULL,
                         "ManaCost" VARCHAR NOT NULL,
                         "TypeId" VARCHAR NOT NULL,
                         "Name" VARCHAR NOT NULL,
                         "Artist" VARCHAR NOT NULL,
                         "ColorIdentity" VARCHAR NOT NULL,
                         "Multiverse" LONG NOT NULL,
                         "Rarity" VARCHAR NOT NULL,
                         "Power" INT NOT NULL,
                         "Toughness" INT NOT NULL,
 CONSTRAINT "FK_TypeId" FOREIGN KEY ("TypeId") REFERENCES "types" ("TypesId") ON DELETE NO ACTION ON UPDATE NO ACTION,
 CONSTRAINT "FK_ColorIdentity" FOREIGN KEY ("ColorIdentity") REFERENCES "coloridentity" ("TypesId") ON DELETE NO ACTION ON UPDATE NO ACTION,
 CONSTRAINT "FK_Rarity" FOREIGN KEY ("Rarity") REFERENCES "rarity" ("TypesId") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "IFK_TypesId" ON "types" ("TypesId");

INSERT INTO "types" VALUES (1, 'Creature');
INSERT INTO "types" VALUES (2, 'Artifact');
INSERT INTO "types" VALUES (3, 'Instant');
INSERT INTO "types" VALUES (4, 'Planeswalker');
INSERT INTO "types" VALUES (5, 'Sorcery');
INSERT INTO "types" VALUES (6, 'Enchantment');
INSERT INTO "types" VALUES (7, 'Land');

INSERT INTO "coloridentity" VALUES (0, 'X');
INSERT INTO "coloridentity" VALUES (1, 'White');
INSERT INTO "coloridentity" VALUES (2, 'Black');
INSERT INTO "coloridentity" VALUES (3, 'Red');
INSERT INTO "coloridentity" VALUES (4, 'Blue');
INSERT INTO "coloridentity" VALUES (5, 'Green');
INSERT INTO "coloridentity" VALUES (6, 'Gold');
INSERT INTO "coloridentity" VALUES (7, 'Colorless');
INSERT INTO "coloridentity" VALUES (8, 'Green/Blue');
INSERT INTO "coloridentity" VALUES (9, 'Black/Red');

INSERT INTO "rarity" VALUES (1, 'Common');
INSERT INTO "rarity" VALUES (2, 'Uncommon');
INSERT INTO "rarity" VALUES (3, 'Rare');
INSERT INTO "rarity" VALUES (4, 'Mythic');

INSERT INTO "cards" VALUES (1,'3WB',1,'Naomi Pillar of Order','Joshua Raphael',6,548542,2,4,4);
INSERT INTO "cards" VALUES (2,'1UB',1,'Satoru Umezawa','Anna Pavleeva',6,548547,3,2,4);
INSERT INTO "cards" VALUES (3,'1',2,'Sol Ring','Mike Bierek',7,554243,2,0,0);
INSERT INTO "cards" VALUES (4,'U',3,'Fading Hope','Rovina Cai',4,534812,2,0,0);
INSERT INTO "cards" VALUES (5,'8',4,'Ugin, the Spirit Dragon','Raymond Swanland',0,485324,4,7,7);
INSERT INTO "cards" VALUES (6,'U',1,'Ruin Crab','Simon Dominic',4,491705,2,0,3);
INSERT INTO "cards" VALUES (7,'1U',5,'Maddening Cacophony','Magali Villeneuve',4,491697,3,0,0);
INSERT INTO "cards" VALUES (8,'1WB',1,'Greasefang, Okiba Boss','Victor Adame Minguez',6,548531,3,4,3);
INSERT INTO "cards" VALUES (9,'2GU',1,'Grolnok,The Omnivore','Simon Dominic',8,541112,3,3,3);
INSERT INTO "cards" VALUES (10,'4GG',1,'Avabruck Caretaker','Heonhwa Choe',5,544749,4,4,4);
INSERT INTO "cards" VALUES (11,'2BB',4,'Sorin, the Mirthless','Bastien L. Deharme',2,544414,4,4,4);
INSERT INTO "cards" VALUES (12,'L',7,'Sokenzan, Crucible of Defiance','Lucas Staniec',3,551786,3,0,0);
INSERT INTO "cards" VALUES (13,'L',7,'Otawara, Soaring City','Alayna Danner',4,551785,3,0,0);
INSERT INTO "cards" VALUES (14,'WUBRG',6,'Sanctum of All','Johannes Voss',6,488280,3,0,0);
INSERT INTO "cards" VALUES (15,'GW',1,'Satsuki, the Living Lore','domco',5,552273,3,1,3);
INSERT INTO "cards" VALUES (16,'3GGUU',1,'Koma, Cosmos Serpent','Jesper Ejsing',8,503837,4,6,6);
INSERT INTO "cards" VALUES (17,'5BR',4,'Tibalt, Cosmic Imposter','Grzegorz Rutkowski',9,507137,4,5,5);