require('resquire')

const rewire = require('rewire')
const faker = require('faker')
const {describe, td, otherName} = require('^tap')(__filename)
const jsonPatch = require('fast-json-patch')
const rfdc = require('rfdc')({proto: true})

const o = rewire(__filename.replace('.spec', ''))

describe('pipeline', async t => {
	// Testing a pipeline, make life easier by flowing the data through it
	let data = {
		_out: {},
		_cache: {},
		request: {},
		reply: {}
	}
	const dataWatcher = jsonPatch.observe(data)

	await t.test('world', async t => {
		data = o.__get__('world')(data)
		const delta = jsonPatch.generate(dataWatcher)
		t.deepEqual(
			delta.shift(),
			{op: 'add', path: '/_out/hello', value: 'world'},
			'hello world returns'
		)
		t.equal(delta.length, 0, 'all delta records checked')
	})
})
