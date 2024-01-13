#include "stdio.h"
int a(int, int);
int main(int argc, char *argv[]) {
  int d = a(114513, 1);
  rintf("%d", d);
  return 0;
}
int a(int b, int c) { return b + c; }
