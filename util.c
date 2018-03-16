#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "types.h"

void entry_show(Entry entry)
{
    printf("\n");
    printf("Type\t: %s\n", entry.name);
    printf("Key\t: %s\n", entry.key);
    printf("Fields\t: \n");
    for (int i = 0; i < entry.size; ++i) {
        printf("\t%s\t: %s\n", entry.fields[i].name, entry.fields[i].value);
    }
    printf("\n");
}
