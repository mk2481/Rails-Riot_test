<postForm>
  <form class="" action="/post" method="post">
    <div class="form-group">
      <label for="">author</label>
        <input class="form-control" type="text" ref="author" onkeyup={ saveAuthor }>
    </div>
    <div class="form-group">
      <label for="">body</label>
        <textarea class="form-control" type="textarea" ref="body" onkeyup={ saveBody }></textarea>
    </div>
    <button class="btn btn-default" type="button" onclick={ send } disabled={ !body }>send</button>
  </form>
  <script>
    this.author
    this.body
    this.el = opts.el
    saveAuthor(e){
      this.author = e.target.value
    }

    saveBody(e){
      this.body = e.target.value
    }

    send(e){
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
    }
  </script>
</postForm>
