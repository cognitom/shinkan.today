export default function normalizeDate (raw) {
  const patterns = [
    // 2017-01-30
    {re: /^\d{4}-\d{2}-\d{2}($|,)/, f: m => m[0]},
    // 2017-01
    {re: /^\d{4}-\d{2}($|,)/, f: m => m[0]},
    // 2017
    {re: /^\d{4}($|,)/, f: m => m[0]},
    // 20170130
    {re: /^(\d{4})(\d{2})(\d{2})($|,)/, f: m => `${m[1]}-${m[2]}-${m[3]}`},
    // 201701
    {re: /^(\d{4})(\d{2})($|,)/, f: m => `${m[1]}-${m[2]}`},
    // c2017-01
    {re: /^c(\d{4})-(\d{2})($|,)/, f: m => `${m[1]}-${m[2]}`},
    // [2017]-01
    {re: /^\[(\d{4})]-(\d{2})($|,)/, f: m => `${m[1]}-${m[2]}`}
  ]
  for (const pattern of patterns) {
    const m = raw.match(pattern.re)
    if (m) return pattern.f(m)
  }
  return 'unrecognized'
}
