<goto-honto>
  <a href={url}>honto</a>

  <script>
    this.url = 'https:/' + '/honto.jp/redirect.html?bookno=' + opts.isbn.slice(0, -1)
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
</goto-honto>
