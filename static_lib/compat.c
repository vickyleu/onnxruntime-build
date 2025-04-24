// compat.c
#include <stdlib.h>
#include <string.h>

// 为旧版glibc提供C23符号的兼容层
long long int __isoc23_strtoll(const char *nptr, char **endptr, int base) {
  return strtoll(nptr, endptr, base);
}

long int __isoc23_strtol(const char *nptr, char **endptr, int base) {
  return strtol(nptr, endptr, base);
}

unsigned long int __isoc23_strtoul(const char *nptr, char **endptr, int base) {
  return strtoul(nptr, endptr, base);
}
