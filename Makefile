PROGRAM 		= bibtex_parser

CC 				= gcc
CC_FLAGS 		= -Wall -Wno-unused-function
CC_LFLAGS		= -lfl
CC_LEX			= lex
CC_YACC 		= yacc
YFLAGS 			= -d

SRCS 			= y.tab.c lex.yy.c
OBJS 			= y.tab.o lex.yy.o
INCLUDE_DIR		= .

all: 			${PROGRAM}

.c.o: 			${SRCS}
				${CC} ${CC_FLAGS} -c $*.c -o $@ -O ${CC_LFLAGS}

y.tab.c: 		parse.y
				${CC_YACC} ${YFLAGS} parse.y

lex.yy.c: 		lex.l
				${CC_LEX} lex.l

${PROGRAM}:		${OBJS}
				${CC} ${C_FLAGS} -I${INCLUDE_DIR} -o $@ ${OBJS}


.PHONY: 		clean

clean:
				rm -f ${OBJS} *.o ${PROGRAM} y.* lex.yy.*
