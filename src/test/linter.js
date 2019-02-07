// This will test our json to make sure it is valid
const { log, error } = console
const fs = require('fs')

const input = fs.readFileSync('./src/users.json').toString()

try {
    const users = JSON.parse(input)
    log(`Found ${users.length} users`)
    return 0
} catch(e) {
    error(e)
    return 1
}