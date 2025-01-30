Overview
============

Purpose of assignment:

* gain familiarity with MIPS assembly language programming
* create a bubble sort algorithm
* print out the sorted array


Algorithm
=============

```ruby
#include <studio.h>
#include <stdlib.h>

int main() {
    int array [5000];

    for(int i = 0; i < 5000; i++) {
        array[i] = rand() %100;
    }

    for(int i = 0; i < 4999; i++) {
        for(int j = 0; j < 4999-i; j++) {
            if(array[j+1] < array[j]) {
                int temp = array[j];
                array[j] = array[j+1]
                array[j+1] = temp;
            }
        }
    }

    for(int i = 0; i < 5000; i++) {
        printf("%i\n", array[i])
    }
}
```


MIPS Implementation Notes
============================

## syscall

* code 1 tp print integers (put the integer to print in $a0)
* code 4 to print a string (a newline character in our case)
* code 42 to get a random number

### Example code

the following code shows how to get a random number, then print it

```ruby
li  $a0, 0      # set up random number system call
                # use generator 0
li  $a1, 100    # max random number is 100
li  $v0, 42     # syscall 42 is random number in a range.
                # Result goes to $a0
syscall
li  $v0, 1      # set up to print int with syscall number
syscall
```