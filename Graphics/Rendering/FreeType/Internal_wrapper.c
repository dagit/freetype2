#include "Internal_wrapper.h"
FT_Error w_FT_New_Face(FT_Library *library,
                             const char *filepathname,
                             FT_Long     face_index,
                             FT_Face    *aface)
{
  return FT_New_Face(*library, filepathname, face_index, aface);
}

FT_Error w_FT_Set_Char_Size(FT_Face *face,
                                  FT_F26Dot6 char_width,
                                  FT_F26Dot6 char_height,
                                  FT_UInt horz_resolution,
                                  FT_UInt vert_resolution)
{
  return FT_Set_Char_Size(*face,
                          char_width,
                          char_height,
                          horz_resolution,
                          vert_resolution);
}

FT_Error w_FT_Set_Pixel_Sizes(FT_Face *face,
                                    FT_UInt  pixel_width,
                                    FT_UInt  pixel_height)
{
  return FT_Set_Pixel_Sizes(*face, pixel_width, pixel_height);
}

FT_UInt w_FT_Get_Char_Index(FT_Face  *face,
                                  FT_ULong  charcode)
{
  return FT_Get_Char_Index(*face, charcode);
}

void w_FT_Set_Transform (FT_Face   *face,
                               FT_Matrix *matrix,
                               FT_Vector *delta)
{
  return FT_Set_Transform(*face, matrix, delta);
}

FT_Error w_FT_Load_Char(FT_Face  *face,
                              FT_ULong char_code,
                              FT_Int32 load_flags)
{
  return FT_Load_Char(*face, char_code, load_flags);
}

FT_Error w_FT_Done_Face(FT_Face *face)
{
  return FT_Done_Face(*face);
}

FT_Error w_FT_Done_FreeType(FT_Library *library)
{
  return FT_Done_FreeType(*library);
}
