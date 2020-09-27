#include <iostream>
using namespace std;
int partition(int arr[],int l,int h)
{
    int pivot=arr[l];
    int i=l+1;
    int j=h;
    while(i<=j)
    {
        while(i<=h&&arr[i]<pivot)
            i++;
        while(j>l&&arr[j]>pivot)
            j--;
        if(i<j)
        {
            int temp=arr[i];
            arr[i]=arr[j];
            arr[j]=temp;
            i++;
            j--;
        }
        else
            i++;
    }
    arr[l]=arr[j];
    arr[j]=pivot;
    return j;
}
void sort(int arr[],int l,int h)
{
    if(l>=h)
        return;
    int pivot=partition(arr,l,h);
    sort(arr,l,pivot-1);
    sort(arr,pivot+1,h);
}
int main()
{
        int n,x;
        cout<<"Enter the size of the array: ";
     	cin>>n;
     	cin>>x;
        int i,arr[n];
        for(i=0;i<n-1;i++)
           cin>>arr[i];
        sort(arr,0,n-1);
        int ans=1;
        i=1;
        while(i<n)
        {
            if(arr[i]!=arr[i-1])
                ans++;
            i++;
        }
        if(ans==x)
           cout<<"Good\n";
        else
            if(ans<x)
                cout<<"Bad\n";
            else
                cout<<"Average\n";
    return 0;
}
