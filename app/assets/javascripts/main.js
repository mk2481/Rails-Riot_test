riot.tag2('home', '<navbar></navbar> <div class="container"> <div class="page-header"> <h1 class="h1">BBS</h1> </div> <list></list> <postform></postform> </div>', '', '', function(opts) {
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

});

riot.tag2('list', '<div each="{post}"> <p>{(⁗00⁗+id).slice(-3)} <strong>{author}</strong> {format(updated_at)}</p> <p>{body}</p> </div>', '', '', function(opts) {
    this.post = opts.post
    this.format = function(time){
      let m = moment(time)
      return m.format("YYYY年MM月DD日 HH:mm:ss")
    }.bind(this)
});

riot.tag2('navbar', '<nav class="navbar navbar-default"> <div class="container-fluid"> <div class="navbar-header"> <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navItem" if="{tabs}"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button> <a class="navbar-brand">Riot+Rails</a> </div> <div id="navItem" class="collapse navbar-collapse"> <ul class="nav navbar-nav"> <li each="{tab in this.tabs}" class="{active: isActive(⁗#⁗+tab)}"> <a href="#{tab}">{tab}</a> </li> </ul> </div> </div> </nav>', '', '', function(opts) {

    this.eve;
    self = this

    $(document).ready(() => {
      $(".navbar-nav li a").click((event) => {
        self.eve = event.currentTarget.hash
        $(".navbar-collapse").collapse("hide")
        riot.update()
      });
    })
    isActive = (tab) => {
      return this.eve == tab
    }
});

riot.tag2('postform', '<form class="" action="/post" method="post"> <div class="form-group"> <label for="">author</label> <input class="form-control" type="text" ref="author" onkeyup="{saveAuthor}"> </div> <div class="form-group"> <label for="">body</label> <textarea class="form-control" type="textarea" ref="body" onkeyup="{saveBody}"></textarea> </div> <button class="btn btn-default" type="button" onclick="{send}" disabled="{!body}">send</button> </form>', '', '', function(opts) {
    this.author
    this.body
    this.el = opts.el
    this.saveAuthor = function(e){
      this.author = e.target.value
    }.bind(this)

    this.saveBody = function(e){
      this.body = e.target.value
    }.bind(this)

    this.send = function(e){
      this.el.trigger("update")
      let author = this.author || "ほげ男"
      let body = this.body
      console.log(`${ author },${ body }`);
      $.post({
        url: "/post",
        type: "post",
        data: {"author":author,"body":body}
      }).then(() => {
        this.el.trigger("update")
      })
    }.bind(this)
});
