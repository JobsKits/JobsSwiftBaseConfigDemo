SHELL := /bin/zsh
BUILD_DIR ?= /tmp/jobs-bluetooth-learning
IOS_SDK := $(shell xcrun --sdk iphoneos --show-sdk-path)
CFLAGS := -std=c11 -Wall -Wextra -Werror -pedantic -ICommon
CXXFLAGS := -std=c++17 -Wall -Wextra -Werror -ICommon -ICPP -IOC
SANITIZERS := -fsanitize=address,undefined -fno-omit-frame-pointer

.PHONY: test typecheck
test:
	mkdir -p "$(BUILD_DIR)"
	xcrun clang $(CFLAGS) $(SANITIZERS) -c Common/JobsBLECodec.c -o "$(BUILD_DIR)/codec.o"
	xcrun clang++ $(CXXFLAGS) $(SANITIZERS) Tests/main.cpp "$(BUILD_DIR)/codec.o" -o "$(BUILD_DIR)/codec-tests"
	"$(BUILD_DIR)/codec-tests"
	xcrun clang++ $(CXXFLAGS) $(SANITIZERS) -fobjc-arc -framework Foundation OC/JobsCodecBridge.mm Tests/BridgeTests.mm "$(BUILD_DIR)/codec.o" -o "$(BUILD_DIR)/bridge-tests"
	"$(BUILD_DIR)/bridge-tests"
	xcrun swiftc -swift-version 6 -warnings-as-errors Swift/JobsLabFrame.swift Swift/JobsHeartRate.swift Tests/main.swift -o "$(BUILD_DIR)/swift-tests"
	"$(BUILD_DIR)/swift-tests"
	xcrun clang $(CFLAGS) -c Common/JobsBLECodec.c -o "$(BUILD_DIR)/codec-interop.o"
	xcrun swiftc -swift-version 6 -warnings-as-errors -import-objc-header Common/JobsBLECodec.h Swift/JobsLabFrame.swift Tests/JobsCInteropTests.swift "$(BUILD_DIR)/codec-interop.o" -o "$(BUILD_DIR)/interop-tests"
	"$(BUILD_DIR)/interop-tests"

typecheck:
	xcrun swiftc -swift-version 6 -warnings-as-errors -typecheck -target arm64-apple-ios17.0 -sdk "$(IOS_SDK)" Swift/JobsLabFrame.swift Swift/JobsHeartRate.swift Swift/JobsBLECentralLab.swift Swift/JobsBLEPeripheralLab.swift
	xcrun clang -Wall -Wextra -Werror -ICommon -IOC -fobjc-arc -fsyntax-only -target arm64-apple-ios17.0 -isysroot "$(IOS_SDK)" OC/JobsOCCentralLab.m
	xcrun clang++ $(CXXFLAGS) -fobjc-arc -fsyntax-only -target arm64-apple-ios17.0 -isysroot "$(IOS_SDK)" OC/JobsCodecBridge.mm
	xcrun clang $(CFLAGS) -fsyntax-only -target arm64-apple-ios17.0 -isysroot "$(IOS_SDK)" Common/JobsBLECodec.c
