<list>
  <div each={ post }>
    <p>{ ("00"+id).slice(-3) } <strong>{ author }</strong> { format(updated_at) }</p>
    <p>{ body }</p>
  </div>
  <script>
    this.post = opts.post
    format(time){
      let m = moment(time)
      return m.format("YYYY年MM月DD日 HH:mm:ss")
    }
  </script>
</list>
