#!/bin/bash
# ------------------------------------------------------------------------------
# 
# Name:    NAME
# Author:  Gabriel Gonzalez
# 
# Brief: DESCRIPTION
# 
# ------------------------------------------------------------------------------


##
# Project name.
##
PROJECT="${0##*/}"

##
# Files/directories.
##
FILE=

##
# Options.
##
OPTION=

##
# Exit statuses.
##
EXIT_PROJECT_FUNCTION_ERROR=1

##
# Main.
##
main()
{
    # Parse options
    local short="h"
    local long="help"
    local args=$(getopt -o "${short}" --long "${long}" \
                        --name "${PROJECT}" -- "${@}")
    if [ $? -ne 0 ]; then
        usage
        exit 1
    fi
    eval set -- "${args}"

    while true
    do
        case "${1}" in
            -h|--help)
                usage
                return 0
                ;;
            *)
                break
                ;;
        esac
        shift
    done

    # Run options
    if [ -n "${OPTION}" ]; then
        :
    else
        :
    fi
}

##
# Print program usage.
##
usage()
{
    echo "Usage: ${PROJECT} [options] [args]"
    echo 
    echo "Options:"
    echo "    -h, --help"
    echo "        Print program usage."
    echo 
    echo "Arguments:"
    echo "    <arg>"
    echo "        Meaning of argument."
}

##
# Run script.
##
main "${@}"
