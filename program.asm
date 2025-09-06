.globl _boot
.section .text

_boot:
    # Registradores usados:
    # x5 = t0 -> endereço base de memória
    # x6 = t1 -> valor anterior (fib[n-2])
    # x7 = t2 -> valor atual (fib[n-1])
    # x8 = t3 -> valor temporário para soma

    addi x5, x0, 0x80 # x5 = 0x80
    sw x0, 0(x5) # memory[0x80] = 0
    addi x7, x0, 1 # x7 = 1
    sw x7, 4(x5) # memory[0x84] = 1
    addi x6, x0, 0 # x6 = 0
    add x8, x6, x7 # x8 = x6 + x7 (fib[2] = fib[0] + fib[1])
    sw x8, 8(x5) # memory[0x88] = fib[2]
    addi x6, x7, 0 # x6 = fib[1]
    addi x7, x8, 0 # x7 = fib[2]
    add x8, x6, x7 # x8 = x6 + x7
    sw x8, 12(x5) # memory[0x8C] = fib[3]
    addi x6, x7, 0 # x6 = fib[2]
    addi x7, x8, 0 # x7 = fib[3]
    add x8, x6, x7 # x8 = x6 + x7
    sw x8, 16(x5) # memory[0x90] = fib[4]

loop:
    j loop