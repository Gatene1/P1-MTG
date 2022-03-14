CREATE TABLE "cards" (
     "CardId" INT PRIMARY KEY NOT NULL,
     "ManaCost" INT NOT NULL,
     "TypeId" INT NOT NULL,
     "Name" VARCHAR NOT NULL
);

-- CREATE TABLE "types" (
--      "TypesId" INT NOT NULL,
--      "Type" VARCHAR NOT NULL,
--      CONSTRAINT "PK_Type" PRIMARY KEY ("TypesId"),
--      CONSTRAINT "FK_TypeId" FOREIGN KEY ("TypesId") REFERENCES "cards" ("TypeId") ON DELETE NO ACTION ON UPDATE NO ACTION
-- );

--CREATE INDEX "IFK_TypesId" ON "types" ("TypesId");

INSERT INTO "cards" VALUES (1,5,2,'Naomi Pillar of Order');
INSERT INTO "cards" VALUES (2,3,2,'Satoru Umezawa');
INSERT INTO "cards" VALUES (3,1,3,'Sol Ring');



-- INSERT INTO "types" VALUES (1, 'Creature');
-- INSERT INTO "types" VALUES (2, 'Legendary Creature');
-- INSERT INTO "types" VALUES (3, 'Artifact');