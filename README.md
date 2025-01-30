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


Assignment
=============

* must create MIPS program that runs in the MARS simulator
* program must be a bibble sort
* sort an array of 30 integers
* array must be allocated ON THE STACK
* program must print the corted numbers at the end


Basic Example Program
========================

The following is a basic example program that allocated an array of 2 integers on the stack, puts random numbers in it, and prints it out

```ruby
.data
NEWLINE: .ascizz "\n"

.text
.globl main             # required

main                    # required

addi    $sp, $sp, -8    # make space for 2 ints, 8 bytes on teh stack

li  $a0, 0              # set up random number system call
li  $a1, 100            # max random number is 100
li  $v0, 42             # syscall 42 is random number in a range

syscall                 # random number is now in $a0

sw  $a0, 0($sp)         # store the number in array location [0]
syscall                 # random number is in $a0
sw  $a0, 4($sp)         # store the number in array location [1]
                        # NOTE I am making the arrat start at a lower address
                        # and go UP in memory!

# now print out the numbers
li  $v0, 1              # set up to print int
lw  $a0, 0($sp)         # get the int to print
syscall
li  $v0, 4              # set up to print a string
la  $a0, NEWLINE        # la is LOAD ADDRESS. newline is declared
                        # at the start of the program
syscall

li  $v0, 1              # set up to print int
lw  $a0, 4($sp)         # get the int to print
syscall
li  $v0, 4              # set up to print a string
la  $a0, NEWLINE        # la is LOAD ADDRESS. newline is declared
                        # at the start of the program
syscall

li  $v0, 10             # last 2 lines are required to make program exit
syscall
```