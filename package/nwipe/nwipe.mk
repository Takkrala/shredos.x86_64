################################################################################
#
# nwipe
#
################################################################################

NWIPE_VERSION = v0.41
NWIPE_SITE = $(call github,Takkrala,nwipe,$(NWIPE_VERSION))
NWIPE_DEPENDENCIES = ncurses parted dmidecode coreutils
NWipe_SITE_METHOD = tarball
NWipe_SUBDIR = nwipe-0.41

define NWIPE_INITSH
	(cd $(@D) && cp ../../../package/nwipe/002-nwipe-banner-patch.sh $(@D) && ./002-nwipe-banner-patch.sh  && PATH="../../host/bin:${PATH}" ./autogen.sh);
endef

NWIPE_POST_PATCH_HOOKS += NWIPE_INITSH


$(eval $(autotools-package))
