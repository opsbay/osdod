.PHONY: clean

osdod.xcodeproj:
	swift package generate-xcodeproj --xcconfig-overrides osdod.xcconfig

osdod: osdod.xcodeproj
	xcodebuild -target osdod

osdodc: osdod.xcodeproj
	xcodebuild -target osdodc

clean:
	swift package clean
	rm -rf ./build
	rm -rf ./osdod.xcodeproj

install: osdod osdodc
	cp build/Release/osdod /usr/bin/
	cp build/Release/osdodc /usr/bin/
	cp me.yarotsky.osdod.plist ~/Library/LaunchAgents/
