# detached

`vm.$el`がdirectiveや`vm.$appendTo()`によってDOMツリーから削除された時に呼ばれます。

`vm.$el`を直接操作して削除された場合はこのフックは呼ばれません。

```js

//<div id="main"></div>

vm = new Vue({
  el: "#main",
  template: "{{name}}",
  data: {
    name: "1st"
  },
  detached: function() {
    console.log("detached");
    console.log(document.body.innerHTML); // ""
  }
});

vm.$remove();
```
