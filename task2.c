#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
//#include <sys/types.h>

int main () {
    pid_t pid=fork();

    if(pid == -1 ) {
        perror("Błąd fork");
        return 1;
    }


    if(pid == 0) {
        pid_t my_pid = getpid();
        if(my_pid % 3 == 0 ) {
            exit(0);
        }
        else {
            exit(1);
        }
    } 
    else {
        int status;

        wait(&status);
        if(WIFEXITED(status)) {
            int exit_code = WEXITSTATUS(status);
            if (exit_code == 1) {
                printf("Awaria procesu %d. Restart...", pid);
            } else {
                printf("Proces %d zakonczony poprawnie ", pid);
            }
        }
    }
    return 0;
}