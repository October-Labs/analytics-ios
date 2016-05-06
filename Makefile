<<<<<<< HEAD
deps:
	@pod install

build: deps
	@./scripts/cli/bin/cli build

test: deps
	@./scripts/cli/bin/cli build test

release: deps
	@./scripts/cli/bin/cli release $(version)

.PHONY: deps build test release
=======
XCPRETTY := xcpretty -c && exit ${PIPESTATUS[0]}

SDK ?= "iphonesimulator"
DESTINATION ?= "platform=iOS Simulator,name=iPhone 5"
PROJECT := Analytics
XC_ARGS := -scheme $(PROJECT)-Example -workspace Example/$(PROJECT).xcworkspace -sdk $(SDK) -destination $(DESTINATION) ONLY_ACTIVE_ARCH=NO

bootstrap:
	.buildscript/bootstrap.sh

install: Example/Podfile Analytics.podspec
	pod install --project-directory=Example

clean:
	xcodebuild $(XC_ARGS) clean | $(XCPRETTY)

build:
	xcodebuild $(XC_ARGS) | $(XCPRETTY)

test:
	xcodebuild test $(XC_ARGS) | $(XCPRETTY)

xcbuild:
	xctool $(XC_ARGS)

xctest:
	xctool test $(XC_ARGS)

.PHONY: bootstrap test xctest build xcbuild clean
.SILENT:
>>>>>>> 7871504cb4a0f6ed5d475153e94e20de4a3e0ef6
