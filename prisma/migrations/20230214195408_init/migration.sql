-- CreateEnum
CREATE TYPE "Dni" AS ENUM ('VENEZOLANO', 'EXTRANJERO', 'JURIDICO', 'GUBERNAMENTAL', 'PASAPORTE');

-- CreateEnum
CREATE TYPE "Tripa" AS ENUM ('FRONT_A', 'FRONT_B', 'BACK_A', 'BACK_B');

-- CreateEnum
CREATE TYPE "Papel" AS ENUM ('HOJAS', 'RESMA', 'BOBINA');

-- CreateTable
CREATE TABLE "Cliente" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "dni" TEXT NOT NULL,
    "tipoDni" "Dni" NOT NULL,

    CONSTRAINT "Cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LibroTripa" (
    "id" SERIAL NOT NULL,
    "tipoTripa" "Tripa" NOT NULL,
    "tipoPapel" "Papel" NOT NULL,
    "cantPorPliego" INTEGER NOT NULL DEFAULT 0,
    "pliegos" INTEGER NOT NULL DEFAULT 0,
    "numPaginas" INTEGER NOT NULL DEFAULT 0,
    "libroId" INTEGER NOT NULL,

    CONSTRAINT "LibroTripa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Libro" (
    "id" SERIAL NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "clienteId" INTEGER NOT NULL,

    CONSTRAINT "Libro_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Cliente_email_key" ON "Cliente"("email");

-- AddForeignKey
ALTER TABLE "LibroTripa" ADD CONSTRAINT "LibroTripa_libroId_fkey" FOREIGN KEY ("libroId") REFERENCES "Libro"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Libro" ADD CONSTRAINT "Libro_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "Cliente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
