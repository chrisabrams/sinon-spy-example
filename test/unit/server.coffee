sinon = require('sinon')

describe 'The Test', ->

  it 'should be able to spy on a function', (done) ->

    foo = ->
    	console.log('This log wont run if you spy me')

    foo() #outputs log statement

    # Spy factory creates a spy function that you overwrite the method with
    foo = sinon.spy()

    # Calling it sets its internal value for property 'called' to true
    foo() # no longer outputs log statement because its overwritten

    expect(foo.called).to.be.equal true

    done()


  it 'should be able to spy on a method on an instance', (done) ->

    class Foo
    	initialize: ->
    		@spyMe()

    	spyMe: ->
    		console.log('This log wont run if you spy me')

    foobar = new Foo()

    # Override this instance's method spyMe with a function spy
    foobar.spyMe = sinon.spy()

    # Running this method will call the spy me method
    foobar.initialize()

    expect( foobar.spyMe.called ).to.be.equal(true)

    done()