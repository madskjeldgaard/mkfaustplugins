ifeq ($(PREFIX),)
    PREFIX := install
endif

scplugins:
	echo "Compiling faust files to SuperCollider plugins..."
	faust2supercollider -d plugins/*/*.dsp -noprefix

install: scplugins
	echo "Installing Faust Plugins to $(PREFIX)"
	mkdir -p $(PREFIX)
	cp -v -r plugins/*/* $(PREFIX)/MKFaustPlugins
	rm -v -rf faust.*
