#!/bin/bash
kdialog --title $"OpenMandriva" --msgbox $"Work in progress. Please wait.. Step 1 of 3."
if rpm -q dnfdrake &>/dev/null; then
	kdialog --title $"OpenMandriva" --msgbox $"DnfDrake is already installed."
else
dnf clean all;dnf repolist
mkdir /tmp/dnfdrake-download
cd /tmp/dnfdrake-download
kdialog --title $"OpenMandriva" --msgbox $"Work in progress. Step 2 of 3. Please wait until the process is done, it may take a while"
dnf install -y dnf-utils python-dnf-plugin-versionlock
enable-repo unsupported
dnf download gambas3-gb-dbus-3.15.2-6.x86_64 gambas3-gb-form-3.15.2-6.x86_64 gambas3-gb-gtk3-3.15.2-6.x86_64 gambas3-gb-gui-3.15.2-6.x86_64 gambas3-gb-image-3.15.2-6.x86_64 gambas3-gb-qt5-3.15.2-6.x86_64 gambas3-runtime-3.15.2-6.x86_64 dnfdrake.noarch
#
rpm -ivh --nodeps *.rpm
	if rpm -q dnfdrake &>/dev/null; then
		kdialog --title $"OpenMandriva" --msgbox $"Installation succeeded."
#		disable-repo unsupported
	else
		kdialog --title $"OpenMandriva" --msgbox $"Installation failed."
#		disable-repo unsupported
	fi
fi

exit 0
