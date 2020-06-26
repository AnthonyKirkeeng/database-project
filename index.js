const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 3000

const logger = function (req, res, next) {
  console.log(`${req.method} ${req.url}`);
  next()
}

app.use(logger)
app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)
const pool = require('./queries/db-connector').pool
const createCustomers = (request, response) => {
  const { company_name, contact_name, contact_email, contact_number } = request.body
  pool.query(
    'INSERT INTO Customers (company_name, contact_name, contact_email, contact_number) VALUES ($1, $2, $3, $4) returning *',
    [company_name, contact_name, contact_email, contact_number],
    (error, results) => {
      if (error) {
        console.log(error)
        response.status(500).send()
      } else {
        response.status(201).send(`User added with ID: ${results.customer_id}`)
      }
    })
}

const getCustomers = (request, response) => {
  pool.query('SELECT * FROM customers ORDER BY customer_id ASC', (error, results) => {
    if (error) {
      console.log(error)
      response.status(500).send()
    } else {
      response.status(200).json(results.rows)
    }
  })
}

const db_users = require('./queries/user-queries')
const db_manufacturers = require('./queries/manufacturers-queries')

app.get('/users', db_users.getUsers)
app.get('/users/:id', db_users.getUserById)
app.post('/users', db_users.createUser)
app.put('/users/:id', db_users.updateUserById)
app.delete('/users/:id', db_users.deleteUserById)

app.get('/manufacturers', db_manufacturers.getManufacturers)
app.get('/manufacturers/:id', db_manufacturers.getManufacturerById)
app.post('/manufacturers', db_manufacturers.createManufacturer)
app.put('/manufacturers/:id', db_manufacturers.updateManufacturerById)
app.delete('/manufacturers/:id', db_manufacturers.deleteManufacturerById)

app.post('/customers', createCustomers)
app.get('/customers', getCustomers)
app.listen(port, () => {
  console.log(`App running on port ${port}.`)
})