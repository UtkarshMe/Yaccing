#ifndef TOKENS_H
#define TOKENS_H

/*! \enum Tokens
 *
 *  Enumeration of all the tokens necessary for the task
 *  Size of the Enum = ENUM_TOKENS_SIZE
 */
enum Tokens { 
    NONE,
    AMPERSAND,
    BRACE_OPEN,
    BRACE_CLOSE,
    SYM_EQUAL,
    SYM_COMMA,
    IDENTIFIER,
    STRING,
    NUMBER,
    ENUM_TOKENS_SIZE
};

#endif /* end of include guard: TOKENS_H */
