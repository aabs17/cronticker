const { syncDB } = require('../../tasks/sync-db')

describe('Pruebas en Sync-DB', () => {
  test('Debe de ejecutar el proceso 2 veces', async () => {
    syncDB()
    const times = syncDB()
    console.log('Se llamo:', times)
    expect(times).toBe(2)
  })
})