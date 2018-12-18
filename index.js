'use strict'

require('resquire')
require('make-promises-safe').abort = true

const fastify = require('fastify')({logger: true})
const deeps = require('deeps')

fastify
	.register(require('fastify-sensible'))
	.register(require('fastify-blipp'))

	// Routes
	.register(require('^shell/routes/hello-world'))

fastify.listen(3000, '0.0.0.0', (err, address) => {
	if (err) {
		throw err
	}
	fastify.blipp()
	fastify.log.info(`server listening on ${address}`)
})
