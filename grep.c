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

void output(int argc, char **argv, options arg, char *grep_ptrn,
            regex_t *regex) {
  char *word = NULL;

  if (arg.pattern) {
    word = arg.pattern;
  } else {
    word = argv[optind];
  }

  if (!word) {
    fprintf(stderr, "There is no words to search\n");
    return;
  }

  if (!argv[optind + (arg.pattern ? 0 : 1)]) {
    fprintf(stderr, "There is no file to search into\n");
    return;
  }

  if (arg.pattern) {
    regcomp(regex, grep_ptrn, REG_ICASE | REG_EXTENDED);
  } else {
    regcomp(regex, word, arg.i);
  }

  if (arg.pattern) {
    for (int i = optind; i < argc; i++) {
      open_file(argv[i], regex, arg, optind + 1 < argc, i, argv);
    }
  } else {
    for (int i = optind + 1; i < argc; i++) {
      open_file(argv[i], regex, arg, optind + 2 < argc, i, argv);
    }
  }
}

void output_str(char *str, int n) {
  for (int i = 0; i < n; i++) {
    putchar(str[i]);
  }
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