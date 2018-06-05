//
//  main.cpp
//  133-CloneGraph
//
//  Created by Shvier on 2018/6/4.
//  Copyright © 2018 Shvier. All rights reserved.
//

#include <iostream>
#include <vector>
#include <stack>
#include <unordered_map>

using namespace std;

// Definition for undirected graph.
struct UndirectedGraphNode {
    int label;
    vector<UndirectedGraphNode *> neighbors;
    UndirectedGraphNode(int x) : label(x) {};
};

class Solution {
public:
    UndirectedGraphNode *cloneGraph(UndirectedGraphNode *node) {
        if (node == nullptr) {
            return node;
        }
        auto cloneNode = new UndirectedGraphNode(node->label);
        stack<UndirectedGraphNode *> nodeStack;
        nodeStack.push(node);
        unordered_map<int, UndirectedGraphNode *> doneLabels;
        doneLabels[cloneNode->label] = cloneNode;
        while (!nodeStack.empty()) {
            auto topNode = nodeStack.top();
            nodeStack.pop();
            for (auto node : topNode->neighbors) {
                if (doneLabels.find(node->label) == doneLabels.end()) {
                    auto newNode = new UndirectedGraphNode(node->label);
                    doneLabels[topNode->label]->neighbors.push_back(newNode);
                    nodeStack.push(node);
                    doneLabels[newNode->label] = newNode;
                } else {
                    doneLabels[topNode->label]->neighbors.push_back(doneLabels[node->label]);
                }
            }
        }
        return cloneNode;
    }
};

int main(int argc, const char * argv[]) {
    // insert code here...
    return 0;
}
