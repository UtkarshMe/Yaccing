PROGRAM 		= bibtex_parser

CC 				= gcc
CC_LEX			= lex
CC_YACC 		= yacc
YFLAGS 			= -d

SRCS 			= parse.tab.c lex.yy.c
OBJS 			= parse.tab.o lex.yy.o
INCLUDE_DIR		= .

all: 			${PROGRAM}

.c.o: 			${SRCS}
				${CC} -c $*.c -o $@ -O

parse.tab.c: 	parse.y
				${CC_YACC} ${Y_FLAGS} parse.y

lex.yy.c: 		lex.l
				${CC_LEX} lex.l

${PROGRAM}:		${OBJS}
				${CC} ${C_FLAGS} -I${INCLUDE_DIR} -o $@


.PHONY: 		clean

clean:
				rm -f ${OBJS} *.o ${PROGRAM} y.* lex.yy.*
