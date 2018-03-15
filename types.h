#ifndef TYPES_H
#define TYPES_H

#ifndef YYSTYPE
union yystype_union {
    double dval;
    int ival;
    char *sval;
};
#define YYSTYPE union yystype_union
#endif /* ifndef YYSTYPE */

#endif /* end of include guard: TYPES_H */
