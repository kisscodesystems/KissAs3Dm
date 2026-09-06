#!/bin/bash
#
# Runs the KissAs3Dm unit tests.
#
# This project holds two applications, so this script runs two test applications:
# - ApplicationUnitTestDemo is the ApplicationDemo itself, the demo application with the
#   three layers, the menu and the widgets of the framework
# - QuickUIUnitTestDemo is the QuickUIDemo itself, the reference application building one
#   of every component on one single screen
# Both of them are compiled against the current sources and run with adl. Every one of
# them builds the whole application under it, checks it, writes a report and quits.
#
# Every application displays the summary of its own run in its own window as well - the
# counts, the time it took, the exit code, the path of that report and the failed
# assertions - and it closes that window by itself a few seconds later. Those seconds are
# the reason this script takes a little longer than the runs themselves: SECONDS_TO_DISPLAY
# in test/com/kisscodesystems/KissAs3Ut/UnitTestRunner.as is the knob of it.
#
# The exit code of this script is the first non zero exit code of the two runs.
#
# The run of the demo application builds every widget of it, one after the other, with
# every element of every one of them, so it takes minutes and its window stands frozen
# while it is working: that is the run doing its job, not a hanging one. The timeout below
# is the one telling those two apart.
#
# ! On macOS: you have to have a valid license from harman: adt.lic !
# Without it adl prints the license banner and quits without running anything.
#
# ! The demo application talks to its own servers while it starts: it asks the api of the
# active servers and it loads the background image of its displaying style. Both of those
# are answered in about a second, so nothing of them is left in flight by the time the run
# is over - but with no network at all those answers never arrive and the run can be left
# waiting for them, until the timeout below kills it.
#
# The macos difference against KissAs3Dm_run_tests_linux.sh: macos has no timeout
# command, so run_with_timeout below does that job. Everything else is the same.
#
set -e
cd "$(dirname "$0")/.."
ROOT="$(pwd)"

# The folder of the air sdk. It can be given in the AIRSDK environment variable,
# otherwise it comes from .AIRSDK_HOME of the project root, and it is asked for
# once when there is no value stored there yet. See ./read_setting.sh.
source "$ROOT/read_setting.sh"
if [ -z "$AIRSDK" ]
then
  AIRSDK=$(read_setting AIRSDK_HOME "the folder of the air sdk, for example /Users/myUser/AIRSDK_51.2.1")
fi
# The framework the demo applications are built on is a project of its own,
# checked out next to this one: .KISSAS3FW_SRC points at the src folder of that
# checkout. It is asked for once, the same way the build asks for it.
KISSAS3FW_SRC=$(read_setting KISSAS3FW_SRC "the src folder of the KissAs3Fw checkout, for example /Users/myUser/sources/KissAs3Fw/src")
BUILD="$ROOT/build/testrun/as3dm"

# The two values every application of this project is built with, see
# build/scripts/macos/setup.sh. The suites of one run work inside one single frame, so
# that limit of the execution is the one thing keeping the runtime from stopping them
# halfway through with an error of its own.
SWF_FRAME_RATE=15
SWF_SCRIPT_LIMIT=1000

# Starts the given command and kills it if it has not finished in time.
# The exit code is the one of the command, or 124 like the timeout of linux.
function run_with_timeout()
{
  RWT_SECONDS=$1
  shift
  "$@" &
  RWT_PID=$!
  RWT_WAITED=0
  while kill -0 "$RWT_PID" 2>/dev/null
  do
    if [ "$RWT_WAITED" -ge "$RWT_SECONDS" ]
    then
      kill -9 "$RWT_PID" 2>/dev/null
      wait "$RWT_PID" 2>/dev/null
      return 124
    fi
    sleep 1
    RWT_WAITED=$((RWT_WAITED + 1))
  done
  wait "$RWT_PID"
  return $?
}

rm -rf "$BUILD"
mkdir -p "$BUILD"

FIRST_EXIT_CODE=0

# Compiles one test application, runs it and prints the report of it.
# $1 the name of the class of that application
# $2 the width of the window it is run in
# $3 the height of that window
# $4 the name of the file it writes its report into
# $5 the name of the descriptor it is run with
run_test_application()
{
  local classname="$1"
  local width="$2"
  local height="$3"
  local resultfile="$4"
  local descriptorname="$5"
  local swf="$BUILD/$classname.swf"
  local descriptor="$BUILD/$descriptorname"
  local result="$BUILD/$resultfile"

  echo
  echo "Compiling $classname.."
  "$AIRSDK/bin/mxmlc" +configname=air \
    -source-path="$KISSAS3FW_SRC" -source-path="$ROOT/src" -source-path="$ROOT/test" \
    -default-size "$width" "$height" \
    -default-frame-rate "$SWF_FRAME_RATE" \
    -default-script-limits "$SWF_SCRIPT_LIMIT" "$SWF_SCRIPT_LIMIT" \
    -use-network \
    -output="$swf" \
    "$ROOT/test/com/kisscodesystems/KissAs3Dm/$classname.as"

  # The descriptor has to sit next to the swf it points to. The application writes its
  # report next to that descriptor as well.
  cp "$ROOT/test/$descriptorname" "$descriptor"

  echo
  echo "Running $classname.."
  set +e
  run_with_timeout 600 "$AIRSDK/bin/adl" "$descriptor"
  local adl_exit=$?
  set -e

  if [ ! -f "$result" ]
  then
    echo "No result file at $result, $classname did not run (adl exit code: $adl_exit)."
    if [ "$FIRST_EXIT_CODE" -eq 0 ]
    then
      FIRST_EXIT_CODE=1
    fi
    return
  fi

  cat "$result"
  if [ "$FIRST_EXIT_CODE" -eq 0 ]
  then
    FIRST_EXIT_CODE=$adl_exit
  fi
}

# The window of every application is the very one it is built for: the components take
# their places from the size of the stage, so a window of another size would place all of
# them somewhere else. See build/ApplicationDemo.xml and build/QuickUIDemo.xml, and the
# descriptors of these two runs in the test folder.
run_test_application "ApplicationUnitTestDemo" 1600 1000 "KissAs3Dm-results.txt" "KissAs3Dm-app.xml"
run_test_application "QuickUIUnitTestDemo" 1682 1000 "KissAs3DmQuickUI-results.txt" "KissAs3DmQuickUI-app.xml"

exit "$FIRST_EXIT_CODE"
