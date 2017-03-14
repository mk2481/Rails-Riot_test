<home>
  <navbar/>
  <div class="container">
    <div class="page-header">
      <h1 class="h1">BBS</h1>
    </div>
    <list/>
    <postForm/>
  </div>

  <script>
    this.post
    let form
    this.el = this.on("update",() => {
      $.getJSON("/post",(json) => {
        this.post = json
        riot.mount("list", { post:this.post })
        if (!form) {
          form = riot.mount("postForm",{ el:this.el })  
        }
      })
    })

    riot.mount("navbar")
    this.el.trigger("update")

    setInterval(() => {
      this.el.trigger("update")
    },5000)


  </script>
</home>
