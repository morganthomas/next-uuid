module Data.UUID.Next ( nextUUID, seriesOfUUID ) where

import           Control.Category ((>>>))
import           Data.Maybe (fromMaybe)
import qualified Crypto.Hash.MD5 as MD5
import qualified Data.ByteString.Lazy as LB
import qualified Data.UUID as U

nextUUID :: U.UUID -> U.UUID
nextUUID = U.toByteString >>> LB.toStrict >>> MD5.hash >>> LB.fromStrict >>> U.fromByteString
           >>> fromMaybe (error "Data.UUID.Next: logic error: MD5 hash should be 16 bytes long so U.fromByteString should succeed")

seriesOfUUID :: U.UUID -> [U.UUID]
seriesOfUUID = iterate nextUUID

