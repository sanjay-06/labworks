#include <iostream>

#define T cout << " Test " << endl;
#define COUNT 10

using namespace std;

class Node
{
    int val;
    int balance;
    Node* right;
    Node* left;
public:
    Node(int);
    friend class Tree;
};

Node :: Node(int val)
{
    right = NULL;
    left = NULL;
    this -> val = val;
    balance = 0;
}

class Tree
{
public:
    Node *root;
    Tree();
    void insert(Node*&, int);
    void deleteVal(Node*&, int);
    int deleteMinNode(Node*&);
    void inorder(Node*&);
    int returnHeight(Node*&);
    void updateBalanceFactor(Node *&, int);
    void updateBalanceFactorForTotal(Node *&);
    Node* RR(Node*&);
    Node* LL(Node*&);
    void print2DUtil(Node*, int);
};

Tree :: Tree ()
{
    root = NULL;
}

void Tree :: print2DUtil(Node *root, int space)
{
    // Base case
    if (root == NULL)
        return;

    // Increase distance between levels
    space += COUNT;

    // Process right child first
    print2DUtil(root->right, space);

    // Print current node after space
    // count
    cout<<endl;
    for (int i = COUNT; i < space; i++)
        cout<<" ";
    cout<<root->val <<"\n";

    // Process left child
    print2DUtil(root->left, space);
}

void Tree :: inorder(Node *&node)
{
    if(node != NULL)
    {
        inorder(node->left);
        cout << node->val << " " ;
        inorder(node->right);
    }
}

Node* Tree :: LL(Node*& node)
{

    Node* temp = node->left;
    node->left = temp->right;
    temp->right = node;
    return temp;
}

Node* Tree :: RR(Node*& node)
{
    Node* temp = node->right;
    node->right = temp->left;
    temp->left = node;
    return temp;
}


void Tree :: insert(Node *&node, int value)
{

    if(node == NULL)
    {
        node = new Node (value);
        updateBalanceFactor(root, value);
        return;
    }
    else if(node->val > value)
    {
        insert(node->left, value);
    }
    else
    {
        insert(node->right, value);
    }

    if(node->balance != 0 || node->balance != -1 || node->balance!= 1)
    {
        if (node->balance > 1 && value < node->left->val)
        {
            node = LL(node);
            updateBalanceFactor(root, value);
            print2DUtil(root, 0);
        }
        if (node->balance < -1 && value > node->right->val)
        {
            node = RR(node);
            updateBalanceFactor(root, value);
            print2DUtil(root, 0);
        }
        if (node->balance > 1 && value > node->left->val)
        {
            node->left = RR(node->left);
            node = LL(node);
            updateBalanceFactor(root, value);
            print2DUtil(root, 0);
        }
        if (node->balance < -1 && value < node->right->val)
        {
            node->right = LL(node->right);
            node = RR(node);
            updateBalanceFactor(root, value);
            print2DUtil(root, 0);
        }
    }
}

int Tree :: deleteMinNode(Node *&node)
{
    if(node->left != NULL)
    {
        return deleteMinNode(node->left);
    }
    else
    {
        int temp = node->val;
        Node* temp_node = node;
        node = node->right;
        delete temp_node;
        return temp; 
    } 
}

void Tree :: deleteVal(Node *&node, int value)
{
    if(node == NULL)
        return;
    else
    {
        if(node->val < value)
            deleteVal(node->right, value);
        else if(node->val > value)
            deleteVal(node->left, value);
        else
        {
            if (node->left == NULL && node->right == NULL)
            {
                Node* temp = node;
                node = NULL;
                delete temp;
                updateBalanceFactorForTotal(root);
            }
                
            else if(node->left == NULL && node->right != NULL)
            {
                Node* temp = node;
                node = node->right;
                delete temp;
                updateBalanceFactorForTotal(root);
            }
            else if(node->left != NULL && node->right == NULL)
            {
                Node* temp = node;
                node = node->left;
                delete temp;
                updateBalanceFactorForTotal(root);
            }
            else
            {
                int minimum = deleteMinNode(node->right);
                updateBalanceFactorForTotal(root);
                node->val = minimum;
            }
        }
    }
    if(node != NULL && (node->balance != 1 && node->balance != -1 && node->balance != 0))
    {
        //R 0 or R 1
        if(node->val < value && (node->left->balance == 0 || node->left->balance == 1))
        {
            node = LL(node);
            updateBalanceFactorForTotal(root);
        }
        //R(-1)
        if(node->val < value && node->left->balance == -1)
        {
            node->left->left = LL(node->left->left);
            node->left = RR(node->left);
            updateBalanceFactorForTotal(root);     
       }
        //L 0 or L(-1)
        if(node->val > value && node->right == NULL)
        {
            node = LL(node);
            updateBalanceFactorForTotal(root);
            return;
        }
        if(node->val > value && (node->right->balance == 0 || node->right->balance == -1))
        {
            node->right = RR(node->right);
            updateBalanceFactorForTotal(root);
        }
        //L 1
        if(node->val < value && node->left->balance == -1)
        {
            node->right->left = RR(node->right->left);
            node->right = LL(node->right);
            updateBalanceFactorForTotal(root);
        }
    }
}

int Tree :: returnHeight(Node *&node)
{

    if(node == NULL )
    {
        return 0;
    }

    else
    {
        int lh, rh;
        lh = 1 + returnHeight(node->left);
        rh = 1 + returnHeight(node->right);
        if(rh > lh)
            return rh;
        else
            return lh;
    }
}

void Tree :: updateBalanceFactor(Node *&node, int inserted)
{
    if(node == NULL)
        return;
    else
    {
        int lh, rh;
        
        lh = returnHeight(node->left);
        rh = returnHeight(node->right);
        node->balance = lh-rh;
        if(inserted > node->val)
            updateBalanceFactor(node->right, inserted);
        else
            updateBalanceFactor(node->left, inserted);
    }

} 

void Tree :: updateBalanceFactorForTotal(Node *&node)
{
    if(node == NULL)
        return;
    else
    {
        int lh, rh;
        updateBalanceFactorForTotal(node->left);
        lh = returnHeight(node->left);
        rh = returnHeight(node->right);
        node->balance = lh-rh;
        updateBalanceFactorForTotal(node->right);
    }

} 

int main()
{
    Tree tree;   
    int val;
	cout<<"Enter the value and press or enter to insert enter 1000 to exit"<<endl;
    while(true)
    {
        cin >> val;
        cout<<"\nThe Tree is given by:"<<endl;
        if(val == 1000)
            break;
        tree.insert(tree.root, val);
        tree.print2DUtil(tree.root, 0);
        cout << "------------------------------------------------" << endl;
    }
    return 0;
}
