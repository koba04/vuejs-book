# attributes

`$el`に設定されているDOM要素の属性値です。


```js
vm = new Vue({
  attributes: {
    width: "100",
    height: "200"
  }
});

console.log(vm.$el.getAttribute("width")); // 100
console.log(vm.$el.getAttribute("height")); // 200
```
