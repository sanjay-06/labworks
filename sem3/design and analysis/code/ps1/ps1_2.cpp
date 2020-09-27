#include<iostream>
using namespace std;
class BST 
{ 
    int data; 
    BST *left, *right; 
    public:
		int count; 
	    BST();  
	    BST(int);  
	    BST* Insert(BST *, int);  
		void print2D(BST*);
		void print2DUtil(BST *,int);
		BST* search(BST*,int);
};  
BST :: BST() : data(0), left(NULL), right(NULL),count(0){} 
BST :: BST(int value) 
{ 
	count=0;
    data = value; 
    left = right = NULL; 
}  
BST* BST :: Insert(BST *root, int value) 
{ 
    if(!root) 
    {  
        return new BST(value); 
    } 
    if(value > root->data) 
    {  
        root->right = Insert(root->right, value); 
    } 
    else if(value < root->data) 
    {  
        root->left = Insert(root->left, value); 
    }
	else
	{
		cout<<"\nAlready the value "<<value<< " exists\n";	
	}  
    return root; 
}  

void BST::print2DUtil(BST *root, int space)  
{    
    if (root == NULL)  
        return;    
    space += 10;    
    print2DUtil(root->right, space);    
    cout<<endl;  
    for (int i = 10; i < space; i++)  
        cout<<" ";  
    cout<<root->data<<"\n";    
    print2DUtil(root->left, space);  
}    
void BST::print2D(BST *root)  
{    
    print2DUtil(root, 0);  
}  
BST* BST::search(BST* root, int key) 
{  
	count++;
    if (root == NULL || root->data == key) 
       return root;  
    if (root->data < key) 
       return search(root->right, key);  
    return search(root->left, key);
}
int main() 
{ 
    BST b, *root = NULL; 
    int a[10],i;
    for(i=0;i<10;i++)
    a[i]=i+1;
    root = b.Insert(root, a[0]); 
   	for(i=1;i<10;i++)
    b.Insert(root, a[i]);
    cout<<endl;
    cout<<"\nThe tree is given by:"<<endl;
    b.print2D(root);
    cout<<endl;
    b.search(root,10);
    cout<<"\n It requires almost "<<b.count<<" searches";
} 
  
