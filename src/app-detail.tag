<app-detail>
  <header>
    <h2>本の詳細</h2>
    <a class="prev" href="#{date}">戻る</a>
  </header>
  <img src={cover}>
  <h3>{title}</h3>
  <p>{description}</p>
  <ul>
    <li>{author}</li>
    <li if={price}>価格 &yen;{price}</li>
    <li>ISBN {isbn}</li>
  </ul>

  <script>
    this.on('route', (date, isbn) => {
      this.update({date, isbn})

      fetch(`data/${date}.json`)
        .then(response => response.json())
        .then(books => {
          const book = books.find(book => book.isbn === isbn)
          this.update(book)
        })
    })
  </script>

  <style>
    :scope {
      display: block;
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
    header > .prev {
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
    header > a {
      text-decoration: none;
    }
    img {
      width: 200px;
    }
    :scope > h3 {
      margin: 15px;
      padding: 0 0 5px;
      border-bottom: 1px solid rgba(255,255,255,.3)
    }
    :scope > p {
      margin: 15px;
    }
    :scope > img {
      display: block;
      margin: 15px auto;
    }
    :scope > ul {
      color: rgba(255,255,255,.7)
    }
  </style>
</app-detail>
