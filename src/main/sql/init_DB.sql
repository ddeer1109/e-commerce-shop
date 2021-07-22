
-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE country;



-- ************************************** country



CREATE TABLE country
(
    "id"           serial NOT NULL,
    country_name varchar(50) NOT NULL,
    CONSTRAINT PK_country PRIMARY KEY ( "id" )
);







-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE zip_code;



-- ************************************** zip_code





CREATE TABLE zip_code
(
    "id"   serial NOT NULL,
    code varchar(50) NOT NULL,
    CONSTRAINT PK_zip_code PRIMARY KEY ( "id" )
);





-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE city;



-- ************************************** city

CREATE TABLE city
(
    "id"          serial NOT NULL,
    country_id  integer NOT NULL,
    zip_code_id integer NOT NULL,
    city_name   varchar(50) NOT NULL,
    CONSTRAINT PK_city PRIMARY KEY ( "id" ),
    CONSTRAINT FK_163 FOREIGN KEY ( zip_code_id ) REFERENCES zip_code ( "id" ),
    CONSTRAINT FK_201 FOREIGN KEY ( country_id ) REFERENCES country ( "id" )
);

CREATE INDEX fkIdx_164 ON city
(
 zip_code_id
);

CREATE INDEX fkIdx_202 ON city
(
 country_id
);





-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE street;



-- ************************************** street

CREATE TABLE street
(
    "id"              serial NOT NULL,
    street_name     varchar(50) NOT NULL,
    building_number varchar(50) NOT NULL,
    CONSTRAINT PK_street_number PRIMARY KEY ( "id" )
);





-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE adress;



-- ************************************** adress

CREATE TABLE adress
(
    "id"          serial NOT NULL,
    country_id  integer NOT NULL,
    zip_code_id integer NOT NULL,
    street_id   integer NOT NULL,
    city_id     integer NOT NULL,
    CONSTRAINT PK_adress PRIMARY KEY ( "id" ),
    CONSTRAINT FK_236 FOREIGN KEY ( country_id ) REFERENCES country ( "id" ),
    CONSTRAINT FK_245 FOREIGN KEY ( zip_code_id ) REFERENCES zip_code ( "id" ),
    CONSTRAINT FK_248 FOREIGN KEY ( city_id ) REFERENCES city ( "id" ),
    CONSTRAINT FK_251 FOREIGN KEY ( street_id ) REFERENCES street ( "id" )
);

CREATE INDEX fkIdx_237 ON adress
(
 country_id
);

CREATE INDEX fkIdx_246 ON adress
(
 zip_code_id
);

CREATE INDEX fkIdx_249 ON adress
(
 city_id
);

CREATE INDEX fkIdx_252 ON adress
(
 street_id
);



-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE "user";



-- ************************************** "user"

CREATE TABLE "user"
(
    "id"            serial NOT NULL,
    username      varchar(50) NOT NULL,
    password_hash varchar(50) NOT NULL,
    CONSTRAINT PK_user PRIMARY KEY ( "id" )
);










-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE cart;



-- ************************************** cart

CREATE TABLE cart
(
    "id"      serial NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT PK_cart PRIMARY KEY ( "id" ),
    CONSTRAINT FK_93 FOREIGN KEY ( user_id ) REFERENCES "user" ( "id" )
);

CREATE INDEX fkIdx_94 ON cart
(
 user_id
);





-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE product;



-- ************************************** product

CREATE TABLE product
(
    "id"               serial NOT NULL,
    category_id      integer NOT NULL,
    supplier_id      integer NOT NULL,
    name             varchar(50) NOT NULL,
    description      varchar(50) NOT NULL,
    default_price    decimal NOT NULL,
    default_currency varchar(50) NOT NULL,
    CONSTRAINT PK_product PRIMARY KEY ( "id" ),
    CONSTRAINT FK_55 FOREIGN KEY ( category_id ) REFERENCES "public".product_category ( "id" ),
    CONSTRAINT FK_63 FOREIGN KEY ( supplier_id ) REFERENCES supplier ( "id" )
);

CREATE INDEX fkIdx_56 ON product
(
 category_id
);

CREATE INDEX fkIdx_64 ON product
(
 supplier_id
);








-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE cart_items;



-- ************************************** cart_items

CREATE TABLE cart_items
(
    "id"               serial NOT NULL,
    product_id       integer NOT NULL,
    cart_id          integer NOT NULL,
    product_quantity int NOT NULL,
    CONSTRAINT PK_cartitems PRIMARY KEY ( "id" ),
    CONSTRAINT FK_78 FOREIGN KEY ( product_id ) REFERENCES product ( "id" ),
    CONSTRAINT FK_85 FOREIGN KEY ( cart_id ) REFERENCES cart ( "id" )
);

CREATE INDEX fkIdx_79 ON cart_items
(
 product_id
);

CREATE INDEX fkIdx_86 ON cart_items
(
 cart_id
);









-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE customer_data;



-- ************************************** customer_data

CREATE TABLE customer_data
(
    "id"                    serial NOT NULL,
    user_id               integer NOT NULL,
    billing_adress_id     integer NOT NULL,
    shipping_adress_id    integer NOT NULL,
    customer_email        varchar(50) NOT NULL,
    customer_name         varchar(50) NOT NULL,
    customer_phone_number varchar(50) NOT NULL,
    CONSTRAINT PK_customer_data PRIMARY KEY ( "id" ),
    CONSTRAINT FK_145 FOREIGN KEY ( user_id ) REFERENCES "user" ( "id" ),
    CONSTRAINT FK_254 FOREIGN KEY ( billing_adress_id ) REFERENCES adress ( "id" ),
    CONSTRAINT FK_257 FOREIGN KEY ( shipping_adress_id ) REFERENCES adress ( "id" )
);

CREATE INDEX fkIdx_146 ON customer_data
(
 user_id
);

CREATE INDEX fkIdx_255 ON customer_data
(
 billing_adress_id
);

CREATE INDEX fkIdx_258 ON customer_data
(
 shipping_adress_id
);







-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE departament;



-- ************************************** departament

CREATE TABLE departament
(
    "id"   serial NOT NULL,
    name varchar(50) NOT NULL,
    CONSTRAINT PK_departament PRIMARY KEY ( "id" )
);






-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE order_status;



-- ************************************** order_status

CREATE TABLE order_status
(
    "id"   serial NOT NULL,
    name varchar(50) NOT NULL,
    CONSTRAINT PK_order_status PRIMARY KEY ( "id" )
);






-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE "order";



-- ************************************** "order"

CREATE TABLE "order"
(
    "id"              serial NOT NULL,
    cart_id         integer NOT NULL,
    order_status_id integer NOT NULL,
    user_id         integer NOT NULL,
    order_number    text NOT NULL,
    CONSTRAINT PK_order PRIMARY KEY ( "id" ),
    CONSTRAINT FK_106 FOREIGN KEY ( cart_id ) REFERENCES cart ( "id" ),
    CONSTRAINT FK_109 FOREIGN KEY ( user_id ) REFERENCES "user" ( "id" ),
    CONSTRAINT FK_116 FOREIGN KEY ( order_status_id ) REFERENCES order_status ( "id" )
);

CREATE INDEX fkIdx_107 ON "order"
(
 cart_id
);

CREATE INDEX fkIdx_110 ON "order"
(
 user_id
);

CREATE INDEX fkIdx_117 ON "order"
(
 order_status_id
);











-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE "public".product_category;



-- ************************************** "public".product_category

CREATE TABLE "public".product_category
(
    "id"             serial NOT NULL,
    departament_id integer NOT NULL,
    name           varchar(50) NOT NULL,
    CONSTRAINT PK_productcategory PRIMARY KEY ( "id" ),
    CONSTRAINT FK_71 FOREIGN KEY ( departament_id ) REFERENCES departament ( "id" )
);

CREATE INDEX fkIdx_72 ON "public".product_category
(
 departament_id
);








-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE supplier;



-- ************************************** supplier

CREATE TABLE supplier
(
    "id"          serial NOT NULL,
    name        varchar(50) NOT NULL,
    description text NOT NULL,
    CONSTRAINT PK_supplier PRIMARY KEY ( "id" )
);








-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

-- DROP TABLE user_session;



-- ************************************** user_session

CREATE TABLE user_session
(
    "id"                 serial NOT NULL,
    user_id            integer NOT NULL,
    session_expiration timestamp NOT NULL,
    CONSTRAINT PK_user_session PRIMARY KEY ( "id" ),
    CONSTRAINT FK_123 FOREIGN KEY ( user_id ) REFERENCES "user" ( "id" )
);

CREATE INDEX fkIdx_124 ON user_session
(
 user_id
);












