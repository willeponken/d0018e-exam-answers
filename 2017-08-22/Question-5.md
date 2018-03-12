# Question 5

## a)
B trees and B+ trees are suitable because they can greatly decrease the number of disk reads. To look up a key there is no need to traverse all the data, only a small portion that is matched to the key.
By matching the node size to the disk blocks a look up only needs to read from one disk block. The node size can also match the dick cache size, and therefore in many cases it'll not read from the actual disk.

## b)
![ins4-10](https://github.com/willeponken/d0018e-exam-answers/blob/master/2017-08-22/201803121419471000.jpg)
![ins25p1](https://github.com/willeponken/d0018e-exam-answers/blob/master/2017-08-22/201803121420521000.jpg)
![ins25p2](https://github.com/willeponken/d0018e-exam-answers/blob/master/2017-08-22/201803121420521001.jpg)
![ins25p3](https://github.com/willeponken/d0018e-exam-answers/blob/master/2017-08-22/201803121420521002.jpg)

## c)
The client first uses a set of seed nodes to establish a connection and discover the Cassandra network.
After that the client selects the best node, using a loadbalancing policy, lowest latency, lowest load etc.
The client will use that node to send its request to, other nodes are selected for replication according to said policy.
For a replication degree of 3, one request is stored as primary copy, and the rest (two) is stored at the replication nodes.

## d)
There is no master in Cassandra, in the sense of a server that controls all nodes. The data is however not perfectly distributed over all nodes, only at the primary and replocation nodes.
