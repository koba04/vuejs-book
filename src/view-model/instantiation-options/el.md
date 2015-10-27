# el

ViewModelに紐付けたいDOM要素を`querySelector`の書式で指定しています。

指定したDOM要素は`vm.$el`のように`$el`でアクセスすることが出来ます。

もしこのオプションが指定されていない場合は、DOM要素が新しく作成されます。

(tagNameが指定されていればそのtagが、なければ`div`で作成されます)


```js
vm = new Vue({
  el: "#main"
});
```
```html
<div id="main"></div>
```

