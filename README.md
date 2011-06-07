# reverse-polish-calculator

This is a [RPN](http://en.wikipedia.org/wiki/Reverse_Polish_notation) (Reverse Polish Notation) command line calculator. It supports arithmetic, and *most* of the methods in Ruby's [Math](http://www.ruby-doc.org/core/classes/Math.html) module.

## Synopsis

    $ rpc
    $ 5 # => stack: 5.0
             aggregate: 0
    $ 5 # => stack: 5.0, 5.0
             aggregate: 0
    $ + # => calculated: 5.0 + 5.0
             stack: 
             aggregate: 10.0
             
For more examples, check out the acceptance specs.
    
## Installation

    gem install reverse-polish-calculator

## License

reverse-polish-calculator is released under the MIT license. See LICENSE for details.

## Copyright

Copyright (c) 2011 Justin Ko