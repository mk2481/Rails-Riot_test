<navbar>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navItem" if={ tabs }>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand">Riot+Rails</a>
      </div>

      <!-- navItem -->
      <div id="navItem" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li each={tab in this.tabs} class={active: isActive("#"+tab)}>
            <a href="#{tab}">{tab}</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <script>
    // this.tabs = ["list","edit"]
    this.eve;
    self = this
    // 閉じる
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
  </script>
</navbar>
