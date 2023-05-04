CREATE TABLE "user"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "encrypted_pswd" VARCHAR(255) NOT NULL,
    "jti_token" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "user" ADD PRIMARY KEY("id");
CREATE TABLE "reservation"(
    "id" BIGINT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "user_id" BIGINT NOT NULL,
    "car_id" BIGINT NOT NULL
);
ALTER TABLE
    "reservation" ADD PRIMARY KEY("id");
CREATE TABLE "car"(
    "id" BIGINT NOT NULL,
    "model" VARCHAR(255) NOT NULL,
    "image" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "price" DECIMAL(8, 2) NOT NULL,
    "brand" VARCHAR(255) NOT NULL,
    "year" DATE NOT NULL,
    "color" VARCHAR(255) NOT NULL,
    "isElectric" BOOLEAN NOT NULL,
    "Accidents" BIGINT NOT NULL
);
ALTER TABLE
    "car" ADD PRIMARY KEY("id");
ALTER TABLE
    "reservation" ADD CONSTRAINT "reservation_car_id_foreign" FOREIGN KEY("car_id") REFERENCES "car"("id");
ALTER TABLE
    "reservation" ADD CONSTRAINT "reservation_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "user"("id");
