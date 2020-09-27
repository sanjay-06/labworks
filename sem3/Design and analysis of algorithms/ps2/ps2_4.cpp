#include <iostream>

#define T cout << "Test " << endl;
#define COUNT 10

using namespace std;

class Node
{
    public:
    int val;
    Node* right;
    Node* left;

    Node(int);
    friend class Tree;
};

Node :: Node(int val)
{
    right = NULL;
    left = NULL;
    this -> val = val;
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
    Node* RR(Node*&);
    Node* LL(Node*&);
    void print2DUtil(Node*, int);
    void change(Node*&, Node*&);
};

Tree :: Tree ()
{
    root = NULL;
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


void Tree :: insert(Node *&node, int value)
{

    if(node == NULL)
    {
        node = new Node (value);
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
            }
                
            else if(node->left == NULL && node->right != NULL)
            {
                Node* temp = node;
                node = node->right;
                delete temp;
            }
            else if(node->left != NULL && node->right == NULL)
            {
                Node* temp = node;
                node = node->left;
                delete temp;
            }
            else
            {
                int minimum = deleteMinNode(node->right);
                node->val = minimum;
            }
        }
    }
    
}

void Tree :: change(Node *&tree_1, Node *&tree_2)
{
    if(tree_1 != NULL)
    {
        if(tree_2 != NULL)
        {
            while(tree_1->val != tree_2->val)
            {
                if(tree_1->val > tree_2->val)
                {
                    if(tree_1->left != NULL && tree_1->left->right != NULL && tree_1->left->right->val == tree_2->val)
                    {
                        tree_1->left = RR(tree_1->left);
                        tree_1 = LL(tree_1);
                    }
                    if(tree_1->right != NULL || tree_1->left != NULL)
                    {
                        tree_1 = LL(tree_1);
                    }
                }
                if(tree_1->val < tree_2->val)
                {
                    if(tree_1->right != NULL && tree_1->right->left != NULL && tree_1->right->left->val == tree_2->val)
                    {
                        tree_1->right = LL(tree_1->right);
                        tree_1 = RR(tree_1);
                    }
                    if(tree_1->right != NULL || tree_1->left != NULL)
                    {
                        tree_1 = RR(tree_1);
                    }
                    
                }
            }
            change(tree_1->left, tree_2->left);
            change(tree_1->right, tree_2->right);
        }
    }
} 


int main()
{
    T
    Tree tree_1;
    Tree tree_2;
    int m, n;
    cout << "Please enter the number of nodes in first and second Tree" << endl;
    cin >> m;
    int count = 0;
    int val;
    while (count < m)
    {
        cin >> val;
        tree_1.insert(tree_1.root , val);
        count++;
    }
    
    count = 0;

    while (count < m)
    {
        cin >> val;
        tree_2.insert(tree_2.root , val);
        count++;
    }
    tree_1.change(tree_1.root, tree_2.root);
    tree_1.print2DUtil(tree_1.root, 0);
    cout << endl;
    tree_2.print2DUtil(tree_2.root, 0);
    return 0;
    T
}
