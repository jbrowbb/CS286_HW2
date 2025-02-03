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



Start_program:

    li      $v0, 4
    la      $ a0, START_TEXT    # "The original array: "
    syscall

    j Make_Array



Make_Array:
    bge     $t0, $t1, Reset

    li      $a0, 0              # minimum number
    li      $a1, 100            # max random number value
    li      $v0, 42             # generates random number
    syscall

    mul     $t2, $t0, 4         # multiply for stack offset

    sw      $a0, $t2($sp)       # store the number in the array location [$t2 / 4]
    syscall                     # random number is in $a0

    addi    $t0, $t0, 1         # loop counter

    j Make_Array


Reset:
    add     $t0, $t0, $zero     # resets loop counter to 0