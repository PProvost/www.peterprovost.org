---
layout: post
title: "Playing around with JavaScript modules"
date: 2013-11-06 17:42
comments: true
categories: 
- Code
tags:
- requirejs
- commonjs
- amd
- nodejs
- javascript
---

Recently I've been playing around a lot with JavaScript modules.  The
particular use case I've been thinking about is the creation of a large complex
JavaScript library in a modular and sensible way. JavaScript doesn't really do
this very well. It does it so poorly, in fact, that a sizeable number of
projects are all done in a single file. I did fine a number that used file
concatenation to assemble the output scrpit, but this seems like a stone-age
technique to me.

This led me to look at the two competing JavaScript module techniques:
[Asynchronous Module Definition][2] (AMD) and [CommonJS][3] (CJS). AMD is the
technique used in [RequireJS][1]) and CommonJS is the technique used by
[nodejs][4].

<!-- more -->

The RequireJS project has a script called r.js which will "compile" a set of
AMD  modules into a single file. There are other projects like [Browserify][5]
which do the same thing for a collection of CommonJS modules  Basically, all of
these figure out the ordering from the dependencies, concatenate the files, and
inject a minimalistic bootstrapper to provide the require/module/exports
functions. Unfortunately, this means that they all have the downside of leaving
all the 'cruft' of the module specification in the resulting file.

To illustrate what I mean by 'cruft', I will use 
[one of the examples from the browserify project][8].  This project has three
JavaScript files that use the CommonJS module syntax, and depend on each other
in a chain.

{% codeblock lang:javascript bar.js %}
module.exports = function(n) {
	return n * 3;
}
{% endcodeblock %}


{% codeblock lang:javascript foo.js %}
var bar = require('./bar');
module.exports = function(n) {
	return n * bar(n);
}
{% endcodeblock %}

{% codeblock lang:javascript main.js %}
var foo = require('./foo');
console.log(foo(5));
{% endcodeblock %}

When I run this through browserify, it produces this output:

{% codeblock lang:javascript out.js %}
;(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){
var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);
if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")
}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){
var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports
}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o])
;return s})({1:[function(require,module,exports){
module.exports = function(n) {
	return n * 3;
}

},{}],2:[function(require,module,exports){
var bar = require('./bar');

module.exports = function(n) {
	return n * bar(n);
}

},{"./bar":1}],3:[function(require,module,exports){
var foo = require('./foo');
console.log(foo(5));

},{"./foo":2}]},{},[3])
;
{% endcodeblock %}

When you run the resulting program in either a browser or nodejs, it does the
right thing and tells you 75. But look at how much garbage there is! To deal
with the require & module parts, it defines a bunch of stuff at the top,
seriously bloating the file. The original program code was 9 lines of code with
169 characters). The "compiled" version was 14 lines and 733 characters.
Minifying it with [uglifyjs][9] only shrinks it down to 713 characters.

In an ideal world, I would like system that can produce this from those same
three source files:

{% codeblock lang:javascript ideal.js %}
(function() {
	function bar(n) {
		return n * 3;
	}
	function foo(n) {
		return n * bar(n);
	}
	console.log(foo(5));
}());
{% endcodeblock %}

That looks better to me and is only 114 characters long (minified it is 95).
Because I used the module pattern, like the compiled version, it doesn't leak
anything into the global namespace.

I'd read that [JQuery][6] used AMD modules, and knew that their resulting JavaScript
files weren't cluttered up, so I took a look at their [build script][10].
Interestingly they use the optimizer from RequireJS, but then do a bunch of
post processing.  Essentially they rip out all the declares and requires and
such, and then wrap it in a closure. Pretty cool.

I found a number of other tools for doing single-file compiles, but none of
them seemed to take the kind of aggressive approach to optimization that I
think would be ideal when building a large library, so for now I've been using
a hacked up version of the JQuery build system.

I like modular code, but I'm still not very happy about what I've found for
JavaScript. I can get cohesive, decoupled and testable components using either
the AMD or CommonJS approach, but still haven't found a reasonable way to bring
it all together when building a single library.

Next up, I'm going to look at what I can get from [TypeScript][7] modules. Maybe it will give
me more of what I want.

[1]:http://www.requirejs.org/
[2]:https://github.com/amdjs/amdjs-api/wiki/AMD
[3]:http://wiki.commonjs.org/wiki/Modules/1.1
[4]:http://nodejs.org/
[5]:http://browserify.org/ 
[6]:http://jquery.com/
[7]:http://www.typescriptlang.org/
[8]:https://github.com/substack/node-browserify/tree/master/example/api/browser
[9]:https://github.com/mishoo/UglifyJS
[10]:https://github.com/jquery/jquery/blob/master/build/tasks/build.js
