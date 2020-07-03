# Data.UUID.Next

From a UUID, get an infinite sequence of UUIDs. MD5 hashes are 128 bits of information, and so are UUIDs, so by taking the MD5 hash of a UUID, we get another UUID. By repeating this step, we get an infinite sequence of UUIDs corresponding to any one UUID.

