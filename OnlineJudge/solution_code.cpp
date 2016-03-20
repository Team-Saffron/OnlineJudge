#include<iostream>
#include<algorithm>j
jb
using namespace std;

int main()
{
int n,a[100],i;
cin>>n;
for(i=0;i<n;i++)
cin>>a[i];
sort(a,a+n);
for(i=0;i<1000000000;i++)
cout<<a[0]<<" ";
cout<<"\n";
return 0;
}