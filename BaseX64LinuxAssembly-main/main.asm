extern printf
extern scanf
extern exit

global main

section .text

main:
  ;Asks for name
  mov rdi, askName
  push rbx
  call printf
  pop rbx

  ;record name
  mov rdi, nameFormat
  mov rsi, name
  push rbx
  call scanf
  pop rbx

  ;Asks for age
  mov rdi, askAge
  push rbx
  call printf
  pop rbx

  ;record askAge
  mov rdi, ageFormat
  mov rsi, age
  push rbx
  call scanf
  pop rbx

  ;mult age by 7
  mov rax, [age]
  mov rbx, 7
  imul rbx
  mov [age_in_dog_years], rax

  ;output age in dog years
  mov rdi, outputFormat1
  mov rsi, name
  mov rdx, [age_in_dog_years]
  push rbx
  call printf
  pop rbx

  ;age in 2100 (add 78)
  mov rax, [age]
  add rax, 78
  mov [age_in_2100], rax

  ;output age in year 2100
  mov rdi, outputFormat2
  mov rsi, name
  mov rdx, [age_in_2100]
  push rbx
  call printf
  pop rbx


  ;exit(0)
  mov rax, 0
  call exit

section .data
  askName db "What is your name? ", 0
  nameFormat db "%s", 0

  askAge db "How old are you? ", 0
  ageFormat db "%d", 0

  outputFormat1 db "%s is %d dog years old", 0ah, 0dh, 0
  outputFormat2 db "%s will be %d years old in 2100", 0ah, 0dh, 0

section .bss
  name resb 50
  age resq 1
  age_in_dog_years resq 1
  age_in_2100 resq 1

