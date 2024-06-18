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

void print_matched(char *filename, char *str, regex_t *regex, options arg,
                   int *str_number, bool wname) {
  regmatch_t match;
  int shift = 0;
  while (1) {
    int res = regexec(regex, str + shift, 1, &match, 0);
    if (res != 0)
      break;
    else {
      if (arg.h == 0 && wname) printf("%s:", filename);
      if (arg.n == 1) printf("%d:", *str_number);
      for (int i = match.rm_so; i < match.rm_eo; i++) {
        printf("%c", str[i + shift]);
      }
    }
    printf("\n");
    shift = shift + match.rm_eo;
  }
}

void open_file(char *filename, regex_t *regex, options arg, bool wname, int i,
               char **argv) {
  if (!filename) {
    fprintf(stderr, "There is no name for file\n");
    return;
  }
  FILE *file = fopen(filename, "r");
  if (file) {
    char str[10000];
    str[0] = ' ';
    int counter = 0;
    int num = 1;
    int str_number = 0;
    while ((fgets(str, 10000, file) != NULL)) {
      str_number++;
      int regres = regexec(regex, str, 0, NULL, 0);
      
        if (arg.o == 1 && arg.v == 0 && arg.c == 0 && arg.l == 0) {
          print_matched(argv[i], str, regex, arg, &str_number, wname);
        } else if (arg.h) {
          output_str(str, (int)strlen(str));
          if (feof(file)) putchar('\n');
        } else if (arg.c) {
          counter++;
        } else {
          if (wname) printf("%s:", filename);
          if (arg.n) printf("%d:", num);
          output_str(str, (int)strlen(str));
          if (feof(file)) putchar('\n');
        }

      
    }
    fclose(file);
  } else {
    fprintf(stderr, "File do not exit, name: %s\n", filename);
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