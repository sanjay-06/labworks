#include<iostream>
using namespace std;
class BST 
{ 
    int data; 
    BST *left, *right; 
    public: 
	    BST();  
	    BST(int);  
	    BST* Insert(BST *, int);  
		void print2D(BST*);
		void print2DUtil(BST *,int);
		int count(BST*);
};  
BST :: BST() : data(0), left(NULL), right(NULL){} 
BST :: BST(int value) 
{ 
    data = value; 
    left = right = NULL; 
}
int BST::count(BST *node)
{
	if (node == NULL)  
        return 0;  
    else
    {  
        int lDepth = count(node->left);  
        int rDepth = count(node->right);  
        if (lDepth > rDepth)  
            return(lDepth + 1);  
        else return(rDepth + 1);  
    }  
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

int main() 
{ 
    BST b, *root = NULL; 
    int n;
    cout<<"Enter the no. of values ";
    cin>>n;
    int a[n],i;
    for(i=0;i<n;i++)
    cin>>a[i];
    root = b.Insert(root, a[0]); 
   	for(i=1;i<n;i++)
    b.Insert(root, a[i]);
    cout<<endl;
    cout<<"\nThe tree is given by:"<<endl;
    b.print2D(root);
    cout<<endl;
    cout<<"\nThe height of the tree is: "<<b.count(root);
    return 0; 
} 
  
