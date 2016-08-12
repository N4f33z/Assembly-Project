#include <bits/stdc++.h>
using namespace std;



int x,sum=0,customer;
int bought[20];
void banner()
{
    printf("\t\tWELCOME TO OUR SUPER MARKET!!\n");
    printf("\t\t----------------------------\n\n");
}

void catalogue()
{
    printf("\n\nSupermarket Catalogue:\n");
    printf("Items      Price\n");
    printf("-----      -----\n\n");
    printf("a.Chocolates:-\n 1. dairy milk    10$\n 2. kitkat        20$\n\n");
    printf("b.fruits:-\n 1.banana    10$\n 2.apple    15$\n 3.mango    25$\n\n");
    printf("c.cloths:-\n 1.Shirt    100$\n 2.Pant     130$\n 3.Shoe     250$\n 4.Skirt    50$\n 5.Saree    230$\n\n");
    printf("d.vegetables:-\n 1.Carrot    20$\n 2.Raddish   10$\n 3.Tomato    5$\n 4.Beans     30$\n\n");
    printf("e.drinks:-\n 1.Coke    50$\n 2.tea     20$\n 3.coffee  30$\n 4.pepsi   80$\n 5.7up     95$\n\n");
    printf("f.Raw Meat section:-\n 1.Chicken   200$\n 2.mutton    230$\n 3.meat      250$\n\n");
    printf("g.fish:-\n 1.hilsha    150$\n 2.prawn     200$\n 3.samon  220$\n\n");
    printf("d.dry foods:-\n 1.Chips    20$\n 2.cake     50$\n 3.bread    80$\n 4.jelly    30$\n 5.egg      8$\n\n");

    printf("e.grocery:-\n 1.Rice     160$\n 2.dal      100$\n 3.muri     80$\n 4.flour    90$\n 5.wheat    150$\n\n");
    printf("f.others :-\n 1.shampoo    30$\n 2.soup       20$\n 3.cleaner    25$\n\n");
}
int chocolates[]={0,10,20};
int fruits[]={0,10,15,25};
int cloths[]={0,100,130,250,50,255};
int vegetables[]={0,20,10,5,30};
int drinks[]={0,50,20,30,80,95};
int raw_meat[]={0,200,230,250};
int fish[]={0,150,200,220};
int dry_food[]={0,20,50,80,30,8};
int grocery[]={0,160,100,80,90,150};
int others[]={0,30,20,25};

int  Buy()
{
    printf("\n\nWhat do you want to buy\n(Enter number of the item)\n(press 0 to quit purchase)\n\nYour choice: ");

    scanf("%d",&x);
    if(x==0)
    {
        system("cls");
        return 0;
    }

    bought[x]++;
    //sum=sum+items[x];
    return 1;

}
int main()
{
    banner();

    for(int i=0;i<20;i++)
    {
        bought[i]=0;

    }
    char c;
    //printf("Are you our registered member?(y/n): ");
    //scanf("%c",&c);

    while(1)
    {
       catalogue();
       int flag=Buy();
        if(flag==0)
        {
            break;

        }

        system("cls");

    }
            printf("\n");
   for(int i=1,j=1;i<11;i++)
    {
        if(bought[i]>0)
        {
           // cout<<j<<". "<<store[i]<<" "<<items[i]<<"X"<<bought[i]<<endl<<endl;
            j++;
        }

    }

   printf("\nItems bought: %d\n\n",sum);
   if(c=='n') printf("Total amount with 15 percent discount: %.4lf\n\n",(double)sum-(double)((double)sum*15/100));
   if(c=='y') printf("Total amount with 25 percent discount: %.4lf\n\n",(double)sum-(double)((double)sum*25/100));
    printf("THANK YOU FOR SHOPPING.....");
    return 0;
}


