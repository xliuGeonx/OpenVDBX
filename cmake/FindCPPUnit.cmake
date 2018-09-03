# Copyright (c) 2012-2016 DreamWorks Animation LLC
#
# All rights reserved. This software is distributed under the
# Mozilla Public License 2.0 ( http://www.mozilla.org/MPL/2.0/ )
#
# Redistributions of source code must retain the above copyright
# and license notice and the following restrictions and disclaimer.
#
# *     Neither the name of DreamWorks Animation nor the names of
# its contributors may be used to endorse or promote products derived
# from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# IN NO EVENT SHALL THE COPYRIGHT HOLDERS' AND CONTRIBUTORS' AGGREGATE
# LIABILITY FOR ALL CLAIMS REGARDLESS OF THEIR BASIS EXCEED US$250.00.
#

#-*-cmake-*-
# - Find CPPUNIT
#
# Author : Nicholas Yue yue.nicholas@gmail.com
#
# This auxiliary CMake file helps in find the CPPUNIT headers and libraries
#
# CPPUNIT_FOUND                  set if CPPUNIT is found.
# CPPUNIT_INCLUDE_DIR            CPPUNIT's include directory
# CPPUNIT_cppunit_LIBRARY        CPPUNIT libraries

FIND_PACKAGE ( PackageHandleStandardArgs )

FIND_PATH( CPPUNIT_LOCATION include/cppunit/Test.h
  "$ENV{CPPUNIT_ROOT}"
  NO_DEFAULT_PATH
  NO_CMAKE_ENVIRONMENT_PATH
  NO_CMAKE_PATH
  NO_SYSTEM_ENVIRONMENT_PATH
  NO_CMAKE_SYSTEM_PATH
  )

FIND_PACKAGE_HANDLE_STANDARD_ARGS ( CPPUnit
  REQUIRED_VARS CPPUNIT_LOCATION
  )

IF ( CPPUNIT_FOUND )
  
  SET( CPPUNIT_INCLUDE_DIR "${CPPUNIT_LOCATION}/include" CACHE STRING "CPPUNIT include directory")
  IF (CPPUnit_USE_STATIC_LIBS)
	SET( CPPUNIT_LIBRARY_NAME libcppunit.a)
  ELSE ()
	SET( CPPUNIT_LIBRARY_NAME cppunit)
  ENDIF ()
  FIND_LIBRARY ( CPPUnit_cppunit_LIBRARY ${CPPUNIT_LIBRARY_NAME}
	PATHS ${CPPUNIT_LOCATION}/lib/Release-x64 )
  
ENDIF ( CPPUNIT_FOUND )
