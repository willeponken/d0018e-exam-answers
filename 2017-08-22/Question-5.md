# Question 5

## a)
B trees and B+ trees are suitable because they can greatly decrease the number of disk reads. To look up a key there is no need to traverse all the data, only a small portion that is matched to the key.
By matching the node size to the disk blocks a look up only needs to read from one disk block. The node size can also match the dick cache size, and therefore in many cases it'll not read from the actual disk.

## b)
![ins4-10](https://octodex.github.com/images/yaktocat.png)
![ins25p1](https://octodex.github.com/images/yaktocat.png)
![ins25p2](https://octodex.github.com/images/yaktocat.png)
![ins25p3](https://octodex.github.com/images/yaktocat.png)
