<app-search>
  <header>
    <h2>{jDate}<span>全{books.length}件</span></h2>
    <a class="prev" if={prev} href="#{prev}">前日</a>
    <span class="prev" if={!prev}>前日</span>
    <a class="next" if={next} href="#{next}">翌日</a>
    <span class="next" if={!next}>翌日</span>
  </header>
  <ul>
    <li each={visibleBooks} style="background-image: url({cover})">
      <a href="book/{isbn}" title={title}>{title}</a>
    </li>
  </ul>
  <button if={visibleBooks.length < books.length} onclick={more}>もっと表示</button>
  <footer>新刊トゥデイ</footer>

  <script>
    import fecha from 'fecha'
    fecha.i18n.dayNamesShort = ['日', '月', '火', '水', '木', '金', '土']

    const limit = 30
    const d0 = new Date()
    const today = fecha.format(d0, 'YYYY-MM-DD')
    const twoWeekAgo = fecha.format(d0.setDate(d0.getDate() - 14), 'YYYY-MM-DD')
    const twoWeekLater = fecha.format(d0.setDate(d0.getDate() + 27), 'YYYY-MM-DD')

    this.books = []
    this.visibleBooks = []
    this.on('route', date => {
      date = date || fecha.format(new Date(), 'YYYY-MM-DD')
      const d = fecha.parse(date, 'YYYY-MM-DD')
      const jDate = fecha.format(d, 'YYYY/M/D (ddd)')
      const prev = date <= twoWeekAgo ? '' : fecha.format(d.setDate(d.getDate() - 1), 'YYYY-MM-DD')
      const next = twoWeekLater <= date ? '' : fecha.format(d.setDate(d.getDate() + 2), 'YYYY-MM-DD')
      this.update({date, jDate, prev, next, books: [], visiblBooks: []})
      fetch(`/data/${date}.json`)
        .then(response => response.json())
        .then(books => {
          books = books.filter(book => book.cover)
          const visibleBooks = books.slice(0, limit)
          this.update({books, visibleBooks})
        })
    })

    this.more = e => {
      const n = this.visibleBooks.length + limit
      this.visibleBooks = this.books.slice(0, n)
    }
  </script>

  <style>
    :scope {
      display: block;
    }
    footer {
      position: fixed;
      bottom: 0;
      left: 0;
      right: 0;
      background: #2c3644;
      font-size: 90%;
      font-weight: normal;
      text-align: center;
      padding: 8px;
      margin: 0;
      color: rgba(255,255,255,.5);
      border-top: 1px solid rgba(255,255,255,.1);
    }
    header {
      text-align: center;
      margin: 0 0 5px;
      border-bottom: 1px solid rgba(255,255,255,.1);
      color: rgba(255,255,255,.8);
      position: relative;
    }
    header > h2 {
      font-size: 100%;
      padding: 15px 10px;
    }
    header > h2 > span {
      font-size: 90%;
      font-weight: normal;
      margin-left: 1em;
    }
    header > .prev,
    header > .next {
      position: absolute;
      background: rgba(255,255,255,.1);
      border: 1px solid rgba(255,255,255,.3);
      border-radius: 3px;
      color: rgba(255,255,255,.8);
      text-align: center;
      padding: 5px 10px;
      top: 10px;
    }
    header > .prev {
      left: 15px;
    }
    header > .next {
      right: 15px;
    }
    header > a {
      text-decoration: none;
    }
    header > span.prev,
    header > span.next {
      color: rgba(255,255,255,.2);
      border-color: rgba(255,255,255,.1);
      background: none;
    }
    ul {
      list-style: none;
      padding: 0;
      text-align: center;
    }
    li {
      display: inline-block;
      margin: 15px 5px;
      height: 220px;
      width: 165px;
      overflow: hidden;
      background-size: contain;
      background-repeat: no-repeat;
      background-position: bottom;
    }
    li > a {
      display: block;
      color: transparent;
      height: 100%;
    }
    button {
      display: block;
      background: rgba(255,255,255,.1);
      border: 1px solid rgba(255,255,255,.3);
      border-radius: 3px;
      color: rgba(255,255,255,.8);
      text-align: center;
      padding: 1em;
      margin: 1em auto;
      width: 80%;
      max-width: 500px;
    }
  </style>
</app-search>
