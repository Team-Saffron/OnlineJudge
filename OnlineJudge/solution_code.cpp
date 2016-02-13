#include<iostream>
#include<algorithm>
using namespace std;

int main()
{
int i,n,a[100];
cin>>n;
for(i=0;i<n;i++)
cin>>a[i];
sort(a,a+n);
for(i=0;i<n;i++)
cout<<a[i]<<"  ";
return 0;
}