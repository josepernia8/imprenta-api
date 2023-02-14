import { Dni, Prisma, PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

const clientData: Prisma.ClienteCreateManyInput[] = [
  {
    email: 'test@email.com',
    dni: '111111111',
    tipoDni: Dni.VENEZOLANO,
    libros: [
      {
        create: [
          {
            cantidad: 4,
            tripas: {
              create: [
                {
                  tipoTripa: Tripa.FRONT_A,
                  tipoPapel: Papel.HOJAS,
                  cantPorPliego: 16,
                  pliegos: 5,
                  numPaginas: 3
                }
              ]
            }
          },
        ],
      }
    ],
  },
  {
    email: 'test2@email.com',
    dni: '12222222',
    tipoDni: Dni.VENEZOLANO,
  }
]

async function main() {
  console.log(`Start seeding ...`)
  const user = await prisma.cliente.createMany({ data: clientData })
  console.log(`Seeding finished.`)
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
