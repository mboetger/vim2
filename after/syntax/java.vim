syn keyword myFavoriteJavaKeyword  MyFavoriteKeyword
syn match myFavoriteJavaRegex "MyFavorite[a-zA-z]*Regex"

if version >= 508
  hi def link myFavoriteJavaKeyword Function
  hi def link myFavoriteJavaRegex   Comment
endif 
