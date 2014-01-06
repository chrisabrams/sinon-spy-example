
describe 'The Test', ->

  it 'should be able to spy on a method', (done) ->

    Foo = ->

    foo = new Foo

    spy = sinon.spy foo, 'something'

    expect(spy).to.have.been.calledWith 'foo'

    done()
