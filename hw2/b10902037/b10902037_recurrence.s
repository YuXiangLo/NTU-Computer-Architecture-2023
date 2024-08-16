.globl __start

.text

__start:
        li a0, 5
        ecall

        li    s0, 1
        jal   ra, fib          

        mv    a1, a0           
        li    a0, 1
        ecall                  

        j     exit             

fib:
        ble   a0, s0, L1 
        addi  sp, sp, -12      
        sw    ra, 8(sp)        
        sw    a0, 4(sp)        
        addi  a0, a0, -1       
        jal   ra, fib    
        li t1, 2      	   	   
        mul   a0, a0, t1
        sw    a0, 0(sp)        
        lw    a0, 4(sp)        
        addi  a0, a0, -2       
        jal   ra, fib          
        lw    t0, 0(sp)        
        add   a0, a0, t0       
        lw    ra, 8(sp)        
        addi  sp, sp, 12       
L1:
        ret                    

exit:
        li   a0, 10
        ecall                  
