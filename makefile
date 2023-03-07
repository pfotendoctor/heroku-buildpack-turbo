build-resolvers: build-resolver-linux build-resolver-darwin

.build:
	mkdir -p .build
build-resolver-darwin: .build
	cargo install heroku-nodejs-utils --root .build --bin resolve_version --git https://github.com/heroku/buildpacks-nodejs --target x86_64-apple-darwin --profile release
	mv .build/bin/resolve_version lib/vendor/resolve-version-darwin

build-resolver-linux: .build
	cargo install heroku-nodejs-utils --root .build --bin resolve_version --git https://github.com/heroku/buildpacks-nodejs --target x86_64-unknown-linux-musl --profile release
	mv .build/bin/resolve_version lib/vendor/resolve-version-linux