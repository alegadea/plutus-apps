-- File auto generated by purescript-bridge! --
module Wallet.Emulator.NodeClient where

import Prelude

import Control.Lazy (defer)
import Data.Argonaut (encodeJson, jsonNull)
import Data.Argonaut.Decode (class DecodeJson)
import Data.Argonaut.Decode.Aeson ((</$\>), (</*\>), (</\>))
import Data.Argonaut.Encode (class EncodeJson)
import Data.Argonaut.Encode.Aeson ((>$<), (>/\<))
import Data.Generic.Rep (class Generic)
import Data.Lens (Iso', Lens', Prism', iso, prism')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..))
import Data.Newtype (unwrap)
import Data.Show.Generic (genericShow)
import Data.Tuple.Nested ((/\))
import Plutus.V1.Ledger.TxId (TxId)
import Plutus.V1.Ledger.Value (Value)
import Type.Proxy (Proxy(Proxy))
import Data.Argonaut.Decode.Aeson as D
import Data.Argonaut.Encode.Aeson as E
import Data.Map as Map

data NodeClientEvent = TxSubmit TxId Value

instance Show NodeClientEvent where
  show a = genericShow a

instance EncodeJson NodeClientEvent where
  encodeJson = defer \_ -> E.encode $ (case _ of TxSubmit a b -> (a /\ b)) >$< (E.tuple (E.value >/\< E.value))

instance DecodeJson NodeClientEvent where
  decodeJson = defer \_ -> D.decode $ (D.tuple $ TxSubmit </$\> D.value </*\> D.value)

derive instance Generic NodeClientEvent _

--------------------------------------------------------------------------------

_TxSubmit :: Iso' NodeClientEvent { a :: TxId, b :: Value }
_TxSubmit = iso (\(TxSubmit a b) -> { a, b }) (\{ a, b } -> (TxSubmit a b))
