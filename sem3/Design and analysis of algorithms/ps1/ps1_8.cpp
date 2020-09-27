#include <iostream>

#define T cout << "Test" << endl;
#define COUNT 10

using namespace std;

class Node
{
    int val;
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
    void print2DUtil(Node*, int);
    bool findElement(Node*&, int);
};

Tree :: Tree ()
{
    root = NULL;
}


void Tree :: print2DUtil(Node *root, int space)
{
    if (root == NULL)
        return;
    space += COUNT;
    print2DUtil(root->right, space);
    cout<<endl;
    for (int i = COUNT; i < space; i++)
        cout<<" ";
    cout<<root->val <<"\n";
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

bool Tree :: findElement(Node *&node, int value)
{
    if(node->val == value)
        return true;
    if(node->left == NULL && node->right == NULL)
        return false;    
    if(node->val > value)
          findElement(node->left, value);
    if(node->val < value)
        findElement(node->right, value);  
}


int main()
{
    Tree tree;
    
    int val;
    int n, m;
    cout << "Please enter the number of students that are in the class" << endl;
    cin >> n;
    cout << "Please enter the number of students that are yet to come the class" << endl;
    cin >> m;

    int count = 0;
    cout << "Please enter the number of candies the students have " << endl; 
    while (count < n)
    {
        cin >> val;
        tree.insert(tree.root, val);
        count++;
    }

    cout << "Please enter the number of candies the upcoming students have" << endl;
    count = 0;
    while (count < m)
    {
        cin >> val;
        if(tree.findElement(tree.root, val))
        {
            cout << "YES" << endl;
        }
        else
        {
            cout << "NO" << endl;
        }
        
        count++;
    }

    return 0;
}
