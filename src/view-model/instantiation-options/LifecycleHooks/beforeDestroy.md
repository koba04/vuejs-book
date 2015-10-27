# beforeDestory

ViewModelが破棄(`destroy`)される前に呼ばれます。

この段階ではデータバインディングなどは全てまだ有効で、子のViewModelもまだ有効です。

このフックは内部的に使われることがほとんどですが、createdやreadyで行った準備に対するクリーンアップ処理として使うことはあるかもしれません。

`$on`や`$watch`などの解除は`$destroy`の処理の中で行われるので明示的に行う必要はありません。


```js

//<div id="main"></div>

vm = new Vue({
  el: "#main",
  template: "{{name}}",
  data: {
    name: "destroy"
  },
  beforeDestroy: function() {
    console.log("beforeDestroy");
    console.log(this.name);       // destroy
    console.log(document.body.innerHTML);
    // <section><div id="main" class="main">destroy</div></section>
  }
});

vm.$destroy();
```
