# afterDestory

ViewModelが完全に破棄された後に呼ばれます。

このフックが呼ばれた時は、すでに全てのデータバインディングや子のViewModelが破棄されています。

```js

//<div id="main"></div>

vm = new Vue({
  el: "#main",
  template: "{{name}}",
  data: {
    name: "destroy"
  },
  afterDestroy: function() {
    console.log("afterDestroy");
    console.log(this.name);       // destroy
    console.log(document.body.innerHTML);
    // <section></section>
  }
});

vm.$destroy();
```
