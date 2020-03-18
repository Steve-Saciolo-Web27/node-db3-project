const express = require('express')
const helmet = require('helmet')
const morgan = require('morgan')
require('dotenv').config()

const SchemeRouter = require('./schemes/scheme-router.js')

const server = express()

server.use(helmet())
server.use(morgan('dev'))
server.use(express.json())

server.use('/api/schemes', SchemeRouter)

module.exports = server
