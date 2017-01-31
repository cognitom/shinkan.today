import find from 'lodash.get'
import normalizeDate from './normalize-date'
import genreDict from './genre.json'
import ccodeDict from './ccode.json'

export default function (book) {
  const pubdate = normalizeDate(book.summary.pubdate)
  const description = find(book, 'onix.CollateralDetail.TextContent[0].Text', '')
  const price = find(book, 'onix.ProductSupply.SupplyDetail.Price[0].PriceAmount', '')
  const subjects = find(book, 'onix.DescriptiveDetail.Subject', [])
  const genre = subjects
    .filter(subject => subject.SubjectSchemeIdentifier === '79')
    .map(subject => genreDict[subject.SubjectCode] || '')
    .shift() || ''
  const ccode = subjects
    .filter(subject => subject.SubjectSchemeIdentifier === '78')
    .map(subject =>  subject.SubjectCode || '')
    .shift() || ''
  const target = ccodeDict.target[ccode.slice(0, 1)] || ''
  const format = ccodeDict.format[ccode.slice(1, 2)] || ''
  const content = ccodeDict.content[ccode.slice(2, 4)] || ''
  const additionals = {pubdate, description, price, genre, target, format, content}
  return Object.assign({}, book.summary, additionals)
}
