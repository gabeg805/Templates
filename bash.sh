#!/bin/bash
# ------------------------------------------------------------------------------
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
# ------------------------------------------------------------------------------

# Globals
PROG="${0##*/}"
PROGDIR=$(dirname "$(readlink -f "${0}")")

# Options
VERBOSE=

# Source utility
. "${PROGDIR}/../lib/bash/util.sh"

# Exit statuses
# EACTION=10

# ------------------------------------------------------------------------------
# Main
main()
{
    # Setup options
    if [ $# -eq 0 ]; then
        usage
        exit 0
    fi

    short="hv"
    long="help,verbose"
    args=$(getopt -o "${short}" --long "${long}" --name "${PROG}" -- "${@}")

    if [ $? -ne 0 ]; then
        usage
        exit 1
    fi

    eval set -- "${args}"

    # Define options
    local PARSED=

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
        PARSED=true
    done

    # Run options
    if [ -z "${PARSED}" ]; then
        print_err "No options specified. See '--help' for more information."
        exit ${EARG}
    elif [ -n "${OPTION}" ]; then
        # Execute option
        :
    else
        :
    fi
}

# ------------------------------------------------------------------------------
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

# ------------------------------------------------------------------------------
# Run script
main "${@}"
