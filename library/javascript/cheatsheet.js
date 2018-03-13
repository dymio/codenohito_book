/*
 * JavaScript cheatsheet
 */

// Variables
var x;
x = 12;

var x = 12,
    my_variable_name = 14,
    z;

// Types
x = 1;                // Integer
x = 0.01;             // Real (Float)
x = NaN;

x = "hello world";    // String
x = 'JavaScript';

x = true;             // Boolean
x = false;

x = /javascript/gi;   // A regular expression

x = null;
x = undefined;

// Objects
var book = {             // Object
  topic: 'JavaScript',   // The property 'topic' has value 'JavaScript' (String)
  fat: true
};
book.topic                 // returns 'JavaScript'
book["fat"]                // returns true
book.author = "Flanagan";  // set new property
book.contents = {};        // set an empty Object as property 'contents'

// Arrays
var primes = [2, 3, 5, 7]; // An array of 4 values
primes[0]                  // The first element of the array (returns 2)
primes.length              // How many elements in the array (returns 4)
primes[primes.length-1]    // The last element of the array (returns 7)
primes[4] = 9;             // Add a new element by assignment.
primes[4] = 11;            // Or alter an existing element by assignment.
var empty = [];
empty.length               // == 0

var points = [             // An array of objects
  {x:0, y:0},
  {x:1, y:1}
];
var data = {               // An object which properties are arrays
  trial1: [[1,2], [3,4]],
  trial2: [[2,3], [4,5]]
};
