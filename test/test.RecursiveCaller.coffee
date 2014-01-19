RecursiveCaller = require '../src/RecursiveCaller'

describe "Arguments Builder", ->

	it 'should call funct with base', ->
		r = new RecursiveCaller
		funct = -> @name
		ref = name: 'dummy-data'
		result = r._argsBuilder(funct, ref)
		result.should.equal 'dummy-data'


	it 'should build args with node as the first parameter',->
		r = new RecursiveCaller
		funct = (a,b,c,d,e)-> {a,b,c,d,e}
		node = 'dummy-node'
		result = r._argsBuilder(funct, null, node, ['a', 'b'])
		result.a.should.equal 'dummy-node'
		result.b.should.equal 'a'
		result.c.should.equal 'b'

		result = r._argsBuilder(funct, null, node, [null, null, 'c', 'd'])
		result.d.should.equal 'c'
		result.e.should.equal 'd'

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


	it 'should go thru all nodes', ->
		r = new RecursiveCaller
		node = links: ['xx']
		funct = (node, a,b,c,d) -> node+a+b+c+d
		result = r._forAll(node, funct, 'a', 'b', 'c', 'd')[0]
		result.should.equal 'xxabcd' 


	it 'should verify onEach method', ->
		r  = new RecursiveCaller
		ref = name: 'dummy-ref'
		onEach = (node, content) -> @name + node + content
		r._onEach(ref, onEach,'-xx', '-yy').should.equal 'dummy-ref-xx-yy'
		

	it 'should call wrt to base obj', ->
		base = name: '*'
		str = ""
		r = new RecursiveCaller
		r.bind base
		r.execute(root, -> str+= @name)
		str.should.equal '*******'

	it 'should return count', ->
		r = new RecursiveCaller
		r.count(root).should.equal 7

	it 'should iterate over the complete tree', ->
		count = 0
		r = new RecursiveCaller
		r.execute root,  -> count++
		count.should.equal 7


	