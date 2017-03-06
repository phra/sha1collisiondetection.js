# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := sha1collisiondetectionjs
DEFS_Debug := \
	'-DNODE_GYP_MODULE_NAME=sha1collisiondetectionjs' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x

INCS_Debug := \
	-I/usr/include/nodejs/include/node \
	-I/usr/include/nodejs/src \
	-I/usr/include/nodejs/deps/uv/include \
	-I/usr/include/nodejs/deps/v8/include \
	-I$(srcdir)/node_modules/nan \
	-I$(srcdir)/sha1collisiondetection/lib

DEFS_Release := \
	'-DNODE_GYP_MODULE_NAME=sha1collisiondetectionjs' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-O3 \
	-ffunction-sections \
	-fdata-sections \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x

INCS_Release := \
	-I/usr/include/nodejs/include/node \
	-I/usr/include/nodejs/src \
	-I/usr/include/nodejs/deps/uv/include \
	-I/usr/include/nodejs/deps/v8/include \
	-I$(srcdir)/node_modules/nan \
	-I$(srcdir)/sha1collisiondetection/lib

OBJS := \
	$(obj).target/$(TARGET)/lib/myobject.o \
	$(obj).target/$(TARGET)/addon.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(builddir)/lib.target/sha1collisiondetection.so $(obj).target/sha1collisiondetection.so

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64 \
	-Wl,-rpath=\$$ORIGIN/lib.target/ \
	-Wl,-rpath-link=\$(builddir)/lib.target/

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64 \
	-Wl,-rpath=\$$ORIGIN/lib.target/ \
	-Wl,-rpath-link=\$(builddir)/lib.target/

LIBS := \
	-Wl,-rpath,/home/zio/code/sha1collisiondetection.js/sha1collisiondetection/bin/.libs

$(obj).target/sha1collisiondetectionjs.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/sha1collisiondetectionjs.node: LIBS := $(LIBS)
$(obj).target/sha1collisiondetectionjs.node: TOOLSET := $(TOOLSET)
$(obj).target/sha1collisiondetectionjs.node: $(OBJS) $(obj).target/sha1collisiondetection.so FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += $(obj).target/sha1collisiondetectionjs.node
# Add target alias
.PHONY: sha1collisiondetectionjs
sha1collisiondetectionjs: $(builddir)/sha1collisiondetectionjs.node

# Copy this to the executable output path.
$(builddir)/sha1collisiondetectionjs.node: TOOLSET := $(TOOLSET)
$(builddir)/sha1collisiondetectionjs.node: $(obj).target/sha1collisiondetectionjs.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/sha1collisiondetectionjs.node
# Short alias for building this executable.
.PHONY: sha1collisiondetectionjs.node
sha1collisiondetectionjs.node: $(obj).target/sha1collisiondetectionjs.node $(builddir)/sha1collisiondetectionjs.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/sha1collisiondetectionjs.node

