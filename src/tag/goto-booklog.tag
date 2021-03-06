<goto-booklog>
  <a href={url}>ブクログ</a>

  <script>
    import isbn13to10 from '../../lib/isbn13to10'

    const isbn10 = isbn13to10(opts.isbn)
    this.url = 'http:/' + '/booklog.jp/item/1/' + isbn10
  </script>

  <style>
    :scope {
      display: block;
      background: rgba(255,255,255,.1);
      border: 1px solid rgba(255,255,255,.3);
      border-radius: 3px;
      color: rgba(255,255,255,.8);
      text-align: center;
      padding: .5em;
      margin: 0 auto;
      width: 80%;
      max-width: 500px;
    }
    a {
      display: block;
    }
  </style>
</goto-booklog>
