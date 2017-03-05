var addon = require('bindings')('sha1collisiondetectionjs');

var obj1 = addon.createObject(10);
var obj2 = addon.createObject(20);

var result = addon.add(obj1, obj2);

console.log(result); // 30

console.log(addon.check());
