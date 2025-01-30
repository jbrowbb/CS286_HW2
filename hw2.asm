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
.global main

main

addi    $sp, $sp, -120      # space in stack for 30 ints