#!/bin/bash
# Yoav Berger

#validate the first argument
#echo "$1"
if [ "$1" != "system" ] && [ "$1" != "host" ] ; then
        echo "Invalid input"
        exit 0
#elif ["$1" = "host"]; then
        #echo "Invalid"
#else
    #echo "Invalid"
fi
#echo pri

# in case we have only host/ system without flags
if test "$#" -eq 1  ; 
    then if [ "$1" = "system" ] ; then
        cat "os-release"
        exit
    elif [ "$1" = "host" ] ; then
        cat "hostnamectl"
        exit
    fi
fi

#switch case and flags to avoid return double flag
#isInside=0
isName=0
isVersio=0
isPretty=0
isHome=0
isSupport=0
isStatic=0
isIcon=0
isMachine=0
isBoot=0
isVirtualization=0
isKernel=0
isArchitecture=0
# in case system was the first argument
if [ "$1" = "system" ] ; then
    #check all of the flags
    for arg in "$@"
    do
        case $arg in
            --name)
            if [ $isName = 0 ] ; then
                #grep -hw "NAME" "os-release" | cut -d'=' -f 2 | xargs
                isName=1
            fi
            ;;
            --version)
            if [ $isVersio = 0 ] ; then
                #grep -hw "VERSION" "os-release"| cut -d'=' -f 2 | xargs
                isVersio=1
            fi
            ;;
            --pretty_name)
            if [ $isPretty = 0 ] ; then
                #grep -hw "PRETTY_NAME" "os-release" | cut -d'=' -f 2 | xargs
                isPretty=1
            fi
            ;;
            --home_url)
            if [ $isHome = 0 ] ; then
                #grep -hw "HOME_URL" "os-release" | cut -d'=' -f 2 | xargs
                isHome=1
            fi
            ;;
            --support_url)
            if [ $isSupport = 0 ] ; then
                #grep -hw "SUPPORT_URL" "os-release" | cut -d'=' -f 2 | xargs
                isSupport=1
            fi
            ;;
            *)
            
            ;;
        esac
    done
fi

# in case host was the first argument
if [ "$1" = "host" ] ; then
    #check all of the flags
    for arg in "$@"
    do
        case $arg in
            --static_hostname)
            if [ $isStatic = 0 ] ; then
                #grep -hw "Static hostname" "hostnamectl" | cut -d':' -f 2 | xargs
                isStatic=1
            fi
            ;;
            --icon_name)
            if [ $isIcon = 0 ] ; then
                #grep -hw "Icon name" "hostnamectl" | cut -d':' -f 2 | xargs
                isIcon=1
            fi
            ;;
            --machine_id)
            if [ $isMachine = 0 ] ; then
                #grep -hw "Machine ID" "hostnamectl" | cut -d':' -f 2 | xargs
                isMachine=1
            fi
            ;;
            --boot_id)
            if [ $isBoot = 0 ] ; then
                #grep -hw "Boot ID" "hostnamectl" | cut -d':' -f 2 | xargs
                isBoot=1
            fi
            ;;
            --virtualization)
            if [ $isVirtualization = 0 ] ; then
                #grep -hw "Virtualization" "hostnamectl" | cut -d':' -f 2 | xargs
                isVirtualization=1
            fi
            ;;
            --kernel)
            if [ $isKernel = 0 ] ; then
                #grep -hw "Kernel" "hostnamectl" | cut -d':' -f 2 | xargs
                isKernel=1
            fi
            ;;
            --architecture)
            if [ $isArchitecture = 0 ] ; then
                #grep -hw "Architecture" "hostnamectl" | cut -d':' -f 2 | xargs
                isArchitecture=1
            fi
            ;;
            *)
            #default case
            ;;
        esac
    done
fi

# check if flag is 1 to print according to file order
if [ $isName = 1 ] ; then
    grep -hw "NAME" "os-release" | cut -d'=' -f 2 | xargs
fi
if [ $isVersio = 1 ] ; then
    grep -hw "VERSION" "os-release"| cut -d'=' -f 2 | xargs
fi
if [ $isPretty = 1 ] ; then
    grep -hw "PRETTY_NAME" "os-release" | cut -d'=' -f 2 | xargs
fi
if [ $isHome = 1 ] ; then
    grep -hw "HOME_URL" "os-release" | cut -d'=' -f 2 | xargs
fi
if [ $isSupport = 1 ] ; then
    grep -hw "SUPPORT_URL" "os-release" | cut -d'=' -f 2 | xargs
fi
if [ $isStatic = 1 ] ; then
    grep -hw "Static hostname" "hostnamectl" | cut -d':' -f 2 | xargs
fi
if [ $isIcon = 1 ] ; then
    grep -hw "Icon name" "hostnamectl" | cut -d':' -f 2 | xargs
fi
if [ $isMachine = 1 ] ; then
    grep -hw "Machine ID" "hostnamectl" | cut -d':' -f 2 | xargs
fi
if [ $isBoot = 1 ] ; then
    grep -hw "Boot ID" "hostnamectl" | cut -d':' -f 2 | xargs
fi
if [ $isVirtualization = 1 ] ; then
    grep -hw "Virtualization" "hostnamectl" | cut -d':' -f 2 | xargs
fi
if [ $isKernel = 1 ] ; then
    grep -hw "Kernel" "hostnamectl" | cut -d':' -f 2 | xargs
fi
if [ $isArchitecture = 1 ] ; then
    grep -hw "Architecture" "hostnamectl" | cut -d':' -f 2 | xargs
fi

#in case only invalid flags given
if [ "$1" = "system" ] && [ $isName = 0 ] && [ $isVersio = 0 ] && [ $isPretty = 0 ] && [ $isHome = 0 ] && [ $isSupport = 0 ] ; then
    cat "os-release"
fi
if [ "$1" = "host" ] && [ $isStatic = 0 ] && [ $isIcon = 0 ] && [ $isMachine = 0 ] && [ $isBoot = 0 ] && [ $isVirtualization = 0 ] && [ $isKernel = 0 ] && [ $isArchitecture = 0 ] ; then
    cat "hostnamectl"
fi
