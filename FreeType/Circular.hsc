{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Circular
  ( module FreeType.Circular.Internal
  ) where

import          FreeType.Circular.Internal
import          FreeType.Core.Types ()
import          FreeType.Lens

import          Foreign.Storable
import          Prelude (($), (<$>), (<*>))
import          Lens.Micro

#include "ft2build.h"
#include FT_FREETYPE_H

instance Storable FT_FaceRec where
  sizeOf _    = #size      struct FT_FaceRec_
  alignment _ = #alignment struct FT_FaceRec_

  peek ptr =
    FT_FaceRec
      <$> #{peek struct FT_FaceRec_, num_faces          } ptr
      <*> #{peek struct FT_FaceRec_, face_index         } ptr
      <*> #{peek struct FT_FaceRec_, face_flags         } ptr
      <*> #{peek struct FT_FaceRec_, style_flags        } ptr
      <*> #{peek struct FT_FaceRec_, num_glyphs         } ptr
      <*> #{peek struct FT_FaceRec_, family_name        } ptr
      <*> #{peek struct FT_FaceRec_, style_name         } ptr
      <*> #{peek struct FT_FaceRec_, num_fixed_sizes    } ptr
      <*> #{peek struct FT_FaceRec_, available_sizes    } ptr
      <*> #{peek struct FT_FaceRec_, num_charmaps       } ptr
      <*> #{peek struct FT_FaceRec_, charmaps           } ptr
      <*> #{peek struct FT_FaceRec_, generic            } ptr
      <*> #{peek struct FT_FaceRec_, bbox               } ptr
      <*> #{peek struct FT_FaceRec_, units_per_EM       } ptr
      <*> #{peek struct FT_FaceRec_, ascender           } ptr
      <*> #{peek struct FT_FaceRec_, descender          } ptr
      <*> #{peek struct FT_FaceRec_, height             } ptr
      <*> #{peek struct FT_FaceRec_, max_advance_width  } ptr
      <*> #{peek struct FT_FaceRec_, max_advance_height } ptr
      <*> #{peek struct FT_FaceRec_, underline_position } ptr
      <*> #{peek struct FT_FaceRec_, underline_thickness} ptr
      <*> #{peek struct FT_FaceRec_, glyph              } ptr
      <*> #{peek struct FT_FaceRec_, size               } ptr
      <*> #{peek struct FT_FaceRec_, charmap            } ptr
      <*> #{peek struct FT_FaceRec_, driver             } ptr
      <*> #{peek struct FT_FaceRec_, memory             } ptr
      <*> #{peek struct FT_FaceRec_, stream             } ptr
      <*> #{peek struct FT_FaceRec_, sizes_list         } ptr
      <*> #{peek struct FT_FaceRec_, autohint           } ptr
      <*> #{peek struct FT_FaceRec_, extensions         } ptr
      <*> #{peek struct FT_FaceRec_, internal           } ptr

  poke ptr val = do
    #{poke struct FT_FaceRec_, num_faces          } ptr $ val^.num_faces
    #{poke struct FT_FaceRec_, face_index         } ptr $ val^.face_index
    #{poke struct FT_FaceRec_, face_flags         } ptr $ val^.face_flags
    #{poke struct FT_FaceRec_, style_flags        } ptr $ val^.style_flags
    #{poke struct FT_FaceRec_, num_glyphs         } ptr $ val^.num_glyphs
    #{poke struct FT_FaceRec_, family_name        } ptr $ val^.family_name
    #{poke struct FT_FaceRec_, style_name         } ptr $ val^.style_name
    #{poke struct FT_FaceRec_, num_fixed_sizes    } ptr $ val^.num_fixed_sizes
    #{poke struct FT_FaceRec_, available_sizes    } ptr $ val^.available_sizes
    #{poke struct FT_FaceRec_, num_charmaps       } ptr $ val^.num_charmaps
    #{poke struct FT_FaceRec_, charmaps           } ptr $ val^.charmaps
    #{poke struct FT_FaceRec_, generic            } ptr $ val^.generic
    #{poke struct FT_FaceRec_, bbox               } ptr $ val^.bbox
    #{poke struct FT_FaceRec_, units_per_EM       } ptr $ val^.units_per_EM
    #{poke struct FT_FaceRec_, ascender           } ptr $ val^.ascender
    #{poke struct FT_FaceRec_, descender          } ptr $ val^.descender
    #{poke struct FT_FaceRec_, height             } ptr $ val^.height
    #{poke struct FT_FaceRec_, max_advance_width  } ptr $ val^.max_advance_width
    #{poke struct FT_FaceRec_, max_advance_height } ptr $ val^.max_advance_height
    #{poke struct FT_FaceRec_, underline_position } ptr $ val^.underline_position
    #{poke struct FT_FaceRec_, underline_thickness} ptr $ val^.underline_thickness
    #{poke struct FT_FaceRec_, glyph              } ptr $ val^.glyph
    #{poke struct FT_FaceRec_, size               } ptr $ val^.size
    #{poke struct FT_FaceRec_, charmap            } ptr $ val^.charmap
    #{poke struct FT_FaceRec_, driver             } ptr $ val^.driver
    #{poke struct FT_FaceRec_, memory             } ptr $ val^.memory
    #{poke struct FT_FaceRec_, stream             } ptr $ val^.stream
    #{poke struct FT_FaceRec_, sizes_list         } ptr $ val^.sizes_list
    #{poke struct FT_FaceRec_, autohint           } ptr $ val^.autohint
    #{poke struct FT_FaceRec_, extensions         } ptr $ val^.extensions
    #{poke struct FT_FaceRec_, internal           } ptr $ val^.internal



instance Storable FT_Bitmap_Size where
  sizeOf _    = #size      struct FT_Bitmap_Size_
  alignment _ = #alignment struct FT_Bitmap_Size_

  peek ptr =
    FT_Bitmap_Size
      <$> #{peek struct FT_Bitmap_Size_, height} ptr
      <*> #{peek struct FT_Bitmap_Size_, width } ptr
      <*> #{peek struct FT_Bitmap_Size_, size  } ptr
      <*> #{peek struct FT_Bitmap_Size_, x_ppem} ptr
      <*> #{peek struct FT_Bitmap_Size_, y_ppem} ptr

  poke ptr val = do
    #{poke struct FT_Bitmap_Size_, height} ptr $ val^.height
    #{poke struct FT_Bitmap_Size_, width } ptr $ val^.width
    #{poke struct FT_Bitmap_Size_, size  } ptr $ val^.size
    #{poke struct FT_Bitmap_Size_, x_ppem} ptr $ val^.x_ppem
    #{poke struct FT_Bitmap_Size_, y_ppem} ptr $ val^.y_ppem



instance Storable FT_CharMapRec where
  sizeOf _    = #size      struct FT_CharMapRec_
  alignment _ = #alignment struct FT_CharMapRec_

  peek ptr =
    FT_CharMapRec
      <$> #{peek struct FT_CharMapRec_, face       } ptr
      <*> #{peek struct FT_CharMapRec_, encoding   } ptr
      <*> #{peek struct FT_CharMapRec_, platform_id} ptr
      <*> #{peek struct FT_CharMapRec_, encoding_id} ptr

  poke ptr val = do
    #{poke struct FT_CharMapRec_, face       } ptr $ val^.face
    #{poke struct FT_CharMapRec_, encoding   } ptr $ val^.encoding
    #{poke struct FT_CharMapRec_, platform_id} ptr $ val^.platform_id
    #{poke struct FT_CharMapRec_, encoding_id} ptr $ val^.encoding_id



instance Storable FT_GlyphSlotRec where
  sizeOf _    = #size      struct FT_GlyphSlotRec_
  alignment _ = #alignment struct FT_GlyphSlotRec_

  peek ptr =
    FT_GlyphSlotRec
      <$> #{peek struct FT_GlyphSlotRec_, library          } ptr
      <*> #{peek struct FT_GlyphSlotRec_, face             } ptr
      <*> #{peek struct FT_GlyphSlotRec_, next             } ptr
      <*> #{peek struct FT_GlyphSlotRec_, glyph_index      } ptr
      <*> #{peek struct FT_GlyphSlotRec_, generic          } ptr
      <*> #{peek struct FT_GlyphSlotRec_, metrics          } ptr
      <*> #{peek struct FT_GlyphSlotRec_, linearHoriAdvance} ptr
      <*> #{peek struct FT_GlyphSlotRec_, linearVertAdvance} ptr
      <*> #{peek struct FT_GlyphSlotRec_, advance          } ptr
      <*> #{peek struct FT_GlyphSlotRec_, format           } ptr
      <*> #{peek struct FT_GlyphSlotRec_, bitmap           } ptr
      <*> #{peek struct FT_GlyphSlotRec_, bitmap_left      } ptr
      <*> #{peek struct FT_GlyphSlotRec_, bitmap_top       } ptr
      <*> #{peek struct FT_GlyphSlotRec_, outline          } ptr
      <*> #{peek struct FT_GlyphSlotRec_, num_subglyphs    } ptr
      <*> #{peek struct FT_GlyphSlotRec_, subglyphs        } ptr
      <*> #{peek struct FT_GlyphSlotRec_, control_data     } ptr
      <*> #{peek struct FT_GlyphSlotRec_, control_len      } ptr
      <*> #{peek struct FT_GlyphSlotRec_, lsb_delta        } ptr
      <*> #{peek struct FT_GlyphSlotRec_, rsb_delta        } ptr
      <*> #{peek struct FT_GlyphSlotRec_, other            } ptr
      <*> #{peek struct FT_GlyphSlotRec_, internal         } ptr

  poke ptr val = do
    #{poke struct FT_GlyphSlotRec_, library          } ptr $ val^.library
    #{poke struct FT_GlyphSlotRec_, face             } ptr $ val^.face
    #{poke struct FT_GlyphSlotRec_, next             } ptr $ val^.next
    #{poke struct FT_GlyphSlotRec_, glyph_index      } ptr $ val^.glyph_index
    #{poke struct FT_GlyphSlotRec_, generic          } ptr $ val^.generic
    #{poke struct FT_GlyphSlotRec_, metrics          } ptr $ val^.metrics
    #{poke struct FT_GlyphSlotRec_, linearHoriAdvance} ptr $ val^.linearHoriAdvance
    #{poke struct FT_GlyphSlotRec_, linearVertAdvance} ptr $ val^.linearVertAdvance
    #{poke struct FT_GlyphSlotRec_, advance          } ptr $ val^.advance
    #{poke struct FT_GlyphSlotRec_, format           } ptr $ val^.format
    #{poke struct FT_GlyphSlotRec_, bitmap           } ptr $ val^.bitmap
    #{poke struct FT_GlyphSlotRec_, bitmap_left      } ptr $ val^.bitmap_left
    #{poke struct FT_GlyphSlotRec_, bitmap_top       } ptr $ val^.bitmap_top
    #{poke struct FT_GlyphSlotRec_, outline          } ptr $ val^.outline
    #{poke struct FT_GlyphSlotRec_, num_subglyphs    } ptr $ val^.num_subglyphs
    #{poke struct FT_GlyphSlotRec_, subglyphs        } ptr $ val^.subglyphs
    #{poke struct FT_GlyphSlotRec_, control_data     } ptr $ val^.control_data
    #{poke struct FT_GlyphSlotRec_, control_len      } ptr $ val^.control_len
    #{poke struct FT_GlyphSlotRec_, lsb_delta        } ptr $ val^.lsb_delta
    #{poke struct FT_GlyphSlotRec_, rsb_delta        } ptr $ val^.rsb_delta
    #{poke struct FT_GlyphSlotRec_, other            } ptr $ val^.other
    #{poke struct FT_GlyphSlotRec_, internal         } ptr $ val^.internal



instance Storable FT_SizeRec where
  sizeOf _    = #size      struct FT_SizeRec_
  alignment _ = #alignment struct FT_SizeRec_

  peek ptr =
    FT_SizeRec
      <$> #{peek struct FT_SizeRec_, face    } ptr
      <*> #{peek struct FT_SizeRec_, generic } ptr
      <*> #{peek struct FT_SizeRec_, metrics } ptr
      <*> #{peek struct FT_SizeRec_, internal} ptr

  poke ptr val = do
    #{poke struct FT_SizeRec_, face    } ptr $ val^.face
    #{poke struct FT_SizeRec_, generic } ptr $ val^.generic
    #{poke struct FT_SizeRec_, metrics } ptr $ val^.metrics
    #{poke struct FT_SizeRec_, internal} ptr $ val^.internal



instance Storable FT_Glyph_Metrics where
  sizeOf _    = #size      struct FT_Glyph_Metrics_
  alignment _ = #alignment struct FT_Glyph_Metrics_

  peek ptr =
    FT_Glyph_Metrics
      <$> #{peek struct FT_Glyph_Metrics_, width       } ptr
      <*> #{peek struct FT_Glyph_Metrics_, height      } ptr
      <*> #{peek struct FT_Glyph_Metrics_, horiBearingX} ptr
      <*> #{peek struct FT_Glyph_Metrics_, horiBearingY} ptr
      <*> #{peek struct FT_Glyph_Metrics_, horiAdvance } ptr
      <*> #{peek struct FT_Glyph_Metrics_, vertBearingX} ptr
      <*> #{peek struct FT_Glyph_Metrics_, vertBearingY} ptr
      <*> #{peek struct FT_Glyph_Metrics_, vertAdvance } ptr

  poke ptr val = do
    #{poke struct FT_Glyph_Metrics_, width       } ptr $ val^.width
    #{poke struct FT_Glyph_Metrics_, height      } ptr $ val^.height
    #{poke struct FT_Glyph_Metrics_, horiBearingX} ptr $ val^.horiBearingX
    #{poke struct FT_Glyph_Metrics_, horiBearingY} ptr $ val^.horiBearingY
    #{poke struct FT_Glyph_Metrics_, horiAdvance } ptr $ val^.horiAdvance
    #{poke struct FT_Glyph_Metrics_, vertBearingX} ptr $ val^.vertBearingX
    #{poke struct FT_Glyph_Metrics_, vertBearingY} ptr $ val^.vertBearingY
    #{poke struct FT_Glyph_Metrics_, vertAdvance } ptr $ val^.vertAdvance



instance Storable FT_Size_Metrics where
  sizeOf _    = #size      struct FT_Size_Metrics_
  alignment _ = #alignment struct FT_Size_Metrics_

  peek ptr =
    FT_Size_Metrics
      <$> #{peek struct FT_Size_Metrics_, x_ppem     } ptr
      <*> #{peek struct FT_Size_Metrics_, y_ppem     } ptr
      <*> #{peek struct FT_Size_Metrics_, x_scale    } ptr
      <*> #{peek struct FT_Size_Metrics_, y_scale    } ptr
      <*> #{peek struct FT_Size_Metrics_, ascender   } ptr
      <*> #{peek struct FT_Size_Metrics_, descender  } ptr
      <*> #{peek struct FT_Size_Metrics_, height     } ptr
      <*> #{peek struct FT_Size_Metrics_, max_advance} ptr

  poke ptr val = do
    #{poke struct FT_Size_Metrics_, x_ppem     } ptr $ val^.x_ppem
    #{poke struct FT_Size_Metrics_, y_ppem     } ptr $ val^.y_ppem
    #{poke struct FT_Size_Metrics_, x_scale    } ptr $ val^.x_scale
    #{poke struct FT_Size_Metrics_, y_scale    } ptr $ val^.y_scale
    #{poke struct FT_Size_Metrics_, ascender   } ptr $ val^.ascender
    #{poke struct FT_Size_Metrics_, descender  } ptr $ val^.descender
    #{poke struct FT_Size_Metrics_, height     } ptr $ val^.height
    #{poke struct FT_Size_Metrics_, max_advance} ptr $ val^.max_advance



instance Storable FT_MemoryRec where
  sizeOf _    = #size      struct FT_MemoryRec_
  alignment _ = #alignment struct FT_MemoryRec_

  peek ptr =
    FT_MemoryRec
      <$> #{peek struct FT_MemoryRec_, user   } ptr
      <*> #{peek struct FT_MemoryRec_, alloc  } ptr
      <*> #{peek struct FT_MemoryRec_, free   } ptr
      <*> #{peek struct FT_MemoryRec_, realloc} ptr

  poke ptr val = do
    #{poke struct FT_MemoryRec_, user   } ptr $ val^.user
    #{poke struct FT_MemoryRec_, alloc  } ptr $ val^.alloc
    #{poke struct FT_MemoryRec_, free   } ptr $ val^.free
    #{poke struct FT_MemoryRec_, realloc} ptr $ val^.realloc



instance Storable FT_StreamRec where
  sizeOf _    = #size struct FT_StreamRec_
  alignment _ = #alignment struct FT_StreamRec_

  peek ptr =
    FT_StreamRec
      <$> #{peek struct FT_StreamRec_, base      } ptr
      <*> #{peek struct FT_StreamRec_, size      } ptr
      <*> #{peek struct FT_StreamRec_, pos       } ptr
      <*> #{peek struct FT_StreamRec_, descriptor} ptr
      <*> #{peek struct FT_StreamRec_, pathname  } ptr
      <*> #{peek struct FT_StreamRec_, read      } ptr
      <*> #{peek struct FT_StreamRec_, close     } ptr
      <*> #{peek struct FT_StreamRec_, memory    } ptr
      <*> #{peek struct FT_StreamRec_, cursor    } ptr
      <*> #{peek struct FT_StreamRec_, limit     } ptr

  poke ptr val = do
    #{poke struct FT_StreamRec_, base      } ptr $ val^.base
    #{poke struct FT_StreamRec_, size      } ptr $ val^.size
    #{poke struct FT_StreamRec_, pos       } ptr $ val^.pos
    #{poke struct FT_StreamRec_, descriptor} ptr $ val^.descriptor
    #{poke struct FT_StreamRec_, pathname  } ptr $ val^.pathname
    #{poke struct FT_StreamRec_, read      } ptr $ val^.read
    #{poke struct FT_StreamRec_, close     } ptr $ val^.close
    #{poke struct FT_StreamRec_, memory    } ptr $ val^.memory
    #{poke struct FT_StreamRec_, cursor    } ptr $ val^.cursor
    #{poke struct FT_StreamRec_, limit     } ptr $ val^.limit



instance Storable FT_StreamDesc where
  sizeOf _    = #size      union FT_StreamDesc_
  alignment _ = #alignment union FT_StreamDesc_

  peek ptr =
    FT_StreamDesc
      <$> #{peek union FT_StreamDesc_, value  } ptr
      <*> #{peek union FT_StreamDesc_, pointer} ptr

  poke ptr val = do
    #{poke union FT_StreamDesc_, value  } ptr $ sdValue   val
    #{poke union FT_StreamDesc_, pointer} ptr $ sdPointer val



instance Storable FT_Outline where
  sizeOf _    = #size      struct FT_Outline_
  alignment _ = #alignment struct FT_Outline_

  peek ptr =
    FT_Outline
      <$> #{peek struct FT_Outline_, n_contours} ptr
      <*> #{peek struct FT_Outline_, n_points  } ptr
      <*> #{peek struct FT_Outline_, points    } ptr
      <*> #{peek struct FT_Outline_, tags      } ptr
      <*> #{peek struct FT_Outline_, contours  } ptr
      <*> #{peek struct FT_Outline_, flags     } ptr

  poke ptr val = do
    #{poke struct FT_Outline_, n_contours} ptr $ val^.n_contours
    #{poke struct FT_Outline_, n_points  } ptr $ val^.n_points
    #{poke struct FT_Outline_, points    } ptr $ val^.points
    #{poke struct FT_Outline_, tags      } ptr $ val^.tags
    #{poke struct FT_Outline_, contours  } ptr $ val^.contours
    #{poke struct FT_Outline_, flags     } ptr $ val^.flags



instance Storable FT_ListRec where
  sizeOf _    = #size      struct FT_ListRec_
  alignment _ = #alignment struct FT_ListRec_

  peek ptr =
    FT_ListRec
      <$> #{peek struct FT_ListRec_, head} ptr
      <*> #{peek struct FT_ListRec_, tail} ptr

  poke ptr val = do
    #{poke struct FT_ListRec_, head} ptr $ val^.head
    #{poke struct FT_ListRec_, tail} ptr $ val^.tail



instance Storable FT_ListNodeRec where
  sizeOf _    = #size      struct FT_ListNodeRec_
  alignment _ = #alignment struct FT_ListNodeRec_

  peek ptr =
    FT_ListNodeRec
      <$> #{peek struct FT_ListNodeRec_, prev} ptr
      <*> #{peek struct FT_ListNodeRec_, next} ptr
      <*> #{peek struct FT_ListNodeRec_, data} ptr

  poke ptr val = do
    #{poke struct FT_ListNodeRec_, prev} ptr $ val^.prev
    #{poke struct FT_ListNodeRec_, next} ptr $ val^.next
    #{poke struct FT_ListNodeRec_, data} ptr $ val^.data_
