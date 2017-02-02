<app-home>
  <header>
    <h1>新刊トゥデイ</h1>
  </header>

  <ul>
    <li each={days}>
      <a href="#{date}">
        <span>{jDate}</span>
        <img each={books} title={title} src={cover}></li>
      </a>
    </li>
  </ul>

  <footer>
    <p>Made in OpenSource Cafe</p>
    <p><a href="https://openbd.jp">Powered by openBD</a></p>
    <p><a href="https://github.com/cognitom/shinkan.today">GitHub</a></p>
  </footer>

  <script>
    import fecha from 'fecha'
    fecha.i18n.dayNamesShort = ['日', '月', '火', '水', '木', '金', '土']

    const d0 = new Date()
    const today = fecha.format(d0, 'YYYY-MM-DD')
    const yesterday = fecha.format(d0.setDate(d0.getDate() - 1), 'YYYY-MM-DD')
    const tomorrow = fecha.format(d0.setDate(d0.getDate() + 2), 'YYYY-MM-DD')

    this.days = []
    this.on('route', date => {
      fetch(`/data/index.json`)
        .then(response => response.json())
        .then(index => {
          const days = Object.keys(index)
            .sort()
            .map(date => {
              const jDate
                = date === today ? '今日'
                : date === yesterday ? '昨日'
                : date === tomorrow ? '明日'
                : fecha.format(fecha.parse(date, 'YYYY-MM-DD'), 'M/D (ddd)')
              return {date, jDate, books: index[date]}
            })
          this.update({days})
          const winWidth = window.innerWidth
          const elemWidth = 110
          this.root.querySelector('ul').scrollLeft = 110 * 14 - (winWidth / 2) + (elemWidth / 2);
        })
    })
  </script>

  <style>
    :scope {
      display: block;
    }
    header {
      background-color: white;
      height: 280px;
      padding-top: 20px;
    }
    header > h1 {
      margin: 0 auto;
      height: 280px;
      max-width: 300px;
      background-image: url(/images/logo.svg);
      background-position: center;
      background-size: contain;
      background-repeat: no-repeat;
      color: transparent;
    }
    footer {
      text-align: center;
      margin: 15px 0 0;
      padding: 20px 0;
    }
    footer p {
      margin: 0 0 .5em;
    }
    :scope > ul {
      margin: 0;
      padding: 0;
      list-style: none;
      height: 340px;
      overflow-x: scroll;
      overflow-y: hidden;
      white-space: nowrap;
    }
    :scope > ul > li {
      margin: 0;
      padding: 80px 5px 0;
      display: inline-block;
      width: 100px;
      height: 260px;
      vertical-align: top;
      text-align: center;
      white-space: normal;
      overflow: hidden;
      position: relative;
    }
    :scope > ul > li::before {
      background-color: white;
      top: 0;
      left: 0;
      width: 111px;
      height: 30px;
      content: "*";
      color: transparent;
      position: absolute;
    }
    :scope > ul > li span {
      position: absolute;
      top: 0;
      left: 25px;
      width: 60px;
      height: 60px;
      border-radius: 30px;
      color: #2c3644;
      background-color: #D9D3C7;
      font-size: 85%;
      line-height: 60px;
      white-space: nowrap;
    }
    :scope > ul > li img {
      width: 100px;
    }
  </style>
</app-home>
