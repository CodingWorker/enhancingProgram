Summary: Java(TM) profile viewer
Name: ProfileViewer
Version: 1.0.3
Release: 1
Group: Development/Tools
Copyright: Ulf Dittmer and Greg White
Source: http://www.ulfdittmer.com/profileviewer/ProfileViewer-1.0.3.zip
Prefix: /usr/local
BuildRoot: /var/tmp/profileviewer-root
Packager: Luc Maisonobe

%description
This Java application reads profiling information produced by the Java
interpreter or various flavour of the gprof tool and displays it for
easy interpretation.

%prep
%setup -c -T -n ProfileViewer
unzip %{SOURCE0}
find . -type d -exec chmod +x {} \;

%build
make -f Makefile.unix

%install
if [ -d $RPM_BUILD_ROOT ] ; then
  rm -fr $RPM_BUILD_ROOT
fi
make -f Makefile.unix install DESTDIR=$RPM_BUILD_ROOT

%post
cd ${RPM_INSTALL_PREFIX}/libexec/ProfileViewer
cp profileviewer.properties profileviewer.properties.old
sed "s,\(ProfileViewer.helpURL\)=.*,\1=file:${RPM_INSTALL_PREFIX}/doc/ProfileViewer/index.html," \
    < profileviewer.properties.old \
    > profileviewer.properties
rm profileviewer.properties.old

%files
%defattr(-,root,root)
%doc /usr/local/doc/ProfileViewer
/usr/local/libexec/ProfileViewer
/usr/local/bin/profileviewer

%clean
rm -rf $RPM_BUILD_ROOT
