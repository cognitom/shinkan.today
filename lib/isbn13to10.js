export default function isbn13to10(isbn13) {
  const digits = isbn13.toString().substr(3, 9).split('')
  const sum = digits
    .map(digit => digit - 0)
    .reduce((acc, cur, index) => acc + cur * (10 - index), 0)
  const tmp = 11 - (sum % 11)
  const checkDigit = tmp == 10 ? 'x' : tmp == 11 ? '0' : tmp.toString()
  return digits.concat(checkDigit).join('')
}
