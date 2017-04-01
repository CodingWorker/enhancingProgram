#! /bin/sh

# find installation prefix (assuming this script is in $prefix/bin)
prefix=""
case $0 in
  /*)
    prefix=`echo $0 | sed 's,/[^/]*/[^/]*$,,'` ;;
  */*)
    prefix=`pwd`/`echo $0 | sed 's,/[^/]*/[^/]*$,,'` ;;
  *)
    IFS="${IFS= 	}"; save_IFS="$IFS"; IFS=":"
    for dir in $PATH; do
      if test -f $dir/$0 -a -x $dir/$0 ; then
        if test -z "$prefix" ; then
          prefix=`echo $dir | sed 's,/[^/]*$,,'`
        fi
      fi
    done
    IFS="$save_IFS"
esac

# initialize the environment
# (assuming the jars are in $prefix/libexec/ProfileViewer
#  and the documentation is in $prefix/doc/ProfileViewer-xx.yy)
jars=`ls $prefix/libexec/ProfileViewer/*.jar 2> /dev/null`
for j in "" $jars ; do
  if test ! -z "$j" ; then
    if test -z "${CLASSPATH}" ; then
      CLASSPATH=$j
    else
      CLASSPATH=$j:${CLASSPATH}
    fi
  fi
done
export CLASSPATH

propFile=`ls $prefix/libexec/ProfileViewer/*.properties 2> /dev/null`
if test -z "$propFile" ; then
  props=""
else
  props="-DProfileViewer.propertiesFile=$propFile"
fi

exec java $props ProfileViewer $*
