#ifndef TYPES_H
#define TYPES_H

typedef struct {
    char    *name;
    char    *value;
} Field;


typedef struct {
    char    *name;
    char    *key;
    Field   *fields;
} Entry;


#endif /* end of include guard: TYPES_H */
