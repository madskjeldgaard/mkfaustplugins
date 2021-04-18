scplugins:
	echo "Compiling faust files to SuperCollider plugins..."
	faust2supercollider plugins/*/*.dsp

install: scplugins
	echo "Installing SuperCollider plugins to $(SCINSTALLPREFIX)"
	cp -v -r plugins/* $(SCINSTALLPREFIX)/FaustPlugins/	
