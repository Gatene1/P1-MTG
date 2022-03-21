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
                         "ScryfallId" VARCHAR NOT NULL,
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

INSERT INTO "cards" VALUES (1,'3WB',1,'Naomi Pillar of Order','Joshua Raphael',6,548542,2,'4400fd66-1a24-47fb-bc94-37e0aae0e610');
INSERT INTO "cards" VALUES (2,'1UB',1,'Satoru Umezawa','Anna Pavleeva',6,548547,3,'8887f26d-b097-4fbc-9c48-bdc656409a32');
INSERT INTO "cards" VALUES (3,'1',2,'Sol Ring','Mike Bierek',7,509343,2,'880711b0-da06-4c4f-aa4e-1be58fc0bc67');
INSERT INTO "cards" VALUES (4,'U',3,'Fading Hope','Rovina Cai',4,534812,2,'c2fb1fff-12be-4bd5-8dba-c36e84d49651');
INSERT INTO "cards" VALUES (5,'8',4,'Ugin, the Spirit Dragon','Raymond Swanland',0,485324,4,'9c017fa9-7021-417a-9c2e-3df409644fcf');
INSERT INTO "cards" VALUES (6,'U',1,'Ruin Crab','Simon Dominic',4,491705,2,'738ce273-c938-42d2-83b2-c4f5f4000b0b');
INSERT INTO "cards" VALUES (7,'1U',5,'Maddening Cacophony','Magali Villeneuve',4,491697,3,'10a79733-702c-4611-b073-71db7f1158b2');
INSERT INTO "cards" VALUES (8,'1WB',1,'Greasefang, Okiba Boss','Victor Adame Minguez',6,548531,3,'56a0d43b-4d38-40a7-be6c-8324ab3bf773');
INSERT INTO "cards" VALUES (9,'2GU',1,'Grolnok,The Omnivore','Simon Dominic',8,541112,3,'ac6bae00-e965-4664-b3c7-d160949245a1');
INSERT INTO "cards" VALUES (10,'4GG',1,'Avabruck Caretaker','Heonhwa Choe',5,544749,4,'c0c358b4-5af2-438f-8bd5-beb0ee6b518b');
INSERT INTO "cards" VALUES (11,'2BB',4,'Sorin, the Mirthless','Bastien L. Deharme',2,544414,4,'cc7ff5f4-a7cc-41a1-a22b-8cf67ad18707');
INSERT INTO "cards" VALUES (12,'L',7,'Sokenzan, Crucible of Defiance','Lucas Staniec',3,551786,3,'aa548dcd-c1dd-492d-a69f-c65dfeef0633');
INSERT INTO "cards" VALUES (13,'L',7,'Otawara, Soaring City','Alayna Danner',4,551785,3,'486d7edc-d983-41f0-8b78-c99aecd72996');
INSERT INTO "cards" VALUES (14,'WUBRG',6,'Sanctum of All','Johannes Voss',6,488280,3,'ba91338c-1f6c-4b83-851f-98c3e9dea17b');
INSERT INTO "cards" VALUES (15,'GW',1,'Satsuki, the Living Lore','domco',5,552273,3,'a0dd5813-8c6e-4fa3-b11d-e13f14ce8c4e');
INSERT INTO "cards" VALUES (16,'3GGUU',1,'Koma, Cosmos Serpent','Jesper Ejsing',8,503837,4,'2de25ea4-284a-4c16-b823-048ff00c6a03');
INSERT INTO "cards" VALUES (17,'5BR',4,'Tibalt, Cosmic Imposter','Grzegorz Rutkowski',9,507137,4,'ea7e4c65-b4c4-4795-9475-3cba71c50ea5');
-- INSERT INTO "cards" VALUES (18,'U','Aegis Turtle','Milivoj Ceran',479559,1,'7003ebae-5d82-4360-ae63-0e51c37977ed');
-- INSERT INTO "cards" VALUES (19,'5UU','Archipelagore','Svetlin Velinov',479561,2,'f24b1030-64d5-4c94-a04c-1d9520bfddab');
-- INSERT INTO "cards" VALUES (20,'4BG','Back for More','Daarken',479697,2,'3fc7210c-da23-4cec-9195-4de75587f40f');
-- INSERT INTO "cards" VALUES (21,'2BGU','Brokkos, Apex of Forever','Filip Burburan',479699,4,'c9f07625-fbd8-4581-8568-eb3cfb2a4c1e');
-- INSERT INTO "cards" VALUES (22,'2UR','Channeled Force','Randy Vargas',479700,2,'8918d24e-8ae8-4028-9f06-ba6fafcc717e');
-- INSERT INTO "cards" VALUES (23,'BG','Chevill, Bane of Monsters','Yongjae Choi',479701,4,'fecbf0a3-ebe1-43b6-a720-462ba19002eb');
-- INSERT INTO "cards" VALUES (24,'4R','Cloudpiercer','Dan Scott',479632,1,'3ec5f005-d8fb-48b8-8ac5-74445cc83273');
-- INSERT INTO "cards" VALUES (25,'3U','Crystacean','Mathias Kollros',479566,1,'32afec8a-dbae-446e-919a-3efb556f5cb1');
-- INSERT INTO "cards" VALUES (26,'WBG','Deaths Oasis','Grzegors Rutkowski',479702,3,'112e2cca-bae7-4296-9514-e6058f4b38a5');
-- INSERT INTO "cards" VALUES (27,'WB','Dire Tactics','Daarken',479703,2,'e0e3974e-3753-4f25-8930-6d96b40332ce');
-- INSERT INTO "cards" VALUES (28,'2BB','Dirge Bat','Paul Scott Canavan',479604,3,'59677c76-8148-4b6f-95b0-0e3ccf137a3f');
-- INSERT INTO "cards" VALUES (29,'BBGGGUU','Emergent Ultimatum','Zach Stella',479705,3,'3a6a52ab-6d38-4429-9969-90064e615152');
-- INSERT INTO "cards" VALUES (30,'WWBBBGG','Eerie Ultimatum','Jason A. Engle',479704,3,'3a9fb2db-228f-4d48-acdf-6330baf356c7');
-- INSERT INTO "cards" VALUES (31,'GGUUURR','Genesis Ultimatum','Jason Rainville',479709,3,'556dfe7a-43e8-4801-ad79-89ab2148eca6');
-- INSERT INTO "cards" VALUES (32,'UURRRWW','Inspired Ultimatum','Tyler Jacobson',479711,3,'dd64f064-8f05-41ef-b95b-1b723137f846');
-- INSERT INTO "cards" VALUES (33,'B/U B/U','Cunning Nightbonder','Ekaterina Burmak',479739,2,'adb202e7-f9a4-4785-840d-18aa6aa663b4');
-- INSERT INTO "cards" VALUES (34,'1U','Essence Scatter','Seb McKinnon',479569,1,'5f79c8a0-291e-4e13-b765-4cf8c726cf30');
-- INSERT INTO "cards" VALUES (35,'4BU','Gyruda, Doom of Depths','Tyler Jacobson',479741,3,'97eb1804-6fd8-4917-af36-87fdfce39d3a');
-- INSERT INTO "cards" VALUES (36,'L','Indatha Triome','Noah Bradley',479768,3,'2b74bb81-fb9a-40e5-a941-e517430b52f5');
-- INSERT INTO "cards" VALUES (37,'4R/G','Jegantha, the Wellspring','Chris Rahn',479742,3,'1d52e527-3835-4350-8c01-0f2d5d623b9c');
-- INSERT INTO "cards" VALUES (38,'1GW','Kaheera, the Orphanguard','Ryan Pancoast',479744,3,'d4ebed0b-8060-4a7b-a060-5cfcd2172b16');
-- INSERT INTO "cards" VALUES (39,'2GUR','Illuna, Apex of Wishes','Chris Rahn','479710',4,'9fc99c81-d112-4811-9bba-77a14d904692');
-- INSERT INTO "cards" VALUES (40,'3GU','Keruga, the Macrosage','Dan Scott',479745,3,'a90ee952-de7a-420f-993c-a38db89bc8ac');
-- INSERT INTO "cards" VALUES (41,'L','Ketria Triome','Sam Burley',479770,3,'a249b1f4-2b22-4b67-a207-e0c4ae95d2e1');
-- INSERT INTO "cards" VALUES (42,'GU','Kinnan, Bonder Prodigy','Jason Rainville',479712,4,'63cda4a0-0dff-4edb-ae67-a2b7e2971350');
-- INSERT INTO "cards" VALUES (43,'3GGG','Kogla, the Titan Ape','Chris Rahn',479682,3,'3c35ca79-eb72-427a-a8ed-404b2214389a');
-- INSERT INTO "cards" VALUES (44,'BR','Labyrinth Raptor','Daarken',479713,3,'c608543d-cb60-44c3-a437-e4a18c311420');
-- INSERT INTO "cards" VALUES (45,'3RR','Lukka, Coppercoat Outcast','Chris Rallis',479645,4,'5798fdf0-d178-43d9-b821-8f3f654654b4');
-- INSERT INTO "cards" VALUES (46, '1UR','Lore Drakkis','Lucas Graciano',479714,2,'83e035ca-eccd-4b63-817c-f2c676b9c98d');
-- INSERT INTO "cards" VALUES (47, '1WB','Lurrus of the Dream-Den','Slawomir Maniak',479746,3,'5ad36fb2-c44e-4085-ba0d-54277841ad3a');
-- INSERT INTO "cards" VALUES (48, '1UR','Lutri, the Spellchaser','Lie Setiawan',479747,3,'fb1189c9-7842-466e-8238-1e02677d8494');
-- INSERT INTO "cards" VALUES (49,'2GG','Mythos of Brokkos','Seb Mckinnon',479688,3,'fa4fc5b1-6666-4c60-898f-f927212c7923');
-- INSERT INTO "cards" VALUES (50,'2UU','Mythos of Illuna','Seb McKinnon',479578,3,'f1b07082-c5a5-4283-a2f5-5b1e0120d752');
-- INSERT INTO "cards" VALUES (51,'2B','Mythos of Nethroi','Seb Mckinnon',479617,3,'6abc24e1-e721-471a-9efd-547f320675b0');
-- INSERT INTO "cards" VALUES (52,'2WW','Mythos of Snapdax','Seb Mckinnon',479544,3,'2712a1a3-dd28-44c8-a661-5bcf68d3acaa');
-- INSERT INTO "cards" VALUES (53,'2RR','Mythos of Vadrok','Seb Mckinnon',479647,3,'2bbe99a7-3b58-4f23-bf86-e1e35b0bec2e');
-- INSERT INTO "cards" VALUES (54,'1URW','Narset of the Ancient Way','Yongjae Choi',479715,4,'fa7b28d8-b835-44a0-978d-cadfd392fff5');
-- INSERT INTO "cards" VALUES (55,'1WB','Necropanther','Jason A. Engle',479716,2,'2e1ed055-8988-4625-9d57-8ce8a4e04aea');
-- INSERT INTO "cards" VALUES (56,'2WBG','Nethroi, Apex of Death','Slawomir Maniak',479717,4,'8ca6eb5a-8bc9-4091-bcfb-b207f0afd188');
-- INSERT INTO "cards" VALUES (57,'3RU','Obosh, the Preypiercer','Daarken',479748,3,'451507de-9c42-43ee-b9ba-1f69e9aa29d2');
-- INSERT INTO "cards" VALUES (58,'2U','Of One Mind','Matt Stewart',479580,1,'c95fb136-f21d-4f3a-82b7-bcf490b7e90c');
-- INSERT INTO "cards" VALUES (59,'2RWB','Offsprings Revenge','Daarken',479718,3,'78619ffb-f514-4f9f-9d77-3ab49e045f7c');
-- INSERT INTO "cards" VALUES (60,'2U','Ominous Seas','Vincent Proce',479581,2,'ce8965f2-756a-4461-a643-db024a11c2de');
-- INSERT INTO "cards" VALUES (61,'2GU','Parcelbeast','Milivoj Ceran',479719,2,'610bb98c-d66a-44cc-92e2-a80d700b59e4');
-- INSERT INTO "cards" VALUES (62,'2U','Phase Dolphin','Lie Setiawan',479582,1,'88fb4042-e9c1-4b0f-b1f6-4180b0d79663');
-- INSERT INTO "cards" VALUES (63,'1G','Plummet','Sidharth Chaturvedi',479689,1,'d884b2f2-946e-4d5d-b8cf-ef035726a188');
-- INSERT INTO "cards" VALUES (64,'4U','Pouncing Shoreshark','Dan Scott',479584,2,'c859b339-b55b-41fe-948c-27502e3b3ea8');
-- INSERT INTO "cards" VALUES (65,'1GU','Primal Empathy','Micah Epstein',479720,2,'656c2277-7420-4e4d-bed5-3683ec1c70de');
-- INSERT INTO "cards" VALUES (66,'2WR','Proud Wildbonder','Dmitry Burmak',479749,2,'f4876e17-a206-4351-9c0b-0845db4569a3');
-- INSERT INTO "cards" VALUES (67,'3R','Pyroceratops','Jason A. Engle',479650,1,'f6599645-dbb5-4174-bd26-8556af6d89c3');
-- INSERT INTO "cards" VALUES (68,'2RRG','Quartzwood Crasher','Antonio Jose Manzanedo',479721,3,'c8e4c609-19c9-433b-a852-7999e375ee4f');
-- INSERT INTO "cards" VALUES (69,'1R','Raking Claws','Slawomir Maniak',479651,1,'6eb0d9a2-f9bb-4d8e-a1ca-896c42f8ad56');
-- INSERT INTO "cards" VALUES (70,'1G','Ram Through','Zoltan Boros',479690,1,'ac0b24e7-14e7-45ee-b5d8-bdb8674b669c');
-- INSERT INTO "cards" VALUES (71,'L','Raugrin Triome','Jonas De Ro',479771,3,'02138fbb-3962-4348-8d31-faaefba0b8b2');
-- INSERT INTO "cards" VALUES (72,'2UU','Reconnaissance Mission','Johannes Voss',479585,2,'b2364119-d764-4ef1-86cf-a0b7a5ae1b38');
-- INSERT INTO "cards" VALUES (73,'RW','Regal Leosaur','Ilse Gort',479722,2,'b6fdf313-740b-4976-911f-9fb5eb54afce');
-- INSERT INTO "cards" VALUES (74,'2R','Reptilian Reflection','Antonio Jose Manzanedo',479652,2,'7871b4dd-9085-4a3f-a1ae-9a292f73689b');
-- INSERT INTO "cards" VALUES (75,'1UR','Rielle, the Everwise','Yongjae Choi',479723,4,'5f03c944-1929-4cb2-a373-d57eefa29ed1');
-- INSERT INTO "cards" VALUES (76,'4R','Rooting Moloch','Andrey Kuzinskiy',479653,2,'cc2fd581-5cf8-4154-90dd-922afddcd556');
-- INSERT INTO "cards" VALUES (77,'L','Rugged Highlands','Adam Paquette',479722,1,'58d511be-60e0-4755-abec-18eebb530605');
-- INSERT INTO "cards" VALUES (78,'RRWWWBB','Ruinous Ultimatum','Chase Stone',479724,3,'50c1d6ca-7789-46b5-bc89-85cc3915cb85');
-- INSERT INTO "cards" VALUES (79,'RW','Savai Thundermane','Svetlin Velinov',479725,2,'73d3925c-cf7d-4546-bc70-33f04d4b7566');