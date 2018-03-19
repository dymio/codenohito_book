Ruby programmer
===============


* Base principle — the clean, readable code.
* Base code style: identation, comments, names convention, parentheses.
* Convention behind the ! and ? in method names.
* Control structures: if, unless, then, else, ternary operator, while, until, for (not to use), case.
* Collections: arrays and hashes.
* Basic types: strings, numbers, booleans
* Symbols and it's difference with String and how method freez helps (or magic comment of frozen literals).
* Methods, splat argument (*args), hash as argument, keyword arguments.
* Classes, Instances, Superclass, visibility of the methods (public, protected and private), method :send.
* Everything is an object. What is Object and BaseObject.
* Why to use attr_accessor, attr_reader, attr_writer.
* Gems. What is it and how to use it.
* Environment control tool: RVM or rbenv.
* Dynamic typing of Ruby, differences with static typing, advantages and downsides.
    Hint: dynamic is less verbose, needs less infrastructure (no abstract parent
    classes as example) but need to be more readable, have more documentation
    and automatic tests. Also it helps to write short short, coherent methods.
    When you need write less code to define method you will do it often.
    And static typing helps you to avoid many mistakes and bugs by adding a lot
    of limitations because of types.
* Exceptions: begin..rescue..ensure, raise, etc.
* Automatic tests with Test::Unit and RSpec.
* Defining operators (+, -, == etc.).
* Equality: difference between equal?, eql?, ==, and ===. When to override every of them.
* Singleton method (method of a instance) and singleton class (not that singleton, but metaclass)
  and why class methods are also singleton methods.
* Class variables and why they were named "vertical global variables".
* Modules: as namespaces, as mixins (include vs extend).
* Blocks: block_given?, yield, yield_self, &block (+ block.call), Proc.new, lambda, closures in Ruby.
* Proc.new vs lambda: the first one loyal to args count, and his return is return of method that created the block!
* Hooks: self.inherited, self.included, at_exit, method_added, set_trace_func etc.
* method_missing: as helping hand in error handling, for delegation, magic methods.
* Open classes (defining class again will modify the existed one) and refine - monkey patching.
* define_method (good), eval, class_eval, module_eval (not so good).
* Internal and external DSL, what the difference. Treetop.
  Internal examples: RSpec, ActiveRecord Migration.
  External examples: ERB, Cucumber, HAML.
* How to make a gem and publish it.
* Ruby implementations: MRI, JRuby etc. and they're advantages.
* Lazy methods of Enumerable.
* Concurrency and Parallelism in Ruby.


Materials
---------

* "Eloquent Ruby" - book by Russ Olsen, 2011, Addison-Wesley

    @dymio: \[1+\] «Замечательная книга для упорядочивания знания Ruby. Автор
    проходит по всем основам языка, объясняя их не новичку, а человеку с опытом
    разработки. Это позволяет автору выбрать такой порядок объяснения, который
    даёт лучшее понимание именно особенностей и приципов языка, а не просто
    умения правильно составлять символы в код. Я искал такую книгу, которая
    заполнит все пробелы моего самообразования, не тратя моё время на совсем
    уж банальные вещи и эта книга оказалась идеальной для меня.
    Новичку она тоже подойдёт, но после прохождения пары курсов по языку
    и созданию хотя бы одного полноценного приложения, например, на Rails.»

* [Ruby Concurrency and Parallelism: A Practical Tutorial](https://www.toptal.com/ruby/ruby-concurrency-and-parallelism-a-practical-primer)
  article by Eqbal Quran, 2015.02.06

    @dymio \[1+\].

* ["What Is the Difference Between a Block, a Proc, and a Lambda in Ruby?"](http://awaxman11.github.io/blog/2013/08/05/what-is-the-difference-between-a-block/)
  article by Adam Waxman, 2013.08.05

    @dymio \[1+\]: "Just good."
