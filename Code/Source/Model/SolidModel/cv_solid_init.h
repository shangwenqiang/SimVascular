/* Copyright (c) Stanford University, The Regents of the University of
 *               California, and others.
 *
 * All Rights Reserved.
 *
 * See Copyright-SimVascular.txt for additional details.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject
 * to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef __CVSOLID_INIT_H
#define __CVSOLID_INIT_H

#include "SimVascular.h"
#include "svSolidModelExports.h" // For exports
#include "tcl.h"
#ifdef SV_USE_PYTHON
#include "Python.h"
#endif

extern "C" SV_EXPORT_SOLID int Solid_Init( Tcl_Interp *interp );

//Solid commands that need to be recognized in functions outside the solid model module
SV_EXPORT_SOLID int Solid_ObjectCmd( ClientData clientData, Tcl_Interp *interp,
		     int argc, CONST84 char *argv[] );

SV_EXPORT_SOLID void DeleteSolid( ClientData clientData );

#ifdef SV_USE_PYTHON

SV_EXPORT_SOLID double *getArrayFromDoubleList(PyObject* listObj,int &len);

SV_EXPORT_SOLID double **getArrayFromDoubleList2D(PyObject* listObj,int &lenx,int &leny);

SV_EXPORT_SOLID PyObject* importList1D(PyObject* self, PyObject* args);

SV_EXPORT_SOLID PyObject* importList2D(PyObject* self, PyObject* args);

#endif

#endif // __CVSOLID_INIT_H
