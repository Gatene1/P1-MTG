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
     "Type" INT NOT NULL
);

CREATE TABLE "cards" (
                         "CardId" INT PRIMARY KEY NOT NULL,
                         "TypeId" INT NOT NULL,
                         "ManaCost" VARCHAR NOT NULL,
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

INSERT INTO "cards" VALUES (1,1,'3WB','Naomi Pillar of Order','Joshua Raphael',0,548542,2,'4400fd66-1a24-47fb-bc94-37e0aae0e610');
INSERT INTO "cards" VALUES (2,1,'1UB','Satoru Umezawa','Anna Pavleeva',0,548547,3,'8887f26d-b097-4fbc-9c48-bdc656409a32');
INSERT INTO "cards" VALUES (3,2,'1','Sol Ring','Mike Bierek',7,509343,2,'880711b0-da06-4c4f-aa4e-1be58fc0bc67');
INSERT INTO "cards" VALUES (4,3,'U','Fading Hope','Rovina Cai',4,534812,2,'c2fb1fff-12be-4bd5-8dba-c36e84d49651');
INSERT INTO "cards" VALUES (5,4,'8','Ugin, the Spirit Dragon','Raymond Swanland',7,485324,4,'9c017fa9-7021-417a-9c2e-3df409644fcf');
INSERT INTO "cards" VALUES (6,1,'U','Ruin Crab','Simon Dominic',4,491705,2,'738ce273-c938-42d2-83b2-c4f5f4000b0b');
INSERT INTO "cards" VALUES (7,5,'1U','Maddening Cacophony','Magali Villeneuve',4,491697,3,'10a79733-702c-4611-b073-71db7f1158b2');
INSERT INTO "cards" VALUES (8,1,'1WB','Greasefang, Okiba Boss','Victor Adame Minguez',0,548531,3,'56a0d43b-4d38-40a7-be6c-8324ab3bf773');
INSERT INTO "cards" VALUES (9,1,'2GU','Grolnok,The Omnivore','Simon Dominic',0,541112,3,'ac6bae00-e965-4664-b3c7-d160949245a1');
INSERT INTO "cards" VALUES (10,1,'4GG','Avabruck Caretaker','Heonhwa Choe',5,544749,4,'c0c358b4-5af2-438f-8bd5-beb0ee6b518b');
INSERT INTO "cards" VALUES (11,4,'2BB','Sorin, the Mirthless','Bastien L. Deharme',2,544414,4,'cc7ff5f4-a7cc-41a1-a22b-8cf67ad18707');
INSERT INTO "cards" VALUES (12,7,'L','Sokenzan, Crucible of Defiance','Lucas Staniec',3,551786,3,'aa548dcd-c1dd-492d-a69f-c65dfeef0633');
INSERT INTO "cards" VALUES (13,7,'L','Otawara, Soaring City','Alayna Danner',4,551785,3,'486d7edc-d983-41f0-8b78-c99aecd72996');
INSERT INTO "cards" VALUES (14,6,'WUBRG','Sanctum of All','Johannes Voss',0,488280,3,'ba91338c-1f6c-4b83-851f-98c3e9dea17b');
INSERT INTO "cards" VALUES (15,1,'GW','Satsuki, the Living Lore','domco',0,552273,3,'a0dd5813-8c6e-4fa3-b11d-e13f14ce8c4e');
INSERT INTO "cards" VALUES (16,1,'3GGUU','Koma, Cosmos Serpent','Jesper Ejsing',0,503837,4,'2de25ea4-284a-4c16-b823-048ff00c6a03');
INSERT INTO "cards" VALUES (17,4,'5BR','Tibalt, Cosmic Imposter','Grzegorz Rutkowski',0,507137,4,'ea7e4c65-b4c4-4795-9475-3cba71c50ea5');
INSERT INTO "cards" VALUES (18,1,'U','Aegis Turtle','Milivoj Ceran',4,479559,1,'7003ebae-5d82-4360-ae63-0e51c37977ed');
INSERT INTO "cards" VALUES (19,1,'5UU','Archipelagore','Svetlin Velinov',4,479561,2,'f24b1030-64d5-4c94-a04c-1d9520bfddab');
INSERT INTO "cards" VALUES (20,5,'4BG','Back for More','Daarken',0,479697,2,'3fc7210c-da23-4cec-9195-4de75587f40f');
INSERT INTO "cards" VALUES (21,1,'2BGU','Brokkos, Apex of Forever','Filip Burburan',0,479699,4,'c9f07625-fbd8-4581-8568-eb3cfb2a4c1e');
INSERT INTO "cards" VALUES (22,3,'2UR','Channeled Force','Randy Vargas',0,479700,2,'8918d24e-8ae8-4028-9f06-ba6fafcc717e');
INSERT INTO "cards" VALUES (23,1,'BG','Chevill, Bane of Monsters','Yongjae Choi',0,479701,4,'fecbf0a3-ebe1-43b6-a720-462ba19002eb');
INSERT INTO "cards" VALUES (24,1,'4R','Cloudpiercer','Dan Scott',3,479632,1,'3ec5f005-d8fb-48b8-8ac5-74445cc83273');
INSERT INTO "cards" VALUES (25,1,'3U','Crystacean','Mathias Kollros',4,479566,1,'32afec8a-dbae-446e-919a-3efb556f5cb1');
INSERT INTO "cards" VALUES (26,6,'WBG','Deaths Oasis','Grzegors Rutkowski',0,479702,3,'112e2cca-bae7-4296-9514-e6058f4b38a5');
INSERT INTO "cards" VALUES (27,3,'WB','Dire Tactics','Daarken',0,479703,2,'e0e3974e-3753-4f25-8930-6d96b40332ce');
INSERT INTO "cards" VALUES (28,1,'2BB','Dirge Bat','Paul Scott Canavan',2,479604,3,'59677c76-8148-4b6f-95b0-0e3ccf137a3f');
INSERT INTO "cards" VALUES (29,5,'BBGGGUU','Emergent Ultimatum','Zach Stella',0,479705,3,'3a6a52ab-6d38-4429-9969-90064e615152');
INSERT INTO "cards" VALUES (30,5,'WWBBBGG','Eerie Ultimatum','Jason A. Engle',0,479704,3,'3a9fb2db-228f-4d48-acdf-6330baf356c7');
INSERT INTO "cards" VALUES (31,5,'GGUUURR','Genesis Ultimatum','Jason Rainville',0,479709,3,'556dfe7a-43e8-4801-ad79-89ab2148eca6');
INSERT INTO "cards" VALUES (32,5,'UURRRWW','Inspired Ultimatum','Tyler Jacobson',0,479711,3,'dd64f064-8f05-41ef-b95b-1b723137f846');
INSERT INTO "cards" VALUES (33,1,'B/U B/U','Cunning Nightbonder','Ekaterina Burmak',0,479739,2,'adb202e7-f9a4-4785-840d-18aa6aa663b4');
INSERT INTO "cards" VALUES (34,3,'1U','Essence Scatter','Seb McKinnon',4,479569,1,'5f79c8a0-291e-4e13-b765-4cf8c726cf30');
INSERT INTO "cards" VALUES (35,1,'4BU','Gyruda, Doom of Depths','Tyler Jacobson',0,479741,3,'97eb1804-6fd8-4917-af36-87fdfce39d3a');
INSERT INTO "cards" VALUES (36,7,'L','Indatha Triome','Noah Bradley',0,479768,3,'2b74bb81-fb9a-40e5-a941-e517430b52f5');
INSERT INTO "cards" VALUES (37,1,'4R/G','Jegantha, the Wellspring','Chris Rahn',0,479742,3,'1d52e527-3835-4350-8c01-0f2d5d623b9c');
INSERT INTO "cards" VALUES (38,1,'1GW','Kaheera, the Orphanguard','Ryan Pancoast',0,479744,3,'d4ebed0b-8060-4a7b-a060-5cfcd2172b16');
INSERT INTO "cards" VALUES (39,1,'2GUR','Illuna, Apex of Wishes','Chris Rahn',0,479710,4,'9fc99c81-d112-4811-9bba-77a14d904692');
INSERT INTO "cards" VALUES (40,1,'3GU','Keruga, the Macrosage','Dan Scott',0,479745,3,'a90ee952-de7a-420f-993c-a38db89bc8ac');
INSERT INTO "cards" VALUES (41,7,'L','Ketria Triome','Sam Burley',0,479770,3,'a249b1f4-2b22-4b67-a207-e0c4ae95d2e1');
INSERT INTO "cards" VALUES (42,1,'GU','Kinnan, Bonder Prodigy','Jason Rainville',0,479712,4,'63cda4a0-0dff-4edb-ae67-a2b7e2971350');
INSERT INTO "cards" VALUES (43,1,'3GGG','Kogla, the Titan Ape','Chris Rahn',5,479682,3,'3c35ca79-eb72-427a-a8ed-404b2214389a');
INSERT INTO "cards" VALUES (44,1,'BR','Labyrinth Raptor','Daarken',0,479713,3,'c608543d-cb60-44c3-a437-e4a18c311420');
INSERT INTO "cards" VALUES (45,4,'3RR','Lukka, Coppercoat Outcast','Chris Rallis',3,479645,4,'5798fdf0-d178-43d9-b821-8f3f654654b4');
INSERT INTO "cards" VALUES (46,1,'1UR','Lore Drakkis','Lucas Graciano',0,479714,2,'83e035ca-eccd-4b63-817c-f2c676b9c98d');
INSERT INTO "cards" VALUES (47,1,'1WB','Lurrus of the Dream-Den','Slawomir Maniak',0,479746,3,'5ad36fb2-c44e-4085-ba0d-54277841ad3a');
INSERT INTO "cards" VALUES (48,1,'1UR','Lutri, the Spellchaser','Lie Setiawan',0,479747,3,'fb1189c9-7842-466e-8238-1e02677d8494');
INSERT INTO "cards" VALUES (49,5,'2GG','Mythos of Brokkos','Seb Mckinnon',5,479688,3,'fa4fc5b1-6666-4c60-898f-f927212c7923');
INSERT INTO "cards" VALUES (50,5,'2UU','Mythos of Illuna','Seb McKinnon',4,479578,3,'f1b07082-c5a5-4283-a2f5-5b1e0120d752');
INSERT INTO "cards" VALUES (51,4,'2B','Mythos of Nethroi','Seb Mckinnon',2,479617,3,'6abc24e1-e721-471a-9efd-547f320675b0');
INSERT INTO "cards" VALUES (52,5,'2WW','Mythos of Snapdax','Seb Mckinnon',1,479544,3,'2712a1a3-dd28-44c8-a661-5bcf68d3acaa');
INSERT INTO "cards" VALUES (53,5,'2RR','Mythos of Vadrok','Seb Mckinnon',3,479647,3,'2bbe99a7-3b58-4f23-bf86-e1e35b0bec2e');
INSERT INTO "cards" VALUES (54,4,'1URW','Narset of the Ancient Way','Yongjae Choi',0,479715,4,'fa7b28d8-b835-44a0-978d-cadfd392fff5');
INSERT INTO "cards" VALUES (55,1,'1WB','Necropanther','Jason A. Engle',0,479716,2,'2e1ed055-8988-4625-9d57-8ce8a4e04aea');
INSERT INTO "cards" VALUES (56,1,'2WBG','Nethroi, Apex of Death','Slawomir Maniak',0,479717,4,'8ca6eb5a-8bc9-4091-bcfb-b207f0afd188');
INSERT INTO "cards" VALUES (57,1,'3RU','Obosh, the Preypiercer','Daarken',0,479748,3,'451507de-9c42-43ee-b9ba-1f69e9aa29d2');
INSERT INTO "cards" VALUES (58,5,'2U','Of One Mind','Matt Stewart',4,479580,1,'c95fb136-f21d-4f3a-82b7-bcf490b7e90c');
INSERT INTO "cards" VALUES (59,6,'2RWB','Offsprings Revenge','Daarken',0,479718,3,'78619ffb-f514-4f9f-9d77-3ab49e045f7c');
INSERT INTO "cards" VALUES (60,6,'2U','Ominous Seas','Vincent Proce',4,479581,2,'ce8965f2-756a-4461-a643-db024a11c2de');
INSERT INTO "cards" VALUES (61,1,'2GU','Parcelbeast','Milivoj Ceran',0,479719,2,'610bb98c-d66a-44cc-92e2-a80d700b59e4');
INSERT INTO "cards" VALUES (62,1,'2U','Phase Dolphin','Lie Setiawan',4,479582,1,'88fb4042-e9c1-4b0f-b1f6-4180b0d79663');
INSERT INTO "cards" VALUES (63,3,'1G','Plummet','Sidharth Chaturvedi',5,479689,1,'d884b2f2-946e-4d5d-b8cf-ef035726a188');
INSERT INTO "cards" VALUES (64,1,'4U','Pouncing Shoreshark','Dan Scott',4,479584,2,'c859b339-b55b-41fe-948c-27502e3b3ea8');
INSERT INTO "cards" VALUES (65,6,'1GU','Primal Empathy','Micah Epstein',0,479720,2,'656c2277-7420-4e4d-bed5-3683ec1c70de');
INSERT INTO "cards" VALUES (66,1,'2WR','Proud Wildbonder','Dmitry Burmak',0,479749,2,'f4876e17-a206-4351-9c0b-0845db4569a3');
INSERT INTO "cards" VALUES (67,1,'3R','Pyroceratops','Jason A. Engle',3,479650,1,'f6599645-dbb5-4174-bd26-8556af6d89c3');
INSERT INTO "cards" VALUES (68,1,'2RRG','Quartzwood Crasher','Antonio Jose Manzanedo',0,479721,3,'c8e4c609-19c9-433b-a852-7999e375ee4f');
INSERT INTO "cards" VALUES (69,3,'1R','Raking Claws','Slawomir Maniak',3,479651,1,'6eb0d9a2-f9bb-4d8e-a1ca-896c42f8ad56');
INSERT INTO "cards" VALUES (70,3,'1G','Ram Through','Zoltan Boros',5,479690,1,'ac0b24e7-14e7-45ee-b5d8-bdb8674b669c');
INSERT INTO "cards" VALUES (71,7,'L','Raugrin Triome','Jonas De Ro',0,479771,3,'02138fbb-3962-4348-8d31-faaefba0b8b2');
INSERT INTO "cards" VALUES (72,6,'2UU','Reconnaissance Mission','Johannes Voss',4,479585,2,'b2364119-d764-4ef1-86cf-a0b7a5ae1b38');
INSERT INTO "cards" VALUES (73,1,'RW','Regal Leosaur','Ilse Gort',0,479722,2,'b6fdf313-740b-4976-911f-9fb5eb54afce');
INSERT INTO "cards" VALUES (74,6,'2R','Reptilian Reflection','Antonio Jose Manzanedo',3,479652,2,'7871b4dd-9085-4a3f-a1ae-9a292f73689b');
INSERT INTO "cards" VALUES (75,1,'1UR','Rielle, the Everwise','Yongjae Choi',0,479723,4,'5f03c944-1929-4cb2-a373-d57eefa29ed1');
INSERT INTO "cards" VALUES (76,1,'4R','Rooting Moloch','Andrey Kuzinskiy',3,479653,2,'cc2fd581-5cf8-4154-90dd-922afddcd556');
INSERT INTO "cards" VALUES (77,7,'L','Rugged Highlands','Adam Paquette',0,548586,1,'58d511be-60e0-4755-abec-18eebb530605');
INSERT INTO "cards" VALUES (78,5,'RRWWWBB','Ruinous Ultimatum','Chase Stone',0,479724,3,'50c1d6ca-7789-46b5-bc89-85cc3915cb85');
INSERT INTO "cards" VALUES (79,1,'RW','Savai Thundermane','Svetlin Velinov',0,479725,2,'73d3925c-cf7d-4546-bc70-33f04d4b7566');
INSERT INTO "cards" VALUES (80,2,'0','Black Lotus','Christopher Rush',7,9764,3,'4c85d097-e87b-41ee-93c6-0e54ec41b174');
INSERT INTO "cards" VALUES (81,1,'4G','Auspicious Starrix','Lucas','5',479664,2,'a39ae1e4-d4dd-4691-af5a-5fa25ace4ebe');
INSERT INTO "cards" VALUES (82,1,'3U','Avian Oddity','Simon Dominic',4,479562,2,'f325873b-97de-4701-910f-ec5cdb66de33');
INSERT INTO "cards" VALUES (83,6,'2B','Bastion of Remembrance','artist',2,479593,2,'2dd354dd-939e-4b1a-8ed6-fe89a7fd64bf');
INSERT INTO "cards" VALUES (84,1,'5B','Blitz Leech','artist',2,479594,1,'7d9b5bde-a851-480b-b45e-d384fd1c11bb');
INSERT INTO "cards" VALUES (85,1,'2BG','Boneyard Lurker','Nilis Hamm',0,479698,2,'37e4df5b-ec53-4f8a-8c26-272b3177c0a6');
INSERT INTO "cards" VALUES (86,7,'L','Voldaren Estate','Richard Wright',0,544452,3,'2577e5fd-903a-44ce-989a-d53d56511ad3');
INSERT INTO "cards" VALUES (87,7,'L','Lavaclaw Reaches','Veronique Meignaud',0,457141,4,'409fcd0c-8449-4623-8bf0-cd7ca0937a4a');
INSERT INTO "cards" VALUES (88,7,'L','Hall of Storm Giants','Alex Stone',4,530838,3,'bf8f052d-8840-4905-a807-9a305f4fd8f7');
INSERT INTO "cards" VALUES (89,1,'4RR','Muxus, Goblin Grandee','Dmitry Burmak',3,489191,3,'2c716d10-2130-43b7-a939-349d437e1091');
INSERT INTO "cards" VALUES (90,5,'8RR','Explosive Singularity','Ari',3,552257,4,'e6cdd822-44a1-4d58-9de4-69fc56eae255');
INSERT INTO "cards" VALUES (91,3,'2U','Thirst for Discovery','Dan Scott',4,544468,2,'1ea179e9-9c0d-46c1-9ee8-60be68e1f79c');
INSERT INTO "cards" VALUES (92,1,'XGU','Verazol, the Split Current','Daarken',4,495658,3,'752a2aa9-40ed-4c64-b945-bc6fec606b7b');
INSERT INTO "cards" VALUES (93,1,'5BB','Toxrill, the Corrosive','DZO',2,545043,4,'84e64f38-b1f3-47cd-8cfb-a4861369aca3');
INSERT INTO "cards" VALUES (94,1,'1BB','Nashi, Moon Sage''s Scion','Yoshiya',2,552722,4,'2893b070-a610-4273-beb2-7609a2da0499');
INSERT INTO "cards" VALUES (95,1,'1U','Spellstutter Sprite','Maria Poliakova',4,509350,3,'3899605d-2203-4ab6-9ff5-69490382eea4');
INSERT INTO "cards" VALUES (96,2,'3','Strixhaven Stadium','Piotr Dura',7,516958,3,'421674ee-4b85-4942-b166-952598165826');