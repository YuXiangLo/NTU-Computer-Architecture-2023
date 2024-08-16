.globl __start
.rodata
  msg: .asciiz "division by zero"

.text

__start:
  li a0, 5
  ecall
  mv s1, a0
  li a0, 5
  ecall
  mv s2, a0
  li a0, 5
  ecall
  mv s3, a0
  
  li s4, 1 # IS_SUB
  li s5, 2 # IS_MUL
  li s6, 3 # IS_DIV
  li s7, 4 # IS_MIN
  li s8, 5 # IS_POW
  li s9, 6 # IS_FAC
  
  beq s2, x0, ADD_OPR
  beq s2, s4, SUB_OPR
  beq s2, s5, MUL_OPR
  beq s2, s6, DIV_OPR
  beq s2, s7, MIN_OPR
  beq s2, s8, POW_OPR
  beq s2, s9, FAC_OPR
  beq x0, x0, EXIT

ADD_OPR:
  mv a1, x0
  add a1, s3, s1
  li a0, 1
  ecall
  j EXIT

SUB_OPR:
  mv a1, x0
  sub a1, s1, s3
  li a0, 1
  ecall
  j EXIT
  
MUL_OPR:
  mv a1, x0
  mul a1, s1, s3
  li a0, 1
  ecall
  j EXIT
  
DIV_OPR:
  beq s3, x0, DIV_NOT_PERMIT 
  mv a1, x0
  div a1, s1, s3
  li a0, 1
  ecall
  j EXIT
  
DIV_NOT_PERMIT:
  li a0, 4
  la a1, msg
  ecall
  j EXIT
  
MIN_OPR:
  slt t0, s1, s3
  beq t0, x0, LATTER
  
  mv a1, s1
  li a0, 1
  ecall
  j EXIT
  
LATTER:
  mv a1, s3
  li a0, 1
  ecall
  j EXIT
  
POW_OPR:
  li a1, 1
  li t0, 0
  loop:
	beq t0, s3, end_loop
    addi t0, t0, 1
	mul a1, a1, s1
	j loop
  end_loop:
	li a0, 1
	ecall
	j EXIT
	
FAC_OPR:
  li a1, 1
  loop2:
	beq s1, x0, end_loop
	mul a1, a1, s1
	addi s1, s1, -1
	j loop2
  end_loop2:
	li a0, 1
	ecall
	j EXIT
  
EXIT:
  li a0, 10
  ecall
