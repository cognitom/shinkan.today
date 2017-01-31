<app>
  <h1>shinkan.today</h1>

  <router>
    <route path="*/*"><app-detail /></route>
    <route path="*"><app-search /></route>
    <route path="/"><app-search /></route>
  </router>

  <script>

  </script>

  <style>
    :scope {
      display: block;
      padding-bottom: 50px;
    }
    h1 {
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
  </style>
</app>
