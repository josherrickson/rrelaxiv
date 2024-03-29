# load.R fixes a bug with devtool's `help` to enable `help` on
# functions in this package, as well as loading the package
LOAD=R_PROFILE=load.R
RCMD=R -q -e

.PHONY:interactive
interactive:
	@$(LOAD) R -q --no-save

.PHONY:interactive-emacs
interactive-emacs:
	@$(LOAD) emacs -nw -f R

.PHONY:.devtools
.devtools:
	@$(RCMD) "devtools:::$(FUNC)($(DEVTOOLSARG))"

DEVTOOLSARG=
.PHONY:dependencies
dependencies: FUNC=install_deps
dependencies: DEVTOOLSARG=dependencies=TRUE

.PHONY:test
test: FUNC=test

.PHONY:check
check: FUNC=check

.PHONY:document
document: FUNC=document

.PHONY:build
build: FUNC=build

.PHONY:check_win_old
check_win_old: FUNC=check_win_oldrelease # Check & build on win-builder old release

.PHONY:check_win
check_win: FUNC=check_win_release        # ... on win-builder release

.PHONY:check_win_dev
check_win_dev: FUNC=check_win_devel    # ... on win-builder dev

.PHONY:check_mac
check_mac: FUNC=check_mac_release

.PHONY:build_site
build_site: FUNC=build_site

dependencies test check document build check_win check_win_dev check_win_old check_mac build_site: .devtools

.PHONY:clean
clean:
	git clean -Xfd
