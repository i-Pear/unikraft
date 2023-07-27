UK_ROOT ?= $(PWD)/../../../
UK_LIBS ?= $(PWD)/../
LIBS := $(UK_LIBS)/lib-libc-test:$(UK_LIBS)/lib-musl:$(UK_LIBS)/lib-lwip

all:
	@$(MAKE) -C $(UK_ROOT) A=$(PWD) L=$(LIBS)

$(MAKECMDGOALS):
	@$(MAKE) -C $(UK_ROOT) A=$(PWD) L=$(LIBS) $(MAKECMDGOALS)
