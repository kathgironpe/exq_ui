`import request from 'ic-ajax'`

IndexController = Ember.Controller.extend

  actions:
    clearRetries: ->
      self = this
      request({url: "api/retries", type: "DELETE"}).then ->
       console.log("clearRetries request finished")
       self.store.unloadAll('retry')
       self.send('reloadStats')
    removeRetry: (retry) ->
      self = this
      retry.deleteRecord()
      retry.save().then((f) ->
        self.send('reloadStats')
      )

`export default IndexController`
