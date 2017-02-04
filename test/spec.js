/* eslint-env mocha */
import assert from 'assert'
import isbn13to10 from '../lib/isbn13to10'
import normalizeDate from '../lib/normalize-date'

describe('shinkan.today', function () {
  it('converts isbn13 to isbn10', function () {
    const isbn13 = '9784041048795'
    const isbn10 = isbn13to10(isbn13)
    assert.equal(isbn10, '4041048796')
  })

  it('normalizes date', function () {
    assert.equal(normalizeDate('20170204'), '2017-02-04')
    assert.equal(normalizeDate('201702'), '2017-02')
    assert.equal(normalizeDate('c2017-02'), '2017-02')
    assert.equal(normalizeDate('[2017]-02'), '2017-02')
  })
})
