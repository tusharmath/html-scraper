class IExecutable
	execute: (pipe, callback) -> @run(callback, pipe)


###
class Http extends IExecutable
class Split extends IExecutable
class Extract extends IExecutable
###
module.exports = IExecutable