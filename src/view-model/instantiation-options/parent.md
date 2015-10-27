# parent

親のViewModelを指定します。

ViewModel間の親子関係を指定することで、`v-components`と同じように下記のようなメリットがあります。

1. 子のViewModelが親のViewModelのデータをテンプレート内で参照することが出来ます。
1. 子のViewModelから親のViewModelを`this.$parent`として参照することが出来ます。
1. 子のViewModelと親のViewModel間で`$dispatch`や`$broadcast`といったメソッドでイベントのやりとりが出来ます。
1. 親のViewModelが破棄されたときに子のViewModelも破棄されます。

このオプションはネストしたViewModelのメモリ管理をより上手く行うために、自らライフサイクルを管理したいような場合に便利です。

```js
var parent = new Vue({
    el: "#parent",
    template:"{{scope}}",       // parent
    afterDestroy: function() {
        console.log("parent destroy");
    },
    data: {
        scope: "parent"
    }
});

var child = new Vue({
    el: "#child",
    template:"{{scope}}/{{name}}",    // parent/child
    parent: parent,
    afterDestroy: function() {
        console.log("child destroy");
    },
    data: {
        name: "child"
    }
});

console.log(child.$parent.scope); // parent

parent.$destroy();
// child destroy
// parent destroy
```

