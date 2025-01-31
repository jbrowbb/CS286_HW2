# Jada Brown    800743234   jbrowbb@siue.edu ###########################
# HW_2  allocate array and bubble sort #################################

.data

START_TEXT: .asciiz "The Original Array: "
LIST_SEG: .asciiz ", "
NEW_LINE: asciiz "\n"

NEXT_TEXT: .asciiz "Sort Iterations:"
LOOP_NUM: .asciiz "Iteration number "
FILL: .asciiz ": "

FINAL_TEXT: .asciiz "The Sorted Array: "


.text
.globl main

main:

addi    $sp, $sp, -120      # space in stack for 30 ints

li      $t0, 0              # loop start number
li      $t1, 30             # end loop number

j Make_Array


Make_Array:
bge     $t0, $t1, Print_loop_01

li      $a0, 0              # minimum number
li      $a1, 100            # max random number value
li      $v0, 42             # generates random number
syscall