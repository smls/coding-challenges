{my \a="BXS".parse-base(6*6);join "=>",({$/=$_//a;sum grep $/%%*,^$/}...a)}
