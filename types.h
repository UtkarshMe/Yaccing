#ifndef TYPES_H
#define TYPES_H

#define MAX_SIZE 100

typedef struct _Field Field;
struct _Field{
    char        name[MAX_SIZE];
    char        value[MAX_SIZE];
    Field       *next;
};


struct _Field_list{
    Field       *top;
    Field       *last;
};
typedef struct _Field_list Field_list;


struct _Entry{
    char        *name;
    char        *key;
    int         size;
    Field       fields[10];
};
typedef struct _Entry Entry;

#endif /* end of include guard: TYPES_H */
