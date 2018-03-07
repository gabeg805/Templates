/* -----------------------------------------------------------------------------
 * 
 * Name:    NAME
 * Author:  Gabriel Gonzalez
 * Email:   gabeg@bu.edu
 * License: The MIT License (MIT)
 * 
 * Syntax: SYNTAX
 * 
 * Description: DESCRIPTION
 * 
 * Notes: NOTES
 * 
 * -----------------------------------------------------------------------------
 */

/* Includes */
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <unistd.h>
#include "io.h"

/* Defines */
#define PROG "program_name"

/* -------------------------------------------------------------------------- */
/* Main */
int main(int argc, char **argv)
{
    /* Check if no arguments given */
    if (argc == 0) {
        usage();
        exit(0);
    }

    /* Command line options */
    static char *shortopts = "hqv";
    static struct option longopts[] = {
        {"help",    no_argument,   0,  'h' },
        {"quiet",   no_argument,   0,  'q' },
        {"verbose", no_argument,   0,  'v' },
        /* {"optname", optional_argument, 0,  '' }, */
        /* {"optname", required_argument, 0,  '' }, */
        {0,         0,             0,  0   }
    };

    /* Options */
    /* bool opt = false; */

    /* Parse options */
    int index = 0;
    int opt;

    while ((opt=getopt_long(argc, argv,shortopt, longopt, &index)) != -1)
    {
        switch (opt) {
        case 'h':
            usage();
            exit(0);
        case 'q':
            QUIET   = 1;
            VERBOSE = 0;
            break;
        case 'v':
            QUIET   = 0;
            VERBOSE = 1;
            break;
        default:
            usage(); 
            exit(1);
        }
    }

    return 0;
}

/* -------------------------------------------------------------------------- */
/* Print program usage */
void usage(void)
{
    printf("Usage: %s [options] <args>\n", PROG);
    printf("\n");
    printf("Options:\n");
    printf("    -h, --help\n");
    printf("        Print program usage.\n");
    printf("\n");
    printf("Arguments:\n");
    printf("\n");
}
