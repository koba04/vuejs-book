# paramAttributes

ViewModelの初期値として設定したいDOMの属性名を配列で指定します。

HTMLの属性としてViewModelにセットしたい値を指定し、ViewModelの側では`paramAttribute`として指定することでdataの初期値として設定されます。

```html
<div id="test" size="100" message="hello!"></div>
```
```js
new Vue({
    el: '#test',
    paramAttributes: ['size', 'message'],
    created: function () {
        console.log(this.size) // 100
        console.log(this.message) // 'hello!'
        console.log(this.$data.message) // 'hello!'
    }
})
```

ただし、この値は初期値として使用されるだけですので、ViewModelの側で値を変更したりDOMの属性値を変更しても値が同期されることはありません。

```js
new Vue({
    el: '#test',
    paramAttributes: ['size'],
    ready: function() {
        this.$el.setAttribute("size", 400);
        var that = this;
        Vue.nextTick(function() {
            console.log(that.size); // 100
            console.log(that.$el.getAttribute("size")); // 400
        });
    },
})
```

## 想定される用途

サーバーサイドでtemplateを描画するようなアプリケーションにおいて、ViewModelの初期値を渡したいときにparamAttributesを用いて設定するといった使用方法が考えられます。

