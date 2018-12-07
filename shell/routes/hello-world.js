const schema = require(__filename.replace('.js', '.schema.js'))
// Core Algorithm Require
const getHello = require('^core/hello-world')

module.exports = async (fastify, options) => {
	fastify
		//.addHook('preHandler', fastify.auth([fastify.permittedRouteSession]))
		.route({
			version: '1.0.0',
			url: '/hello-world',
			schema: schema.get['/'],
			method: 'GET',
			handler: async request => {
				return 'world'
				//return getHello({request})
			}
		})
}
