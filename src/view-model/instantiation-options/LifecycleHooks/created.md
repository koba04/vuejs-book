# created

ViewModelのコンパイルが開始する前に同期的に呼ばれます。

コンパイル開始前ですので、`$el`や`$data`は有効ですがDOMはまだ準備出来ておらずデータバインディングはまだ有効ではありません。

(つまり`created`の中で`$data`の値を更新してもDOMには反映されません。)

`created`はViewModelの初期状態に何か追加したい場合に使われ、関数ではないプロパティをセットすると、後ほど`$data`にコピーされてデータバインディングの対象となります。

`created`の中で`$watch`を使うとデータバインディングが開始されたタイミングでも呼ばれます。変更されたときだけ呼ばれて欲しい場合は後述の`ready`の中で`$watch`を設定してください。


```js
//<div id="main"></div>

vm = new Vue({
  el: "#main",
  template: "{{name}}",
  data: {
    name: "1st"
  },
  created: function() {
    this.$data.name = "2nd";
    this.sum = function (a, b) { return a + b; };
    this.age = 10;
    this.$watch('name', function(newName) {
      console.log("changed name " + newName)
    });
  }
});

Vue.nextTick(function() {
  vm.name = "3rd";
});

console.log(vm.$data.age); // 10
console.log(vm.$data.sum); // undefined
// changed name 1st
// changed name 3rd
// <div id="main">1st</div>
```
