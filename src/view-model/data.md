# データ

データはViewModelの作成時のオプションにdataとして渡すことが出来て、ViewModelのインスタンスからは`vm.$data`として参照することが出来ます。

また、`vm.$data`の値はvmにプロキシされていて、例えば`vm.$data.name`は`vm.name`として参照することも出来ます。

```javascript
vm = new Vue({
  data: {
    name: "bob"
  }
});

console.log(vm.$data.name); // bob
console.log(vm.name);       // bob

vm.name = "jim";

console.log(vm.$data.name); // jim
console.log(vm.name);       // jim
```
