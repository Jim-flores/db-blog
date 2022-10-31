CREATE TABLE "User" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int
);

CREATE TABLE "Entradas" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar,
  "author" int NOT NULL,
  "content" varchar,
  "categorias_id" int NOT NULL
);

CREATE TABLE "Categorias" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "user_id" int NOT NULL
);

CREATE TABLE "Comentario" (
  "id" serial PRIMARY KEY,
  "comment" varchar,
  "entrada_id" int NOT NULL
);

ALTER TABLE "Entradas" ADD FOREIGN KEY ("author") REFERENCES "User" ("id");

ALTER TABLE "Comentario" ADD FOREIGN KEY ("entrada_id") REFERENCES "Entradas" ("id");

ALTER TABLE "Entradas" ADD FOREIGN KEY ("categorias_id") REFERENCES "Categorias" ("id");

ALTER TABLE "Categorias" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("id");

insert into Categorias ("name") values ("Actualidad"), ("Cocina"), ("Deportes"), ("Libros"), ("Musica"), ("Programacion");
insert into User ("name", "email", "password", "age") values ("Carlos", "Carlos@gmail.com", "1234", 23), ("Alan", "alan123@gmail.com", "123465", 25); 
insert into Entradas ("title", "description", "author") values ("Omelete", "Receta para preparar omelete", 1), ("Premio", "Por ocupar el primer lugar en las olimpiadas", 2);
insert into Comentario ("comment", "entrada_id") values ("Se ve delicioso", 1), ("Felicidades", 2);
