# attached

`vm.$el`がdirectiveや`vm.$appendTo()`によってDOMツリーに追加された時に呼ばれます。

`vm.$el`を直接操作して追加された場合はこのフックは呼ばれません。

```js

//<div id="main"></div>

vm = new Vue({
  template: "{{name}}",
  data: {
    name: "1st"
  },
  attached: function() {
    console.log("attached");
    console.log(document.body.innerHTML); // <div id="main"><div>1st</div></div>
  }
});

vm.$appendTo("#main");
```
