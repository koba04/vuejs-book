# ready

ViewModelのコンパイルが完了し、データバインディングが開始された状態で呼ばれます。

`ready`の中で`$data`の値を変更するとViewに反映されますが、プロパティを追加した場合は無視されます。追加したい場合は`created`の中で追加しておくか`data`に初期値を設定しておく必要があります。


```js

//<div id="main"></div>

vm = new Vue({
  el: "#main",
  template: "{{name}}",
  data: {
    name: "1st",
    like: ""
  },
  ready: function() {
    this.name = "2nd";
    this.age = 10;
    this.like = "music";

    console.log(this.$data.name);  // 2nd
    console.log(this.$data.age);   // undefined
    console.log(this.$data.like);   // music

    this.$watch('name', function(newName) {
      // changed name 3rd
      console.log("changed name " + newName)
    });
  }
});

Vue.nextTick(function() {
  vm.name = "3rd";
});

// <div id="main">3st</div>
```
