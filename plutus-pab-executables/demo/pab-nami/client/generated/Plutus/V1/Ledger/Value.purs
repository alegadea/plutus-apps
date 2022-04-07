-- File auto generated by purescript-bridge! --
module Plutus.V1.Ledger.Value where

import Prelude

import Control.Lazy (defer)
import Data.Argonaut (encodeJson, jsonNull)
import Data.Argonaut.Decode (class DecodeJson)
import Data.Argonaut.Decode.Aeson ((</$\>), (</*\>), (</\>))
import Data.Argonaut.Encode (class EncodeJson)
import Data.Argonaut.Encode.Aeson ((>$<), (>/\<))
import Data.BigInt.Argonaut (BigInt)
import Data.Generic.Rep (class Generic)
import Data.Lens (Iso', Lens', Prism', iso, prism')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, unwrap)
import Data.Show.Generic (genericShow)
import Data.Tuple (Tuple)
import Data.Tuple.Nested ((/\))
import PlutusTx.AssocMap (Map)
import Type.Proxy (Proxy(Proxy))
import Data.Argonaut.Decode.Aeson as D
import Data.Argonaut.Encode.Aeson as E
import Data.Map as Map

newtype AssetClass = AssetClass { unAssetClass :: Tuple CurrencySymbol TokenName }

instance Show AssetClass where
  show a = genericShow a

derive instance Eq AssetClass

derive instance Ord AssetClass

instance EncodeJson AssetClass where
  encodeJson = defer \_ -> E.encode $ unwrap >$<
    ( E.record
        { unAssetClass: (E.tuple (E.value >/\< E.value)) :: _ (Tuple CurrencySymbol TokenName) }
    )

instance DecodeJson AssetClass where
  decodeJson = defer \_ -> D.decode $ (AssetClass <$> D.record "AssetClass" { unAssetClass: (D.tuple (D.value </\> D.value)) :: _ (Tuple CurrencySymbol TokenName) })

derive instance Generic AssetClass _

derive instance Newtype AssetClass _

--------------------------------------------------------------------------------

_AssetClass :: Iso' AssetClass { unAssetClass :: Tuple CurrencySymbol TokenName }
_AssetClass = _Newtype

--------------------------------------------------------------------------------

newtype CurrencySymbol = CurrencySymbol { unCurrencySymbol :: String }

instance Show CurrencySymbol where
  show a = genericShow a

derive instance Eq CurrencySymbol

derive instance Ord CurrencySymbol

instance EncodeJson CurrencySymbol where
  encodeJson = defer \_ -> E.encode $ unwrap >$<
    ( E.record
        { unCurrencySymbol: E.value :: _ String }
    )

instance DecodeJson CurrencySymbol where
  decodeJson = defer \_ -> D.decode $ (CurrencySymbol <$> D.record "CurrencySymbol" { unCurrencySymbol: D.value :: _ String })

derive instance Generic CurrencySymbol _

derive instance Newtype CurrencySymbol _

--------------------------------------------------------------------------------

_CurrencySymbol :: Iso' CurrencySymbol { unCurrencySymbol :: String }
_CurrencySymbol = _Newtype

--------------------------------------------------------------------------------

newtype TokenName = TokenName { unTokenName :: String }

instance Show TokenName where
  show a = genericShow a

derive instance Eq TokenName

derive instance Ord TokenName

instance EncodeJson TokenName where
  encodeJson = defer \_ -> E.encode $ unwrap >$<
    ( E.record
        { unTokenName: E.value :: _ String }
    )

instance DecodeJson TokenName where
  decodeJson = defer \_ -> D.decode $ (TokenName <$> D.record "TokenName" { unTokenName: D.value :: _ String })

derive instance Generic TokenName _

derive instance Newtype TokenName _

--------------------------------------------------------------------------------

_TokenName :: Iso' TokenName { unTokenName :: String }
_TokenName = _Newtype

--------------------------------------------------------------------------------

newtype Value = Value { getValue :: Map CurrencySymbol (Map TokenName BigInt) }

derive instance Eq Value

instance Show Value where
  show a = genericShow a

instance EncodeJson Value where
  encodeJson = defer \_ -> E.encode $ unwrap >$<
    ( E.record
        { getValue: E.value :: _ (Map CurrencySymbol (Map TokenName BigInt)) }
    )

instance DecodeJson Value where
  decodeJson = defer \_ -> D.decode $ (Value <$> D.record "Value" { getValue: D.value :: _ (Map CurrencySymbol (Map TokenName BigInt)) })

derive instance Generic Value _

derive instance Newtype Value _

--------------------------------------------------------------------------------

_Value :: Iso' Value { getValue :: Map CurrencySymbol (Map TokenName BigInt) }
_Value = _Newtype
