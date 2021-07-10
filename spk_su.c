#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <unistd.h>

int main(int argc, char ** const argv) {
	if (argc < 2) {
        fprintf(stderr, "Usage: %s <package name>\n", argv[0]);
        return 1;
    }
    const char* name = argv[1];
    for (const char* s = name; *s != '\0'; ++s) {
        if (!isalpha(*s) && !isdigit(*s)) {
            fprintf(stderr, "Invalid package name: %s\n", name);
            return 2;
        }
    }

    char buffer[1024] = {};
    snprintf(buffer, sizeof(buffer), "/bin/sed -i 's/package/root/g' /var/packages/%s/conf/privilege", name);
    if (setuid(0) != 0){
        perror("Error");
        exit(127);
    }
    return system(buffer);
}