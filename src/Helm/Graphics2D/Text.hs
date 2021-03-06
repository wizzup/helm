-- | Contains all the data structures and functions for composing
-- pieces of graphical text.
module Helm.Graphics2D.Text
  (
    -- * Types
    Text(..)
  , FontWeight(..)
  , FontStyle(..)
    -- * Composing
  , defaultText
  , toText
  , showText
    -- * Formatting
  , light
  , bold
  , italic
  , oblique
  , color
  , typeface
  , height
  ) where

import Helm.Color (Color(..), rgb)

-- | Represents the weight for a text's font.
data FontWeight
  = LightWeight
  | NormalWeight
  | BoldWeight
    deriving (Show, Eq, Ord, Enum, Read)

-- | Represents the style for a text's font.
data FontStyle
  = NormalStyle
  | ObliqueStyle
  | ItalicStyle
    deriving (Show, Eq, Ord, Enum, Read)

-- | Represents a graphical piece of text,
-- containing a UTF-8 string and any relevant style fields.
data Text = Text
  { textString :: String
  , textColor :: Color
  , textTypeface :: String
  , textHeight :: Double
  , textWeight :: FontWeight
  , textStyle :: FontStyle
  } deriving (Show, Eq)

-- | Create the default text. By default it is is black sans-serif
-- with a height of 14pt.
defaultText :: Text
defaultText = Text {
  textString = "",
  textColor = rgb 0 0 0,
  textTypeface = "sans-serif",
  textHeight = 14,
  textWeight = NormalWeight,
  textStyle = NormalStyle
}

-- | Create a text from a string. By default, this text will be 14pt,
-- black and unstyled.
toText :: String -> Text
toText str = defaultText { textString = str }

-- | Create a text from a type instancing 'Show'.
showText :: Show a => a -> Text
showText a = toText $ show a

-- | Set the weight of a text to bold.
bold :: Text -> Text
bold txt = txt { textWeight = BoldWeight }

-- | Set the weight of a piece of text to light.
light :: Text -> Text
light txt = txt { textWeight = LightWeight }

-- | Set the slant of a piece of text to italic.
italic :: Text -> Text
italic txt = txt { textStyle = ItalicStyle }

-- | Set the slant of a piece of text to oblique.
oblique :: Text -> Text
oblique txt = txt { textStyle = ObliqueStyle }

-- | Set the color of a piece of text.
color :: Color -> Text -> Text
color col txt = txt { textColor = col }

-- | Set the typeface of the text.
typeface :: String -> Text -> Text
typeface face txt = txt { textTypeface = face }

-- | Set the size of a piece of text.
height :: Double -> Text -> Text
height size txt = txt { textHeight = size }
