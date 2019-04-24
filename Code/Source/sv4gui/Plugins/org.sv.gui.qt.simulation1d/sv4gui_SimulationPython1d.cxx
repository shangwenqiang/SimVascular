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

#include <Python.h>

#include <map>
#include "sv4gui_SimulationPython1d.h"
#include <mitkLogMacros.h>
#include <QMessageBox>

#include <vtkXMLPolyDataWriter.h>

//-------------
// Constructor
//-------------
sv4guiSimulationPython1d::sv4guiSimulationPython1d()
{

}

//------------
// Destructor
//------------
sv4guiSimulationPython1d::~sv4guiSimulationPython1d()
{
}

//--------------
// GenerateMesh   
//--------------
// Generate a 1D mesh. 
//
// Script arguments: 
//
//     output-directory: The output directory to write the mesh file.
//     centerlines-input-file: The input centerlines geometry (.vtp format). 
//     compute-mesh: Switch to enable computing just the mesh.
//     write-mesh-file: Switch to enable writing a mesh file.
//     mesh-output-file: The name of the mesh file to write (.vtp format).
//
bool sv4guiSimulationPython1d::GenerateMesh(const std::string& outputDir, const std::string& centerlinesFile,
                                            const std::string& meshFile) 
{
  std::string msg = "[sv4guiSimulationPython1d::GenerateMesh] ";
  MITK_INFO << msg << "---------- GenerateMesh ----------";
  sv4guiSimulationPython1dParamNames paramNames;

  // Create the script command.
  auto last = true;
  auto cmd = StartCommand();
  cmd += AddArgument(paramNames.OUTPUT_DIRECTORY, outputDir);
  cmd += AddArgument(paramNames.CENTERLINES_INPUT_FILE, centerlinesFile);
  cmd += AddArgument(paramNames.COMPUTE_MESH, "true");
  cmd += AddArgument(paramNames.WRITE_MESH_FILE, "true");
  cmd += AddArgument(paramNames.MESH_OUTPUT_FILE, meshFile, last);
  MITK_INFO << msg << "Execute cmd " << cmd;
  PyRun_SimpleString(cmd.c_str());
  MITK_INFO << msg << "Done!";
}

//---------------------
// GenerateSolverInput
//---------------------
// Generate a 1D solver input file.
//
// Script arguments: 
//
//    python generate_1d_mesh.py \
//        --output-directory $PWD/output \
//        --units mm \
//        --centerlines-input-file ${cl_file} \
//        --outlet-face-names-input-file ${outlet_face_names_file} \
//        --uniform-bc false \
//        --inflow-input-file ${inflow_file} \
//        --outflow-bc-type rcr \
//        --outflow-bc-input-file ${outflow_bc_input_file} \
//        --write-solver-file   \
//        --solver-output-file solver.in
//
//     output-directory: The output directory to write the mesh file.
//     centerlines-input-file: The input centerlines geometry (.vtp format). 
//     write-solver-file: Switch to enable writing a solver file.
//     solver-output-file: The name of the solver input file to write.
//
bool sv4guiSimulationPython1d::GenerateSolverInput(const sv4guiSimJob1d* job)
{
  std::string msg = "[sv4guiSimulationPython1d::GenerateSolverInput] ";
  MITK_INFO << msg << "---------- GenerateSolverInput ----------";
  sv4guiSimulationPython1dParamNames paramNames;

  // Create the script command.
  auto last = true;
  auto cmd = StartCommand();
  for (auto const& param : m_ParameterValues) {
      cmd += AddArgument(param.first, param.second);
  }
  cmd.pop_back();
  cmd += ")\n";

  MITK_INFO << msg << "Execute cmd " << cmd;
  PyRun_SimpleString(cmd.c_str());
  MITK_INFO << msg << "Done!";
}

//--------------
// StartCommand 
//--------------
// Start a command.
//
std::string sv4guiSimulationPython1d::StartCommand()
{
  std::string cmd = "import " + pythonModuleName + "\n";
  cmd += pythonModuleName + ".run(";
  return cmd;
}

//-------------
// AddArgument
//-------------
// Add an argument to a command string.
//
std::string sv4guiSimulationPython1d::AddArgument(const std::string& name, const std::string& value, bool last)
{
    std::string arg = name + "='" + value + "'";
    if (last)  {
        arg += ")\n";
    } else {
        arg += ",";
    }
    return arg;
}

bool sv4guiSimulationPython1d::AddParameter(const std::string& name, const std::string& value)
{
    m_ParameterValues.insert(std::pair<std::string,std::string>(name, value));
}

//-----------
// WriteMesh 
//-----------
// Write the surface mesh on which to generate the network to a VTK .vtp
// file. This file is read in by the Python fractal tree code.

bool sv4guiSimulationPython1d::WriteMesh(const std::string fileName)
{
/*
  vtkSmartPointer<vtkXMLPolyDataWriter> writer = vtkSmartPointer<vtkXMLPolyDataWriter>::New();
  writer->SetFileName(fileName.c_str());
  writer->SetInputData(this->meshPolyData);
  writer->Write();
*/
}

//-----------------
// WriteParameters
//-----------------
// Write the parameters used to generate a Purkinje network to a text file.

bool sv4guiSimulationPython1d::WriteParameters(const std::string fileName, 
    std::map<std::string, std::string>& params)
{

}
