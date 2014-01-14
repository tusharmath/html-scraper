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

	it 'should call wrt to base obj', ->
		base = name: '*'
		str = ""
		r = new RecursiveCaller root
		r.execute(base, null, -> str+= @name )
		str.should.equal '*******'


	it 'should return count', ->
		r = new RecursiveCaller root
		r.execute().should.equal 7

	it 'should iterate over the complete tree', ->
		count = 0
		r = new RecursiveCaller root
		r.execute null, null, ->count++
		count.should.equal r.count


	