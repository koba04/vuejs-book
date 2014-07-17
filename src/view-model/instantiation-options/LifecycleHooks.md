# Lifecycle Hooks

ViewModelのライフサイクルに応じて、`created`、`ready`、`attached`、`detached`、`beforeDestroy`、`afterDestroy`といったイベントが発行されます。

イベントは`hook:attached`のように`hook:eventName`という形式で発行されます。

また、ViewModelをインスタンスする際に`created`、`ready`、`attached`、`detached`、`beforeDestroy`、`afterDestroy`にメソッドを指定することも出来ます。

その際の`this`のコンテキストはViewModelのインスタンスになります。


```js
vm = new Vue({
  data: {
    name: "hook"
  },
  created: function() {
    this.$on("hook:created", function() {
      console.log("created event by " + this.name)
    });
    this.$on("hook:ready", function() {
      console.log("ready event by " + this.name)
    });
  },
  ready: function() {
    console.log("ready function by " + this.name);
  }
});

// created event by hook
// ready function by hook
// ready event by hook
```
