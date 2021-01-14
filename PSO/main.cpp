#include <bits/stdc++.h>

using namespace std;

float fitness(float x){
   return -x*x + 10;
}

float Rand(){
   float r=0.1;
   if(r>1) r=0.1;
   r= r+0.01;
   return r;
}

int main()
{
    float c1=1, c2=3, w=0.7, vv=1;
    float x[100], v[100]={0}, lc[100]={0}, f[100]={0};
    int n=10,n1;
    cout<<"How many iterations you want?"<<endl;
    cin>>n1;
    cout<<"The position and fitness function values:"<<endl;
    for(int i=0;i<n;i++){
        x[i]= rand() % 15;
        lc[i]=x[i];
        v[i]=vv;
        vv=vv-0.1;
        f[i]= fitness(x[i]);
        cout<<"Initial Position: "<<x[i]<<endl;
    }

    float bb=99999, gb;

    for(int i=0;i<n;i++){
        if(bb>f[i]){
            gb=x[i];
            bb=f[i];
        }
    }


    for(int j=0;j<n1;j++){
        cout<<"Global best: "<<gb<<endl;

        for(int i=0;i<n;i++){
            if(bb<f[i]){
            gb=x[i];
            bb=f[i];
          }
        }
        for(int i=0;i<n;i++){
            v[i]=w*v[i] + (c1*Rand()*(lc[i]-x[i])) + (c2*Rand()*(gb-x[i]));
            x[i]=x[i]+v[i];
            if(fitness(x[i])>f[i]){
                lc[i]=x[i];
                f[i]=fitness(x[i]);
            }
        }
        for(int i=0;i<n;i++){
            cout<<"Position: "<<x[i]<<endl;
        }

    }
    cout<<"Global best: "<<gb<<endl<<"Fitness value of global best: "<<fitness(gb);





    return 0;
}
