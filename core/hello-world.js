/* eslint unicorn/regex-shorthand: 0 */

const R = require('rambdax')
const core = require('^core/index.js')
const rfdc = require('rfdc')({proto: true})

const pipeline = [_init, world, _end]

function _init({request, _cache = {}, _out = {}, ..._passthrough}) {
	return {
		request,
		_out,
		_cache,
		..._passthrough
	}
}

async function world({_out, _cache = {}, ..._passthrough}) {
	const debug = require('debug')('pipe:hello-world@world')

	_out.hello = 'world'

	debug('_out', _out)
	debug('_cache', _cache)
	return {
		_cache,
		_out,
		..._passthrough
	}
}

function _end({request, _out, _cache}) {
	return rfdc(_out)
}

module.exports = data =>
	core
		.pPipe(...pipeline)(data)
		.catch(core.remotelog('error'))
