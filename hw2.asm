# Jada Brown    800743234   jbrowbb@siue.edu ###########################
# HW_2  allocate array and bubble sort #################################

.data

LIST_SEG: .asciiz ", "
NEW_LINE: asciiz "\n"

FINAL_TEXT: .asciiz "The Sorted Array: "


.text
.globl main

main:

    addi    $sp, $sp, -120      # space in stack for 30 ints

    li      $t0, 0              # loop start number
    li      $t1, 29             # end loop number



Start_program:

    