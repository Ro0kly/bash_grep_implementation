#include <getopt.h>
#include <regex.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct options {
  int e, i, v, c, l, n, h, s, f, o;
  char *pattern;
} options;

options parser(int argc, char **argv, char *grep_ptrn) {
  options arg = {0};
  int opt = 0;
  while ((opt = getopt_long(argc, argv, "e:ivclnhsf:o", NULL, 0)) != -1) {
    switch (opt) {
      case 'e':
        arg.e = 1;
        break;
      case 'i':
        arg.i = REG_ICASE;
        break;
      case 'v':
        arg.v = 1;
        break;
      case 'c':
        arg.c = 1;
        break;
      case 'l':
        arg.l = 1;
        break;
      case 'n':
        arg.n = 1;
        break;
      case 'h':
        arg.h = 1;
        break;
      case 's':
        arg.s = 1;
        break;
      case 'f':
        arg.f = 1;
        break;
      case 'o':
        arg.o = 1;
        break;
      default:
        break;
    }
  }
  if (arg.f) {
    arg.pattern = grep_ptrn;
  }
  return arg;
}

int main(int argc, char **argv) {
  if (argc > 2) {
    char grep_ptrn[10000] = "\0";
    regex_t regex;
    options arg = parser(argc, argv, grep_ptrn);
    output(argc, argv, arg, grep_ptrn, &regex);
    // free(arg);
    regfree(&regex);
  }
  return 0;
}