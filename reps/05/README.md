# 05 · Delete through foreign keys

In one transaction, delete Bruno's swipes and then Bruno's card. Return how many cards and swipes are left, then roll back.

Expected: 4 cards and 3 swipes inside the transaction. The order is the point of the rep: if you delete the card first, the foreign key (`ON DELETE RESTRICT`) stops you with an error saying the card is still referenced from `swipes`.
