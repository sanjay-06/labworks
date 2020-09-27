#include <iostream> 
using namespace std; 
class BST 
{ 
    int data; 
    BST *left, *right; 
    public: 
	    BST();  
	    BST(int);  
	    BST* Insert(BST *, int);  
	    void Inorder(BST *);
	    void Preorder(BST *);
	    void Postorder(BST *);
		BST* deletemin(BST*);
		void print2D(BST*);
		void print2DUtil(BST *,int);
		int minValue(BST*);
		int maxValue(BST*);
		BST* search(BST*,int);
		BST* deleteNode(BST*,int);
		bool ifNodeExists(BST*, int);
		void searchres(BST*);
		void searchres1(BST*); 
};  
BST :: BST() : data(0), left(NULL), right(NULL){} 
BST :: BST(int value) 
{ 
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
BST* BST::deletemin(BST *root)
{
	if(!root)
	{
		return 0;
	}
	else if(root==NULL)
	{
		delete root;	
	}
	if(root!=NULL)
	{
		return root;
		root=deletemin(root->left);
	}
	
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
int BST::minValue(BST* node)  
{  
	BST * current = node;  
	while (current->left != NULL)  
	{  
	    current = current->left;  
	}  
	return(current->data);  
}  
int BST::maxValue(BST* node)  
{  
	BST * current = node;  
	while (current->right != NULL)  
	{  
	    current = current->right;  
	}  
	return(current->data);  
}  
BST* BST::search(BST* root, int key) 
{  
    if (root == NULL || root->data == key) 
       return root;  
    if (root->data < key) 
       return search(root->right, key);  
    return search(root->left, key); 
}
BST* BST::deleteNode(BST* root, int k) 
{
    if (root == NULL) 
        return root;  
    if (root->data > k) { 
        root->left = deleteNode(root->left, k); 
        return root; 
    } 
    else if (root->data < k) { 
        root->right = deleteNode(root->right, k); 
        return root; 
    }   
    if (root->left == NULL) { 
        BST* temp = root->right; 
        delete root; 
        return temp; 
    } 
    else if (root->right == NULL) { 
        BST* temp = root->left; 
        delete root; 
        return temp; 
    }  
    else { 
  
        BST* succParent = root;  
        BST *succ = root->right; 
        while (succ->left != NULL) { 
            succParent = succ; 
            succ = succ->left; 
        } 
        if (succParent != root) 
            succParent->left = succ->right; 
        else
            succParent->right = succ->right; 
        root->data = succ->data;
        delete succ;          
        return root; 
    } 
}
bool BST::ifNodeExists(BST* node, int key) 
{ 
    if (node == NULL) 
        return false; 
  
    if (node->data == key) 
        return true; 
  
    bool res1 = ifNodeExists(node->left, key); 
  
    if(res1) return true; 
  
    bool res2 = ifNodeExists(node->right, key); 
  
    return res2; 
}
void BST::searchres(BST* sear)
{
	if(sear->left!=NULL)
  	{
  		cout<<sear->left->data;
	}
	else
	{
		cout<<"\nNO left child"<<endl;
	}
} 
void BST::searchres1(BST* sear)
{
	if(sear->right!=NULL)
  	{
  		cout<<sear->right->data;
	}
	else
	{
		cout<<"\nNO right child"<<endl;
	}
}
void BST :: Inorder(BST *root) 
{ 
    if(!root) 
    { 
        return; 
    } 
    Inorder(root->left); 
    cout << root->data << " "; 
    Inorder(root->right); 
}  
void BST::Postorder(BST* node) 
{ 
    if (node == NULL) 
        return;  
    Postorder(node->left);  
    Postorder(node->right);
    cout << node->data << " "; 
} 
void BST::Preorder(BST* node) 
{ 
    if (node == NULL) 
        return;
	cout << node->data << " ";   
    Preorder(node->left);  
    Preorder(node->right);
}        
int main() 
{ 
    BST b, *root = NULL,*root1=NULL; 
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
    cout<<"\nDelete the minimum element:"<<endl;
    root1=b.deleteNode(root,b.minValue(root));
     b.print2D(root1);
    int n1;
    cout<<"\nEnter the element for search: ";
    cin>>n1;
    cout<<"\nIs the element found: "<<endl;
    if (b.ifNodeExists(root, n1)) 
        cout << "YES"<<endl; 
    else
        cout << "NO"<<endl; 
  	cout<<"\nThe maximum element in the tree is "<<b.maxValue(root)<<endl;
  	cout<<"\nEnter the node whose left child you require";
  	int n2;
  	cin>>n2;
  	BST* sear=b.search(root,n2);
  	cout<<"\nThe left child of the node is:";
  	b.searchres(sear);
  	cout<<endl;
  	cout<<"\nEnter the node whose right child you require";
  	int n3;
  	cin>>n3;
  	BST* sear1=b.search(root,n3);
  	cout<<"\nThe right child of the node is:";
  	b.searchres1(sear1);
  	cout<<endl;
  	cout<<"\nInorder of BST:"<<endl;
  	b.Inorder(root);
  	cout<<endl;
  	cout<<"\nPreorder of BST:"<<endl;
  	b.Preorder(root);
  	cout<<endl;
  	cout<<"\nPostorder of BST:"<<endl;
  	b.Postorder(root);
    return 0; 
} 
  
