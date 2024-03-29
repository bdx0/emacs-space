Name:		idutils
Version:	4.5
Release:	1%{?dist}
Summary:	A simple, fast, high-capacity, language-independent identifier database tool

Group:		Development/Tools
License:	GPLv3+
URL:		http://www.gnu.org/software/idutils/
Source0:	http://ftp.gnu.org/gnu/idutils/%{name}-%{version}.tar.gz
BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildRequires:	emacs, gettext-devel
Requires(post): info
Requires(preun): info

%description
`mkid' is a simple, fast, high-capacity, language-independent
identifier database tool.  Actually, the term `identifier' is too
limiting--`mkid' stores tokens, be they program identifiers of any
form, literal numbers, or words of human-readable text.  Database
queries can be issued from the command-line, or from within emacs,
serving as an augmented tags facility.


%prep
%setup -q


%build
%configure
make %{?_smp_mflags}


%check
make check


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT
%find_lang %{name}
rm -f $RPM_BUILD_ROOT%{_infodir}/dir

%clean
rm -rf $RPM_BUILD_ROOT


%files -f %{name}.lang
%defattr(-,root,root,-)
%doc ABOUT-NLS AUTHORS COPYING ChangeLog NEWS README* THANKS TODO
%doc %{_mandir}/man1/*.1.gz
%{_bindir}/*
%{_datadir}/emacs/site-lisp/
%{_datadir}/id-lang.map
%{_infodir}/idutils.info*


%post
/sbin/install-info %{_infodir}/idutils.info.gz %{_infodir}/dir || :


%preun
if [ "$1" = 0 ]; then
  /sbin/install-info --delete %{_infodir}/idutils.info.gz %{_infodir}/dir || :
fi


%changelog
* Sat Oct 18 2008 Jim Meyering <meyering@redhat.com>
- Newer version of gnulib to fix test-program build failure on ppc.

* Fri Oct 17 2008 Jim Meyering <meyering@redhat.com>
- Include man1/*.1.gz and tweak Source0.

* Fri Sep 12 2008 Markus Armbruster <armbru@redhat.com>
- Initial build for Fedora
