
.MODEL SMALL
.STACK 100H 
.DATA

msg1 db '                     welcome to our super market $'
msg2 db '                     ___________________________ $'

msg_chocolates db "Chocolates Section:",13,10,13,10,"1. dairy milk    10 Tk",13,10,13,10, "2. kitkat        20 Tk$"
msg_fruits db "Fruits Section:",13,10,13,10,"1.banana    10 Tk",13,10,13,10, "2.apple    15 Tk",13,10,13,10, "3.mango    25 Tk$"
msg_cloths db "Cloths Section:",13,10,13,10,"1.Shirt    100 Tk",13,10,13,10, "2.Pant     130 Tk",13,10,13,10, "3.Shoe     250 Tk",13,10,13,10, "4.Skirt    50 Tk",13,10,13,10, "5.Saree    230 Tk$"
msg_vegetables db "Vegetables Section:",13,10,13,10,"1.Carrot    20 Tk",13,10,13,10, "2.Raddish   10 Tk",13,10,13,10,"3.Tomato    5 Tk",13,10,13,10, "4.Beans     30 Tk$"
msg_drinks db "Drinks Section:",13,10,13,10,"1.Coke    50 Tk",13,10,13,10,"2.tea     20 Tk",13,10,13,10, "3.coffee  30 Tk",13,10,13,10,"4.pepsi   80 Tk",13,10,13,10, "5.7up     95$"
msg_meat db "Meat Section:",13,10,13,10,"1.Chicken   200  Tk",13,10,13,10, "2.mutton    230 Tk",13,10,13,10, "3.meat      250 Tk$"
msg_fish db "Fish Section:",13,10,13,10,"1.hilsha    150 Tk",13,10,13,10, "2.prawn     200 Tk",13,10,13,10, "3.samon  220 Tk$"
msg_dry db "Dry Foods Section:",13,10,13,10,"1.Chips    20 Tk",13,10,13,10, "2.cake     50 Tk",13,10,13,10, "3.bread    80 Tk",13,10,13,10, "4.jelly    30 Tk",13,10,13,10,"5.egg      8 Tk$"
msg_grocery db "Grocery Section:",13,10,13,10,"1.Rice     160 Tk",13,10,13,10,"2.dal      100 Tk",13,10,13,10,"3.muri     80 Tk",13,10,13,10, "4.flour    90 Tk",13,10,13,10, "5.wheat    150 Tk$"
msg_others db "Others Section:",13,10,13,10,"1.shampoo    30 Tk",13,10,13,10, "2.soup       20 Tk",13,10,13,10, "3.cleaner    25 Tk",13,10,13,10,"4.Mop        110 Tk",13,10,13,10,"5.Mat        90 Tk$"

chocolates dw 0,10,20
fruits dw 0,10,15,25
cloths dw 0,100,130,250,50,255
vegetables dw 0,20,10,5,30
drinks dw 0,50,20,30,80,95
meat dw 0,200,230,250
fish dw 0,150,200,220
dry_food dw 0,20,50,80,30,8
grocery dw 0,160,100,80,90,150 
others dw 0,30,20,25,110,90  

SUM dw 0
temp db ?
A dw ? 



arr dw ?

catalogue dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 

msg_section db "a. Chocolates",13,10,13,10,"b. Fruits",13,10,13,10,"c. Cloths",13,10,13,10,"d. Vegetables",13,10,13,10,"e. Drinks",13,10,13,10,"f. Raw Meat",13,10,13,10,"g. Fish",13,10,13,10,"h. Dry Foods",13,10,13,10,"i. Grocery",13,10,13,10,"j. Others$"  

ask_section db "From Which section you want to pick your items(press 0 to end purchase) : $"

Total_purchase db "You have bought a total of: $"  
taka db "Tk $" 

With_Discount db "We are offering 15 percent discount on total purchase",13,10,13,10,"After Discount Your Total Purchase is: $"  
 
goodbye db "Thank You For Purchasing From Our Supermarket. We hope to see you again $"

ask_item db "Which item: $"



.CODE 
   


MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
ask_sec: 

    call clear_screen                                  ;called clear screen procedure
    
    mov ah,9
    lea dx,msg1                                        ;welcome message
    int 21h
    
    call newl                                          ;called newline procedure
    mov ah,9
    lea dx,msg2                                        ;welcome message
    int 21h 
    call newl
    call newl
    
    mov ah,9                                           
    lea dx,msg_section                                 ;List of sections
    int 21h
    
    call newl 
    call newl
    
    
    mov ah,9
    lea dx,ask_section                                ;Asked the preffered section
    int 21h 
    
    mov ah,1
    int 21h
    mov bl,al
                                                      ;cleared screen
    mov AX, 03h
    int 10h
    
    cmp bl,'0'
    je calculate                                    ;Jump to calculation after finishing purchase
    
    cmp bl,'a'
    je choose_chocolates                            ;jumped to chocolates section
    
    cmp bl,'b'
    je choose_fruits                                ;jumped to Fruits section
    
    cmp bl,'c'
    je choose_cloths                                ;jumped to Cloths section
    
    cmp bl,'d'
    je choose_vegetables                            ;jumped to Vegetables section
    
    cmp bl,'e'
    je choose_drinks                                ;jumped to Drinks section
    
    cmp bl,'f'
    je choose_meat                                  ;jumped to Meats section
    
    cmp bl,'g'
    je choose_fish                                  ;jumped to Fish section
    
    cmp bl,'h'
    je choose_dry                                   ;jumped to Dry Foods section
    
    cmp bl,'i'
    je choose_grocery                               ;jumped to Grocery section
    
    cmp bl,'j'
    je choose_others                                ;jumped to Others section
     
     
    jmp ask_sec
    
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
    
    cmp al,'2'
    jg ask_sec 
    
    sub al,48
    xor bx,bx                     ;cleared bx
    mov bl,al
    push bx                       ;pushed to stack
    
     
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
    mov bl,al
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
    cmp al,'3'
    jg ask_sec
    sub al,48
    xor bx,bx
    mov bl,al
    add bl,2
    push bx 
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
    cmp al,'5'
    jg ask_sec
    sub al,48 
    lea si,cloths
    xor bx,bx
    mov bl,al
    add bl,5
    push bx
    
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
    cmp al,'4'
    jg ask_sec
    sub al,48
    xor bx,bx
    mov bl,al
    add bl,10
    push bx 
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
    cmp al,'5'
    jg ask_sec
    sub al,48 
    xor bx,bx
    mov bl,al
    add bl,14
    push bx
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
    cmp al,'3'
    jg ask_sec
    sub al,48 
    xor bx,bx
    mov bl,al
    add bl,19
    push bx
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
    cmp al,'3'
    jg ask_sec
    sub al,48
    xor bx,bx
    mov bl,al 
    add bl,22
    push bx 
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
    cmp al,'5'
    jg ask_sec
    sub al,48
    xor bx,bx
    mov bl,al 
    add bl,25
    push bx 
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
    cmp al,'5'
    jg ask_sec
    sub al,48
    xor bx,bx
    mov bl,al 
    add bl,30
    push bx 
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
    cmp al,'5'
    jg ask_sec
    sub al,48
    xor bx,bx
    mov bl,al 
    add bl,35
    push bx
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
    
    


start1:     
;mov cx,3


stack_array:


xor bx,bx
pop bx
lea si,catalogue 
while_stack:
 
 cmp bx,0   
 je here
 add si,2 
 dec bx
 jmp while_stack
 
 here: 
 
 inc [si]
  
loop stack_array


lea si,catalogue  


start11: 
mov cx,3 
print_array: 

;mov ah,2
;mov dx,[si]            
;int 21h
;call newl 
;add si,2
;xor bx,bx

loop print_array

call newl     
calculate:
   
   mov ah,9
   lea dx,total_purchase                          ;printed purchase message
   int 21h
   
   mov ax,SUM
   call OUTDEC                                    ;called outdec procedure
   mov ah,9
   lea dx,taka 
   int 21h
    
    call newl
    call newl
     
    mov ah,9
    lea dx,With_Discount
    int 21h 
     
    mov bx,15
    mov ax,SUM                                      
    mul bx                                         ;multiplied total sum with 15(bx=15)
   
    mov bx,100
    xor dx,dx 
    div bx                                         ;divided the multiplication by 100
    or ax, ax 
    
    mov A,ax 
    mov bx,A
    mov ax,SUM
    sub ax,bx                                      ;Total sum after discount
    
    call OUTDEC  
    
    call newl
    call newl
    call newl
    
    mov ah,9
    lea dx,goodbye                                   ;Goodbye message
    int 21h
   
   
   
      
        
END:
    mov ah,4ch
    int 21h
    main endp
     
     ;|_____________________ NEWLINE PROCEDURE______________________|;
    
newl proc 
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    ret 
newl endp
    
    
   
   
   ;|_____________________OUTDEC PROCEDURE______________________|;
   
   
 
 OUTDEC PROC
    ;display a decimal number
   
   

   push bx                        
   push cx                        
   push dx                        

   start:                        

   xor cx, cx                     
   mov bx, 10                     ; set bx=10

   output:                       ; loop starts
     xor dx, dx                  ;dx holds the reminder value 
     div bx                       ; divide ax by bx
     push dx                     ; push DX onto the STACK
     inc cx                       
     or ax, ax                    
   jne output                   ; jump to OUTPUT if ZF=0

   mov ah, 2                     
                                   ;cx value already calculated before
                                   
   display:                      ; loop 
     pop dx                       ; pop a value from STACK to DX
     or dl, 30h                   ;decimal to ascii code
     int 21h                      
   loop display                  

   pop dx                        
   pop cx                        
   pop bx                        

   ret                            
 OUTDEC endp      
 
 
      ;|_____________________Clear Screen PROCEDURE______________________|;
 
clear_screen proc 

    ;mov ah, 0x06
    ;mov al, 0
    ; mov ax, 0
    ;int 10h
      
    mov AX, 03h
    int 10h 
    ret

clear_screen endp 


END MAIN

    

