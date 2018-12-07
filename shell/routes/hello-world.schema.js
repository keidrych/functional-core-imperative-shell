const toJsonSchema = require('to-json-schema')
const R = require('rambdax')

module.exports = {
	get: R.map((val, prop) => toJsonSchema(prop), {'/': {}}),
	post: R.map((val, prop) => toJsonSchema(prop), {
		'/': {name: 'human'}
	}),
	put: {},
	patch: {},
	delete: {}
}
