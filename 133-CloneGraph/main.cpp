//
//  main.cpp
//  133-CloneGraph
//
//  Created by Shvier on 2018/6/4.
//  Copyright © 2018 Shvier. All rights reserved.
//

#include <iostream>

using namespace std;

// Definition for undirected graph.
struct UndirectedGraphNode {
    int label;
    vector<UndirectedGraphNode *> *neighbors;
    UndirectedGraphNode(int x) : label(x) {};
};

class Solution {
public:
    UndirectedGraphNode *cloneGraph(UndirectedGraphNode *node) {
        
    }
};

int main(int argc, const char * argv[]) {
    // insert code here...
    Solution *solution = new Solution()
    return 0;
}
