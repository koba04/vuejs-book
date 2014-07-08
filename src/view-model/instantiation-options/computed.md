# computed

computedはfisrtNameとlastNameを組み合わせてfullNameというプロパティを作りたい場合など、シンプルなGetter、Setterとして使うと便利な機能です。

computed propertyの値の中で使用している変数が更新されると自動的にcomputed propertyの値も更新されます。

下記の様にプロパティの値として関数を定義すると、それはGetterとして扱われます。

```javascript
vm = new Vue({
  el: "#test",
  data: {
    scores: [10,20,30]
  },
  computed: {
    totalScore: function() {
      return this.scores.reduce(function(total, score) {
        return total + score;
      });
    },
  }
});

console.log(vm.totalScore); // 60
```

Getter、Setterを定義したい場合はこのように、`$get`と`$set`を定義します。

```javascript
vm = new Vue({
  el: "#test",
  data: {
    scores: [10,20,30]
  },
  computed: {
    totalScore: {
      $get: function() {
        return this.scores.reduce(function(total, score) {
          return total + score;
        });
      },
      $set: function(value) {
        this.scores.push(value)
      }
    },
  }
});

console.log(vm.totalScore); // 60
vm.totalScore = 20;
console.log(vm.totalScore); // 80
```

## 注意点

computed propertyがどの変数に依存しているかはGetterでの参照時に収集されるので、例えば依存しているにも関わらず分岐によって参照されない変数があると、その変数については変更を検知することが出来ません。

```javascript
vm = new Vue({
  el: "#test",
  data: {
    okMsg: "ok",
    errMsg: "error",
    validated: true,
  },
  // this.errMsgは参照されないので値が追跡されない
  computed: {
    status: function () {
      return this.validated
        ? this.okMsg
        : this.errMsg
    }
  },
  methods: {
    toggle: function() {
      this.validated = !this.validated;
    }
  }
});
```
```html
<!-- toggleさせてerrMsgが出すようにし、errMsgの値を変更しても{{status}}に反映されない -->
<div id="test">
    <input v-model="okMsg">
    <input v-model="errMsg">
    <button v-on="click: toggle">toggle</button>
    <p>{{status}}</p>
</div>
```

* http://jsfiddle.net/N3JQk/

  * inputのokのメッセージを編集するとリアルタイムでstatusにも反映されますが、toggleしてerrorのinputのメッセージを編集してもリアルタイムで反映されないことがわかると思います。


そういった場合は、this.xxx;などど書くことで強制的に値を参照させる必要があります。
```javascript
  // this.errMsgは参照されないので値が追跡されない
  computed: {
    status: function () {
      this.okMsg;
      this.errMsg;
      return this.validated
        ? this.okMsg
        : this.errMsg
    }
  },
```
* template内での{{}}についてはVue.jsのparserがうまくやってくれるので心配する必要はありません。


