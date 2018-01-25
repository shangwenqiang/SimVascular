# Copyright (c) Stanford University, The Regents of the University of
#               California, and others.
#
# All Rights Reserved.
#
# See Copyright-SimVascular.txt for additional details.
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject
# to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
# OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

ifeq ($(CLUSTER), x64_macosx)
    OPENCASCADE_SRCDIR = $(OPEN_SOFTWARE_SOURCES_TOPLEVEL)/opencascade-7.0.0
    OPENCASCADE_BINDIR = $(OPEN_SOFTWARE_BINARIES_TOPLEVEL)/opencascade-7.0.0
    OPENCASCADE_INCDIR   = -I$(OPENCASCADE_BINDIR)/include/opencascade
    ifeq ($(MAKE_WITH_OPENCASCADE_SHARED),1)
      OPENCASCADE_LIBDIR   = $(OPENCASCADE_BINDIR)/lib
    else
      OPENCASCADE_LIBDIR   = $(OPENCASCADE_BINDIR)/lib
    endif
    SV_OPENCASCADE_SO_PATH  = $(OPENCASCADE_BINDIR)/lib
    OPENCASCADE_LIBS     = $(LIBPATH_COMPILER_FLAG)$(OPENCASCADE_LIBDIR) \
	$(LIBFLAG)FWOSPlugin$(LIBLINKEXT) \
	$(LIBFLAG)TKBin$(LIBLINKEXT) \
	$(LIBFLAG)TKBinL$(LIBLINKEXT) \
	$(LIBFLAG)TKBinTObj$(LIBLINKEXT) \
	$(LIBFLAG)TKBinXCAF$(LIBLINKEXT) \
	$(LIBFLAG)TKBO$(LIBLINKEXT) \
	$(LIBFLAG)TKBool$(LIBLINKEXT) \
	$(LIBFLAG)TKBRep$(LIBLINKEXT) \
	$(LIBFLAG)TKCAF$(LIBLINKEXT) \
	$(LIBFLAG)TKCDF$(LIBLINKEXT) \
	$(LIBFLAG)TKernel$(LIBLINKEXT) \
	$(LIBFLAG)TKFeat$(LIBLINKEXT) \
	$(LIBFLAG)TKFillet$(LIBLINKEXT) \
	$(LIBFLAG)TKG2d$(LIBLINKEXT) \
	$(LIBFLAG)TKG3d$(LIBLINKEXT) \
	$(LIBFLAG)TKGeomAlgo$(LIBLINKEXT) \
	$(LIBFLAG)TKGeomBase$(LIBLINKEXT) \
	$(LIBFLAG)TKHLR$(LIBLINKEXT) \
	$(LIBFLAG)TKIGES$(LIBLINKEXT) \
	$(LIBFLAG)TKIVtk$(LIBLINKEXT) \
	$(LIBFLAG)TKLCAF$(LIBLINKEXT) \
	$(LIBFLAG)TKMath$(LIBLINKEXT) \
	$(LIBFLAG)TKMesh$(LIBLINKEXT) \
	$(LIBFLAG)TKMeshVS$(LIBLINKEXT) \
	$(LIBFLAG)TKOffset$(LIBLINKEXT) \
	$(LIBFLAG)TKOpenGl$(LIBLINKEXT) \
	$(LIBFLAG)TKPrim$(LIBLINKEXT) \
	$(LIBFLAG)TKService$(LIBLINKEXT) \
	$(LIBFLAG)TKShHealing$(LIBLINKEXT) \
	$(LIBFLAG)TKStd$(LIBLINKEXT) \
	$(LIBFLAG)TKStdL$(LIBLINKEXT) \
	$(LIBFLAG)TKSTEP$(LIBLINKEXT) \
	$(LIBFLAG)TKSTEP209$(LIBLINKEXT) \
	$(LIBFLAG)TKSTEPAttr$(LIBLINKEXT) \
	$(LIBFLAG)TKSTEPBase$(LIBLINKEXT) \
	$(LIBFLAG)TKSTL$(LIBLINKEXT) \
	$(LIBFLAG)TKTObj$(LIBLINKEXT) \
	$(LIBFLAG)TKTopAlgo$(LIBLINKEXT) \
	$(LIBFLAG)TKV3d$(LIBLINKEXT) \
	$(LIBFLAG)TKVCAF$(LIBLINKEXT) \
	$(LIBFLAG)TKVRML$(LIBLINKEXT) \
	$(LIBFLAG)TKXCAF$(LIBLINKEXT) \
	$(LIBFLAG)TKXDEIGES$(LIBLINKEXT) \
	$(LIBFLAG)TKXDESTEP$(LIBLINKEXT) \
	$(LIBFLAG)TKXMesh$(LIBLINKEXT) \
	$(LIBFLAG)TKXml$(LIBLINKEXT) \
	$(LIBFLAG)TKXmlL$(LIBLINKEXT) \
	$(LIBFLAG)TKXmlTObj$(LIBLINKEXT) \
	$(LIBFLAG)TKXmlXCAF$(LIBLINKEXT) \
	$(LIBFLAG)TKXSBase$(LIBLINKEXT)
endif
