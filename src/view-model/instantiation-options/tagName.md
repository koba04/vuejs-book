# tagName

`el`が指定されていなくて`replace`がfalseの場合に、`$el`として新しく作成されるDOM要素のtag名です。

デフォルトでは`div`が指定されています。

```js
vm = new Vue({
    tagName: "ul",
    template: "<li>xxxx</li>"
});

document.body.appendChild(vm.$el);

console.log(document.body.innerHTML);
// <ul><li>xxxx</li></ul> 
```


