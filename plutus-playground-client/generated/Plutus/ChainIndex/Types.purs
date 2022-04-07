-- File auto generated by purescript-bridge! --
module Plutus.ChainIndex.Types where

import Prelude

import Control.Lazy (defer)
import Data.Argonaut (encodeJson, jsonNull)
import Data.Argonaut.Decode (class DecodeJson)
import Data.Argonaut.Decode.Aeson ((</$\>), (</*\>), (</\>))
import Data.Argonaut.Encode (class EncodeJson)
import Data.Argonaut.Encode.Aeson ((>$<), (>/\<))
import Data.BigInt.Argonaut (BigInt)
import Data.Bounded.Generic (genericBottom, genericTop)
import Data.Enum (class Enum)
import Data.Enum.Generic (genericPred, genericSucc)
import Data.Generic.Rep (class Generic)
import Data.Lens (Iso', Lens', Prism', iso, prism')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, unwrap)
import Data.Show.Generic (genericShow)
import Data.Tuple.Nested ((/\))
import Ledger.Blockchain (BlockId)
import Plutus.V1.Ledger.Slot (Slot)
import Plutus.V1.Ledger.TxId (TxId)
import Type.Proxy (Proxy(Proxy))
import Data.Argonaut.Decode.Aeson as D
import Data.Argonaut.Encode.Aeson as E
import Data.Map as Map

newtype BlockNumber = BlockNumber { unBlockNumber :: BigInt }

derive instance Eq BlockNumber

instance Show BlockNumber where
  show a = genericShow a

instance EncodeJson BlockNumber where
  encodeJson = defer \_ -> E.encode $ unwrap >$<
    ( E.record
        { unBlockNumber: E.value :: _ BigInt }
    )

instance DecodeJson BlockNumber where
  decodeJson = defer \_ -> D.decode $ (BlockNumber <$> D.record "BlockNumber" { unBlockNumber: D.value :: _ BigInt })

derive instance Generic BlockNumber _

derive instance Newtype BlockNumber _

--------------------------------------------------------------------------------

_BlockNumber :: Iso' BlockNumber { unBlockNumber :: BigInt }
_BlockNumber = _Newtype

--------------------------------------------------------------------------------

newtype Depth = Depth { unDepth :: Int }

derive instance Eq Depth

instance Show Depth where
  show a = genericShow a

instance EncodeJson Depth where
  encodeJson = defer \_ -> E.encode $ unwrap >$<
    ( E.record
        { unDepth: E.value :: _ Int }
    )

instance DecodeJson Depth where
  decodeJson = defer \_ -> D.decode $ (Depth <$> D.record "Depth" { unDepth: D.value :: _ Int })

derive instance Generic Depth _

derive instance Newtype Depth _

--------------------------------------------------------------------------------

_Depth :: Iso' Depth { unDepth :: Int }
_Depth = _Newtype

--------------------------------------------------------------------------------

data Point
  = PointAtGenesis
  | Point
      { pointSlot :: Slot
      , pointBlockId :: BlockId
      }

derive instance Eq Point

instance Show Point where
  show a = genericShow a

instance EncodeJson Point where
  encodeJson = defer \_ -> case _ of
    PointAtGenesis -> encodeJson { tag: "PointAtGenesis", contents: jsonNull }
    Point { pointSlot, pointBlockId } -> encodeJson
      { tag: "Point"
      , pointSlot: flip E.encode pointSlot E.value
      , pointBlockId: flip E.encode pointBlockId E.value
      }

instance DecodeJson Point where
  decodeJson = defer \_ -> D.decode
    $ D.sumType "Point"
    $ Map.fromFoldable
        [ "PointAtGenesis" /\ pure PointAtGenesis
        , "Point" /\
            ( Point <$> D.object "Point"
                { pointSlot: D.value :: _ Slot
                , pointBlockId: D.value :: _ BlockId
                }
            )
        ]

derive instance Generic Point _

--------------------------------------------------------------------------------

_PointAtGenesis :: Prism' Point Unit
_PointAtGenesis = prism' (const PointAtGenesis) case _ of
  PointAtGenesis -> Just unit
  _ -> Nothing

_Point :: Prism' Point { pointSlot :: Slot, pointBlockId :: BlockId }
_Point = prism' Point case _ of
  (Point a) -> Just a
  _ -> Nothing

--------------------------------------------------------------------------------

data RollbackState a
  = Unknown
  | TentativelyConfirmed Depth TxValidity a
  | Committed TxValidity a

derive instance (Eq a) => Eq (RollbackState a)

instance (Show a) => Show (RollbackState a) where
  show a = genericShow a

instance (EncodeJson a) => EncodeJson (RollbackState a) where
  encodeJson = defer \_ -> case _ of
    Unknown -> encodeJson { tag: "Unknown", contents: jsonNull }
    TentativelyConfirmed a b c -> E.encodeTagged "TentativelyConfirmed" (a /\ b /\ c) (E.tuple (E.value >/\< E.value >/\< E.value))
    Committed a b -> E.encodeTagged "Committed" (a /\ b) (E.tuple (E.value >/\< E.value))

instance (DecodeJson a) => DecodeJson (RollbackState a) where
  decodeJson = defer \_ -> D.decode
    $ D.sumType "RollbackState"
    $ Map.fromFoldable
        [ "Unknown" /\ pure Unknown
        , "TentativelyConfirmed" /\ D.content (D.tuple $ TentativelyConfirmed </$\> D.value </*\> D.value </*\> D.value)
        , "Committed" /\ D.content (D.tuple $ Committed </$\> D.value </*\> D.value)
        ]

derive instance Generic (RollbackState a) _

--------------------------------------------------------------------------------

_Unknown :: forall a. Prism' (RollbackState a) Unit
_Unknown = prism' (const Unknown) case _ of
  Unknown -> Just unit
  _ -> Nothing

_TentativelyConfirmed :: forall a. Prism' (RollbackState a) { a :: Depth, b :: TxValidity, c :: a }
_TentativelyConfirmed = prism' (\{ a, b, c } -> (TentativelyConfirmed a b c)) case _ of
  (TentativelyConfirmed a b c) -> Just { a, b, c }
  _ -> Nothing

_Committed :: forall a. Prism' (RollbackState a) { a :: TxValidity, b :: a }
_Committed = prism' (\{ a, b } -> (Committed a b)) case _ of
  (Committed a b) -> Just { a, b }
  _ -> Nothing

--------------------------------------------------------------------------------

data Tip
  = TipAtGenesis
  | Tip
      { tipSlot :: Slot
      , tipBlockId :: BlockId
      , tipBlockNo :: BlockNumber
      }

derive instance Eq Tip

instance Show Tip where
  show a = genericShow a

instance EncodeJson Tip where
  encodeJson = defer \_ -> case _ of
    TipAtGenesis -> encodeJson { tag: "TipAtGenesis", contents: jsonNull }
    Tip { tipSlot, tipBlockId, tipBlockNo } -> encodeJson
      { tag: "Tip"
      , tipSlot: flip E.encode tipSlot E.value
      , tipBlockId: flip E.encode tipBlockId E.value
      , tipBlockNo: flip E.encode tipBlockNo E.value
      }

instance DecodeJson Tip where
  decodeJson = defer \_ -> D.decode
    $ D.sumType "Tip"
    $ Map.fromFoldable
        [ "TipAtGenesis" /\ pure TipAtGenesis
        , "Tip" /\
            ( Tip <$> D.object "Tip"
                { tipSlot: D.value :: _ Slot
                , tipBlockId: D.value :: _ BlockId
                , tipBlockNo: D.value :: _ BlockNumber
                }
            )
        ]

derive instance Generic Tip _

--------------------------------------------------------------------------------

_TipAtGenesis :: Prism' Tip Unit
_TipAtGenesis = prism' (const TipAtGenesis) case _ of
  TipAtGenesis -> Just unit
  _ -> Nothing

_Tip :: Prism' Tip { tipSlot :: Slot, tipBlockId :: BlockId, tipBlockNo :: BlockNumber }
_Tip = prism' Tip case _ of
  (Tip a) -> Just a
  _ -> Nothing

--------------------------------------------------------------------------------

data TxOutState
  = Spent TxId
  | Unspent

derive instance Eq TxOutState

instance Show TxOutState where
  show a = genericShow a

instance EncodeJson TxOutState where
  encodeJson = defer \_ -> case _ of
    Spent a -> E.encodeTagged "Spent" a E.value
    Unspent -> encodeJson { tag: "Unspent", contents: jsonNull }

instance DecodeJson TxOutState where
  decodeJson = defer \_ -> D.decode
    $ D.sumType "TxOutState"
    $ Map.fromFoldable
        [ "Spent" /\ D.content (Spent <$> D.value)
        , "Unspent" /\ pure Unspent
        ]

derive instance Generic TxOutState _

--------------------------------------------------------------------------------

_Spent :: Prism' TxOutState TxId
_Spent = prism' Spent case _ of
  (Spent a) -> Just a
  _ -> Nothing

_Unspent :: Prism' TxOutState Unit
_Unspent = prism' (const Unspent) case _ of
  Unspent -> Just unit
  _ -> Nothing

--------------------------------------------------------------------------------

data TxValidity
  = TxValid
  | TxInvalid
  | UnknownValidity

derive instance Eq TxValidity

derive instance Ord TxValidity

instance Show TxValidity where
  show a = genericShow a

instance EncodeJson TxValidity where
  encodeJson = defer \_ -> E.encode E.enum

instance DecodeJson TxValidity where
  decodeJson = defer \_ -> D.decode D.enum

derive instance Generic TxValidity _

instance Enum TxValidity where
  succ = genericSucc
  pred = genericPred

instance Bounded TxValidity where
  bottom = genericBottom
  top = genericTop

--------------------------------------------------------------------------------

_TxValid :: Prism' TxValidity Unit
_TxValid = prism' (const TxValid) case _ of
  TxValid -> Just unit
  _ -> Nothing

_TxInvalid :: Prism' TxValidity Unit
_TxInvalid = prism' (const TxInvalid) case _ of
  TxInvalid -> Just unit
  _ -> Nothing

_UnknownValidity :: Prism' TxValidity Unit
_UnknownValidity = prism' (const UnknownValidity) case _ of
  UnknownValidity -> Just unit
  _ -> Nothing
