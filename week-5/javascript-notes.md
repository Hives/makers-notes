# JavaScript notes

- 'prototype' inheritance model : [MDN web docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)
- [detailed breakdown of the `<script>` tag](https://www.sitepoint.com/a-detailed-breakdown-of-the-script-tag/)
- [Everything you need to know about OOP in JavaScript](https://javascriptissexy.com/oop-in-javascript-what-you-need-to-know/)  
  Nuggets:
    - prefer overwriting the prototype, like this:
      ```javascript
      User.prototype = {
          constructor: User,
          saveScore: function (theScoreToAdd) {
              this.quizScores.push(theScoreToAdd)
          }
      };
      ```
      to adding to the prototype like this:
      ```javascript
      User.prototype.saveScore = function (theScoreToAdd)  {
          this.quizScores.push(theScoreToAdd)
      };
      ```
      just on the basis that it's less code if you're adding a bunch of methods and properties. But bear in mind if you do this **it overwrites the function's constructor, so you have to add it back in**, hence `constructor: User` in the first example.
- [Anonymous vs. named functions in JS](https://dmitripavlutin.com/6-ways-to-declare-javascript-functions/#2functionexpression) (spoiler alert: prefer named functions to get more detailed output in your error messages)
- [Crockford on JavaScript](http://crockford.com/javascript/)
- [How to write better Jasmine tests with mocks](https://eclipsesource.com/blogs/2014/03/27/mocks-in-jasmine-tests/)
- [Kim's link on JavaScript module patterns (e.g. `(function() { /* code in here */ } ());`)](https://medium.com/@tkssharma/javascript-module-pattern-b4b5012ada9f). You can make things private?!
