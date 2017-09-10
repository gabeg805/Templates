#!/bin/bash
# ******************************************************************************
# 
# Name:    NAME
# Author:  Gabriel Gonzalez
# Email:   gabeg@bu.edu
# License: The MIT License (MIT)
# 
# Syntax: SYNTAX
# 
# Description: DESCRIPTION
# 
# Notes: NOTES
# 
# ******************************************************************************

# Globals
PROG="${0##*/}"

# Options
VERBOSE=

# ******************************************************************************
# Main
main()
{
    [ $# -eq 0 ] && usage && exit 0

    short="hv"
    long="help,verbose"
    args=$(getopt -o "${short}" --long "${long}" --name "${PROG}" -- "${@}")

    [ $? -ne 0 ] && usage && exit 1
    eval set -- "${args}"

    # Parse options
    while true; do
        case "${1}" in
            # Usage
            -h|--help)
                usage
                exit 0
                ;;

            # Verbose output
            -v|--verbose)
                VERBOSE=true
                ;;

            # End of options
            --)
                break
                ;;
        esac
        shift
    done
}

# ******************************************************************************
# Print program usage
usage()
{
    echo "Usage: ${PROG} [options] [args]"
    echo
    echo "Options:"
    echo "    -h, --help"
    echo "        Print program usage."
    echo
    echo "    -v, --verbose"
    echo "        Verbose output."
    echo
    echo "Arguments:"
    echo "    <arg>         Meaning of argument."
}

# ******************************************************************************
# Run script
main "${@}"
