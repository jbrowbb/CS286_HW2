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