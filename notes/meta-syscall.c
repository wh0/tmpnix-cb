#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

int main() {
  int r = syscall(/* SYS_faccessat2 */ 439, AT_FDCWD, "README.md", R_OK, 0);
  if (r == -1) {
    perror("faccessat2");
  }
  r = syscall(499, -1);
  if (r == -1) {
    perror("syscall 499");
  }
  return 0;
}
