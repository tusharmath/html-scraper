RecursiveCaller = require '../src/RecursiveCaller'
describe "RecursiveCaller", ->
	
	root =
		links: [
			links:[]
		,
			links:[
				links: [
					links: []
				,
					links: []
				]
			,
				links: []
			]
		]

	it 'should verify onEach method'
		#TODO: this is a special case

	it 'should call wrt to base obj', ->
		base = name: '*'
		str = ""
		r = new RecursiveCaller
		r.execute(base, root, -> str+= @name)
		str.should.equal '*******'

	it 'should return count', ->
		r = new RecursiveCaller
		r.count(root).should.equal 7

	it 'should iterate over the complete tree', ->
		count = 0
		r = new RecursiveCaller
		r.execute {}, root,  -> count++
		count.should.equal 7


	