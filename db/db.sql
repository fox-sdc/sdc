-- ---
-- Table "products"
--
-- ---

DROP TABLE IF EXISTS "products", "styles", "photos", "skus", "features", "related_products";

CREATE TABLE "products" (
  "id" INTEGER NULL DEFAULT NULL,
  "name" VARCHAR(125) NULL DEFAULT NULL,
  "slogan" VARCHAR(255) NULL DEFAULT NULL,
  "description" VARCHAR(5000) NULL DEFAULT NULL,
  "category" VARCHAR(125) NULL DEFAULT NULL,
  "default_price" VARCHAR(125) NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'styles'
--
-- ---

CREATE TABLE "styles" (
  "id" INTEGER NULL DEFAULT NULL,
  "productId" INTEGER NULL DEFAULT NULL,
  "name" VARCHAR(125) NULL DEFAULT NULL,
  "sale_price" VARCHAR(125) NULL DEFAULT NULL,
  "original_price" VARCHAR(125) NULL DEFAULT NULL,
  "default_style" BOOLEAN,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'photos'
--
-- ---

CREATE TABLE "photos" (
  "id" INTEGER NULL DEFAULT NULL,
  "styleId" INTEGER NULL DEFAULT NULL,
  "url" VARCHAR(5000) NULL DEFAULT NULL,
  "thumbnail_url" VARCHAR(40000) NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'skus'
--
-- ---

CREATE TABLE "skus" (
  "id" INTEGER NULL DEFAULT NULL,
  "styleId" INTEGER NULL DEFAULT NULL,
  "size" CHAR(10) NULL DEFAULT NULL,
  "quantity" INTEGER NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'features'
--
-- ---

CREATE TABLE "features" (
  "id" INTEGER NULL DEFAULT NULL,
  "product_id" INTEGER NULL DEFAULT NULL,
  "feature" VARCHAR(125) NULL DEFAULT NULL,
  "value" VARCHAR(125) NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'related_products'
--
-- ---

CREATE TABLE "related_products" (
  "id" INTEGER NULL DEFAULT NULL,
  "current_product_id" INTEGER NULL DEFAULT NULL,
  "related_product_id" INTEGER NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE "styles" ADD FOREIGN KEY ("productId") REFERENCES "products" ("id");
ALTER TABLE "photos" ADD FOREIGN KEY ("styleId") REFERENCES "styles" ("id");
ALTER TABLE "skus" ADD FOREIGN KEY ("styleId") REFERENCES "styles" ("id");
ALTER TABLE "features" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");
ALTER TABLE "related_products" ADD FOREIGN KEY ("current_product_id") REFERENCES "products" ("id");

-- ---
-- Table Properties
-- ---

-- ALTER TABLE "products" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "styles" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "photos" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "skus" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "features" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "related_products" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO "products" ("id","name","slogan","description","category","default_price") VALUES
-- ('','','','','','');
-- INSERT INTO "styles" ("id","productId","name","sale_price","original_price","default_style") VALUES
-- ('','','','','','');
-- INSERT INTO "photos" ("id","styleId","url","thumbnail_url") VALUES
-- ('','','','');
-- INSERT INTO "skus" ("id","styleId","size","quantity") VALUES
-- ('','','','');
-- INSERT INTO "features" ("id","product_id","feature","value") VALUES
-- ('','','','');
-- INSERT INTO "related_products" ("id","current_product_id","related_product_id") VALUES
-- ('','','');