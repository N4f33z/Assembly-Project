.MODEL SMALL
.STACK 100H 
.DATA

msg1 db 'welcome to our super market $'
msg2 db '___________________________ $'

msg_chocolates db "Chocolates Section:",13,10,13,10,"1. dairy milk    10 Tk",13,10,13,10, "2. kitkat        20 Tk$"
msg_fruits db "Fruits Section:",13,10,13,10,"1.banana    10 Tk",13,10,13,10, "2.apple    15 Tk",13,10,13,10, "3.mango    25 Tk$"
msg_cloths db "Cloths Section:",13,10,13,10,"1.Shirt    100 Tk",13,10,13,10, "2.Pant     130 Tk",13,10,13,10, "3.Shoe     250 Tk",13,10,13,10, "4.Skirt    50 Tk",13,10,13,10, "5.Saree    230 Tk$"
msg_vegetables db "Vegetables Section:",13,10,13,10,"1.Carrot    20 Tk",13,10,13,10, "2.Raddish   10 Tk",13,10,13,10,"3.Tomato    5 Tk",13,10,13,10, "4.Beans     30 Tk$"
msg_drinks db "Drinks Section:",13,10,13,10,"1.Coke    50 Tk",13,10,13,10,"2.tea     20 Tk",13,10,13,10, "3.coffee  30 Tk",13,10,13,10,"4.pepsi   80 Tk",13,10,13,10, "5.7up     95$"
msg_meat db "Meat Section:",13,10,13,10,"1.Chicken   200  Tk",13,10,13,10, "2.mutton    230 Tk",13,10,13,10, "3.meat      250 Tk$"
msg_fish db "Fish Section:",13,10,13,10,"1.hilsha    150 Tk",13,10,13,10, "2.prawn     200 Tk",13,10,13,10, "3.samon  220 Tk$"
msg_dry db "Dry Foods Section:",13,10,13,10,"1.Chips    20 Tk",13,10,13,10, "2.cake     50 Tk",13,10,13,10, "3.bread    80 Tk",13,10,13,10, "4.jelly    30 Tk",13,10,13,10,"5.egg      8 Tk$"
msg_others db "Others Section:",13,10,13,10,"1.shampoo    30 Tk",13,10,13,10, "2.soup       20 Tk",13,10,13,10, "3.cleaner    25 Tk$"
msg_grocery db "Grocery Section:",13,10,13,10,"1.Rice     160 Tk",13,10,13,10,"2.dal      100 Tk",13,10,13,10,"3.muri     80 Tk",13,10,13,10, "4.flour    90 Tk",13,10,13,10, "5.wheat    150 Tk$"

chocolates dw 0,10,20
fruits dw 0,10,15,25
cloths dw 0,100,130,250,50,255
vegetables dw 0,20,10,5,30
drinks dw 0,50,20,30,80,95
meat dw 0,200,230,250
fish dw 0,150,200,220
dry_food dw 0,20,50,80,30,8
grocery dw 0,160,100,80,90,150 
others dw 0,30,20,25  

SUM dw 0  

msg_section db "a. Chocolates",13,10,13,10,"b. Fruits",13,10,13,10,"c. Cloths",13,10,13,10,"d. Vegetables",13,10,13,10,"e. Drinks",13,10,13,10,"f. Raw Meat",13,10,13,10,"g. Fish",13,10,13,10,"h. Dry Foods",13,10,13,10,"i. Grocery",13,10,13,10,"j. Others$"  

ask_section db "From Which section you want to pick your items : $"

Total_purchase db "You have bought a total of: $"  
taka db "Tk $"

ask_item db "Which item: $"



.CODE 
   


MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
ask_sec: 

    mov AX, 03h
    int 10h  
    
    mov ah,9
    lea dx,msg_section
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,9
    lea dx,ask_section
    int 21h 
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov AX, 03h
    int 10h
    
    cmp bl,'0'
    je calculate
    
    cmp bl,'a'
    je choose_chocolates
    
    cmp bl,'b'
    je choose_fruits
    
    cmp bl,'c'
    je choose_cloths
    
    cmp bl,'d'
    je choose_vegetables
    
    cmp bl,'e'
    je choose_drinks
    
    cmp bl,'f'
    je choose_meat
    
    cmp bl,'g'
    je choose_fish
    
    cmp bl,'h'
    je choose_dry
    
    cmp bl,'i'
    je choose_grocery
    
    cmp bl,'j'
    je choose_others
    
choose_chocolates:
    
    lea dx,msg_chocolates
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    

    mov ah,9
    lea dx,ask_item               ;asked the item to be bought
    int 21h 
    
    mov ah,1                      ;input item index
    int 21h
    sub al,48 
    lea si,chocolates
    
    while_choco:
          
    cmp al,0
    je do_choco                          ;went to the index
    add si,2
    dec al
    
    jmp while_choco
    
    do_choco: 
    mov dx,[si]                     ;retrieved the index element
    add SUM,dx                      ;added to the total cost
    jmp ask_sec                     ;jumped to section asking
    
choose_fruits:
    
    lea dx,msg_fruits
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,9
    lea dx,ask_item               ;asked item
    int 21h
    
    mov ah,1                      ;input item index
    int 21h
    sub al,48 
    lea si,fruits
    
    while_fruits:
          
    cmp al,0
    je do_fruits                          ;went to the index
    add si,2
    dec al
    
    jmp while_fruits
    
    do_fruits: 
    mov dx,[si]                     ;retrieved the index element
    add SUM,dx                      ;added to the total cost
    jmp ask_sec                     ;jumped to section asking
    
      

choose_cloths:

    lea dx,msg_cloths
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,9
    lea dx,ask_item               ;asked item
    int 21h     
      
    
    mov ah,1                      ;input item index
    int 21h
    sub al,48 
    lea si,cloths
    
    while_cloths:
          
    cmp al,0
    je do_cloths                          ;went to the index
    add si,2
    dec al
    
    jmp while_cloths
    
    do_cloths: 
    mov dx,[si]                     ;retrieved the index element
    add SUM,dx                      ;added to the total cost
    jmp ask_sec                     ;jumped to section asking
    
    
    
    
choose_vegetables:
    lea dx,msg_vegetables
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,9
    lea dx,ask_item               ;asked item
    int 21h 
     
    
    mov ah,1                      ;input item index
    int 21h
    sub al,48 
    lea si,vegetables
    
    while_vegetables:
          
    cmp al,0
    je do_vegetables                          ;went to the index
    add si,2
    dec al
    
    jmp while_vegetables
    
    do_vegetables: 
    mov dx,[si]                     ;retrieved the index element
    add SUM,dx                      ;added to the total cost
    jmp ask_sec                     ;jumped to section asking  
    
    
    
choose_drinks:
    lea dx,msg_drinks
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,9
    lea dx,ask_item               ;asked item
    int 21h
     
    
    mov ah,1                      ;input item index
    int 21h
    sub al,48 
    lea si,drinks
    
    while_drinks:
          
    cmp al,0
    je do_drinks                          ;went to the index
    add si,2
    dec al
    
    jmp while_drinks
    
    do_drinks: 
    mov dx,[si]                     ;retrieved the index element
    add SUM,dx                      ;added to the total cost
    jmp ask_sec                     ;jumped to section asking
    
    
    
choose_meat: 
    lea dx,msg_meat
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,9
    lea dx,ask_item               ;asked item
    int 21h
    
    
    mov ah,1                      ;input item index
    int 21h
    sub al,48 
    lea si,meat
    
    while_meat:
          
    cmp al,0
    je do_meat                          ;went to the index
    add si,2
    dec al
    
    jmp while_meat
    
    do_meat: 
    mov dx,[si]                     ;retrieved the index element
    add SUM,dx                      ;added to the total cost
    jmp ask_sec                     ;jumped to section asking
    
    
    
choose_fish:
    lea dx,msg_fish
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,9
    lea dx,ask_item               ;asked item
    int 21h 
     
    
    mov ah,1                      ;input item index
    int 21h
    sub al,48 
    lea si,fish
    
    while_fish:
          
    cmp al,0
    je do_fish                          ;went to the index
    add si,2
    dec al
    
    jmp while_fish
    
    do_fish: 
    mov dx,[si]                     ;retrieved the index element
    add SUM,dx                      ;added to the total cost
    jmp ask_sec                     ;jumped to section asking 
    
    
    
choose_dry:
    lea dx,msg_dry
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,9
    lea dx,ask_item               ;asked item
    int 21h 
      
    
    mov ah,1                      ;input item index
    int 21h
    sub al,48 
    lea si,dry_food
    
    while_dry:
          
    cmp al,0
    je do_dry                          ;went to the index
    add si,2
    dec al
    
    jmp while_dry
    
    do_dry: 
    mov dx,[si]                     ;retrieved the index element
    add SUM,dx                      ;added to the total cost
    jmp ask_sec                     ;jumped to section asking
    
    
    
choose_grocery:
    lea dx,msg_grocery
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,9
    lea dx,ask_item               ;asked item
    int 21h 
     
    
    mov ah,1                      ;input item index
    int 21h
    sub al,48 
    lea si,grocery
    
    while_grocery:
          
    cmp al,0
    je do_grocery                          ;went to the index
    add si,2
    dec al
    
    jmp while_grocery
    
    do_grocery: 
    mov dx,[si]                     ;retrieved the index element
    add SUM,dx                      ;added to the total cost
    jmp ask_sec                     ;jumped to section asking
    
choose_others:
    lea dx,msg_others
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,9
    lea dx,ask_item               ;asked item
    int 21h
     
    
    mov ah,1                      ;input item index
    int 21h
    sub al,48 
    lea si,others
    
    while_others:
          
    cmp al,0
    je do_others                          ;went to the index
    add si,2
    dec al
    
    jmp while_others
    
    do_others: 
    mov dx,[si]                     ;retrieved the index element
    add SUM,dx                      ;added to the total cost
    jmp ask_sec                     ;jumped to section asking
    
    
    
    
calculate:
   
   mov ah,9
   lea dx,total_purchase
   int 21h
   
   mov ax,SUM
   call OUTDEC
   mov ah,9
   lea dx,taka 
   int 21h
   
   
      
        
END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
     
     ;|_____________________ NEWLINE PROCEDURE______________________|;
    
newl proc 
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h  
newl endp
    
    
    ;|_____________________ SUM PROCEDURE______________________|;
    
    
SUMMATION PROC
   ; this procedure will calculate the sum of an array
   ; input : SI=offset address of the array
   ;       : BX=size of the array
   ; output : AX=sum of the array

   PUSH CX                        ; push CX onto the STACK
   PUSH DX                        ; push DX onto the STACK

   XOR AX, AX                     ; clear AX
   XOR DX, DX                     ; clear DX
   MOV CX, BX                     ; set CX=BX

   @SUM:                          ; loop label
     MOV DL, [SI]                 ; set DL=[SI]
     ADD AX, DX                   ; set AX=AX+DX
     add SI,2                       ; set SI=SI+1
   LOOP @SUM                      ; jump to label @SUM while CX!=0

   POP DX                         ; pop a value from STACK into DX
   POP CX                         ; pop a value from STACK into CX

   RET                            ; return control to the calling procedure
 SUMMATION ENDP
   
   
   ;|_____________________OUTDEC PROCEDURE______________________|;
   
   
 
 OUTDEC PROC
   ; this procedure will display a decimal number
   ; input : AX
   ; output : none

   PUSH BX                        ; push BX onto the STACK
   PUSH CX                        ; push CX onto the STACK
   PUSH DX                        ; push DX onto the STACK

   CMP AX, 0                      ; compare AX with 0
   JGE @START                     ; jump to label @START if AX>=0

   PUSH AX                        ; push AX onto the STACK

   MOV AH, 2                      ; set output function
   MOV DL, "-"                    ; set DL='-'
   INT 21H                        ; print the character

   POP AX                         ; pop a value from STACK into AX

   NEG AX                         ; take 2's complement of AX

   @START:                        ; jump label

   XOR CX, CX                     ; clear CX
   MOV BX, 10                     ; set BX=10

   @OUTPUT:                       ; loop label
     XOR DX, DX                   ; clear DX
     DIV BX                       ; divide AX by BX
     PUSH DX                      ; push DX onto the STACK
     INC CX                       ; increment CX
     OR AX, AX                    ; take OR of Ax with AX
   JNE @OUTPUT                    ; jump to label @OUTPUT if ZF=0

   MOV AH, 2                      ; set output function

   @DISPLAY:                      ; loop label
     POP DX                       ; pop a value from STACK to DX
     OR DL, 30H                   ; convert decimal to ascii code
     INT 21H                      ; print a character
   LOOP @DISPLAY                  ; jump to label @DISPLAY if CX!=0

   POP DX                         ; pop a value from STACK into DX
   POP CX                         ; pop a value from STACK into CX
   POP BX                         ; pop a value from STACK into BX

   RET                            ; return control to the calling procedure
 OUTDEC ENDP      
 
 
 
 
clear_screen proc 

    ;mov ah, 0x06
    ;mov al, 0
    ; mov ax, 0
    ;int 10h
      
    mov AX, 03h
    int 10h

clear_screen endp 


END MAIN
