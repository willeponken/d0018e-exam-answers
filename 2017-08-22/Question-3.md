# Question 3

## a)
For transactions:
 - _Atomicity_ means that a transaction is all or nothing - i.e. if a the network fails the transaction will be rolled back.
 - _Consistency_ means that any transaction can only modify data in allowed ways.
 - _Isolation_ A transaction can not be affected by any other - i.e. transactions are executed in a serial manner.
 - _Durability_ A network loss or power failure will not invalidate finished transactions.
 
## b)
BASE stands for **B**asically **A**vailable **S**oft state **E**ventual consistency.

 - Basically Available: The system will always answer an request (either with current data or outdated).
 - Soft state: If no updates are made there can still be changes to the system due to _eventual consistency_.
 - Eventual consistency: The system will eventually return the current data if not updates are made to that item.
 
## c)
SQL databases follows ACID, meaning a secure, fail-safe and stable database. A request will always get the current data.

## d)
KV (Key-Value) stores can be both eventually consistent and serialized, but often the serializability is traded off for better look up performance.
KV stores also often use less memory than SQL databases.
