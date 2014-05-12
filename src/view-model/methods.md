# Methods

ViewModelのメソッドを定義するところです。

ViewModelのdataにはJSONでシリアライズ可能なデータが格納されるため、メソッドはこちらに定義します。

ここで定義したメソッドはtemplateの中からも呼ぶことが出来て、コンテキストはViewModelのインスタンスになります。

```javascript
vm = new Vue({
  data: {
    name: "bob"
  },
  methods: {
    notify: function(message) {
      alert(message + " by " + this.name);
    }
  }
});

vm.notify("hello");
```
```html
<div v-on="click: notify('hello from DOM')">click</div>
```

